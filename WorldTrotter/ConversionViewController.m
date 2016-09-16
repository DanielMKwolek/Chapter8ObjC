//
//  ViewController.m
//  WorldTrotter
//
//  Created by Daniel Kwolek on 9/13/16.
//  Copyright © 2016 Arcore. All rights reserved.
//

#import "ConversionViewController.h"

@interface ConversionViewController () <UITextFieldDelegate>

@property (nonatomic) IBOutlet UILabel *celsiusLabel;
@property (nonatomic) IBOutlet UITextField *fahrenheitField;
@property (nonatomic) double fahrenheitValue;
@property (nonatomic) double celsiusValue;

@end

@implementation ConversionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"ConversionViewController loaded its view.");
}


- (IBAction)fahrenheitFieldEditingChanged:(UITextField *)textField {
    NSNumber *num = [self.numberFormatter numberFromString:textField.text];
    if (num != nil) {
        self.fahrenheitValue = num.doubleValue;
    } else {
        self.celsiusLabel.text = @"???";
    }
}

- (IBAction)dismissKeyboard:(id)sender {
    [self.fahrenheitField resignFirstResponder];
}

- (void)setCelsiusValue:(double)celsiusValue {
    self.fahrenheitValue = celsiusValue * (9.0/5.0) + 32;
}
- (double)celsiusValue {
    return (self.fahrenheitValue - 32) * (5.0/9.0);
}

- (void)updateCelsiusLabel {
    self.celsiusLabel.text = [self.numberFormatter stringFromNumber:@(self.celsiusValue)];
}

- (void)setFahrenheitValue:(double)fahrenheitValue {
    _fahrenheitValue = fahrenheitValue;
    [self updateCelsiusLabel];
}

- (NSNumberFormatter *)numberFormatter {
    static NSNumberFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [NSNumberFormatter new];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        formatter.minimumFractionDigits = 0;
        formatter.maximumFractionDigits = 1;
    }
    return formatter;
}

// MARK: - Text Field Delegate
- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    NSCharacterSet *nonNum = [[NSCharacterSet alloc] init];
    nonNum = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
    BOOL replacementStringIsValid = [string isEqualToString:[string stringByTrimmingCharactersInSet:nonNum]];
    
    
    
    NSRange existingRange = [textField.text rangeOfString:@"."];
    BOOL hasExistingDecimalSeparator = (existingRange.location != NSNotFound);
    NSRange newRange = [string rangeOfString:@"."];
    BOOL wantsNewDecimalSeparator = (newRange.location != NSNotFound);
    if ((hasExistingDecimalSeparator && wantsNewDecimalSeparator) || !replacementStringIsValid) {
        return NO;
    } else {
        return YES; }
}

@end

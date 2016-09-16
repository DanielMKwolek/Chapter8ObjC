//
//  MapViewController.m
//  WorldTrotter
//
//  Created by Daniel Kwolek on 9/16/16.
//  Copyright © 2016 Arcore. All rights reserved.
//

#import "MapViewController.h"
#import "MapKit/MapKit.h"

@interface MapViewController ()

@property (nonatomic) MKMapView *mapView;


@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"MapViewController loaded its view.");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

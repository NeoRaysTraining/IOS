//
//  ViewController.m
//  MapKitExample
//
//  Created by test on 5/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController ()<MKMapViewDelegate,CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapKitOutlet;
@property (nonatomic,strong)CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startLocationUpdates];
    self.mapKitOutlet.showsUserLocation=YES;
    self.mapKitOutlet.delegate=self;
}

-(void)startLocationUpdates
{
    if(self.locationManager==nil)
    {
        self.locationManager=[[CLLocationManager alloc]init];
        self.locationManager.delegate=self;
    }
    else
    {
        nil;
    }
    if([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        [self.locationManager requestWhenInUseAuthorization];
    }
    else
    {
        nil;
    }
    self.locationManager.distanceFilter=100.00;
    self.locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    
    CLLocation *crnLoc = [locations lastObject];
    NSNumber *lat = [NSNumber numberWithDouble:crnLoc.coordinate.latitude];
    NSNumber *lon = [NSNumber numberWithDouble:crnLoc.coordinate.longitude];
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = lat.doubleValue;
    coordinate.longitude = lon.doubleValue;
    
    self.mapKitOutlet.centerCoordinate =coordinate;
    
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance(crnLoc.coordinate, 1000, 1000);
    [self.mapKitOutlet setRegion:region animated:YES];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    MKPointAnnotation *second = [[MKPointAnnotation alloc] init];
    second.coordinate = CLLocationCoordinate2DMake(coordinate.latitude+0.005, coordinate.longitude+0.005);
    second.title = @"Apple";
    second.subtitle = @"Steve!!!";
    
    MKPointAnnotation *third = [[MKPointAnnotation alloc] init];
    third.coordinate = CLLocationCoordinate2DMake(coordinate.latitude+0.004, coordinate.longitude);
    third.title = @"Apple";
    third.subtitle = @"Steve!!!";
    
    [self.mapKitOutlet addAnnotation:second];
    [self.mapKitOutlet addAnnotation:point];
    [self.mapKitOutlet addAnnotation:third];
    [self.locationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

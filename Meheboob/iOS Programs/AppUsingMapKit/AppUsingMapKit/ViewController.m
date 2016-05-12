//
//  ViewController.m
//  AppUsingMapKit
//
//  Created by test on 12/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    self.myMapKit.showsUserLocation = YES;
    self.myMapKit.delegate = self;
        [self startLocationUpdates];
   
}



-(void)startLocationUpdates{
    
    if (self.locationManager == nil) {
        self.locationManager = [[CLLocationManager alloc]init];
        
        self.locationManager.delegate = self;
    }
    
    
    else{
        nil;
    }
    
    
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    else{
        nil;
    }
    
    self.locationManager.distanceFilter = 100.0;
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [self.locationManager startUpdatingLocation];
    
}



-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{

    CLLocation *loc = [locations lastObject];
    NSNumber *myLatttitude = [NSNumber numberWithDouble:loc.coordinate.latitude];
    
    NSNumber *mylongitude = [NSNumber numberWithDouble:loc.coordinate.longitude];
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = myLatttitude.doubleValue;
    coordinate.longitude = mylongitude.doubleValue;
    
    self.myMapKit.centerCoordinate = coordinate;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc.coordinate, 1000, 1000);
    
    [self.myMapKit setRegion:region];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc]init];
    point.coordinate = coordinate;
    
    point.title = @"Where I Am";
    point.subtitle = @"I am here!!!";
    

    
    
    MKPointAnnotation *second = [[MKPointAnnotation alloc]init];
    
    second.coordinate = CLLocationCoordinate2DMake(coordinate.latitude+0.005, coordinate.longitude+0.005);

    
    
    
    second.title = @"NeoRays";
    second.subtitle = @"Meheboob";
    
    MKPointAnnotation *third = [[MKPointAnnotation alloc] init];
        third.coordinate = CLLocationCoordinate2DMake(coordinate.latitude+0.004, coordinate.longitude);
        third.title = @"IBM";
        third.subtitle = @"Datta";

    
    MKPointAnnotation *fourth = [[MKPointAnnotation alloc]init];
    
    fourth.coordinate = CLLocationCoordinate2DMake(coordinate.latitude+0.006, coordinate.longitude+0.006);
    
    fourth.title = @"Raghu";
    fourth.subtitle = @"ITC";
    
    [self.myMapKit addAnnotation:point];
    
        [self.myMapKit addAnnotation:second];
       [self.myMapKit addAnnotation:third];
    [self.myMapKit addAnnotation:fourth];
    [self.locationManager stopUpdatingLocation];
}






















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{


    [self.myMapKit setRegion:MKCoordinateRegionMake(userLocation.coordinate, MKCoordinateSpanMake(0.1f, 0.1f))];
}


//-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
//{
//    MKCoordinateRegion mapRegion;
//    mapRegion.center = mapView.userLocation.coordinate;
//    mapRegion.span.latitudeDelta = 0.2;
//    mapRegion.span.longitudeDelta = 0.2;
//    
//    [mapView setRegion:mapRegion animated: YES];
//}


@end

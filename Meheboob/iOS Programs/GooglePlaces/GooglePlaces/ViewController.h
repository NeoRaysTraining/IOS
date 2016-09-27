//
//  ViewController.h
//  GooglePlaces
//
//  Created by Mahaboobsab Nadaf on 27/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MapPoint.h"

#define kGOOGLE_API_KEY @"AIzaSyBDznQSyiGcau6dZzKpWOoWOnyt5JZmNV0"

//AIzaSyCTrolSJOp2odoGJzg5h9Fb1yrxS_ztpww
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
@interface ViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLLocationCoordinate2D currentCentre;
    int currenDist;
    int oldValue;
    BOOL firstLaunch;
}
- (IBAction)toolBarButtonPress:(id)sender;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
//- (IBAction)zinZout:(id)sender;

@end


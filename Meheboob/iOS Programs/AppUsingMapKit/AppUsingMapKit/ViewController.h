//
//  ViewController.h
//  AppUsingMapKit
//
//  Created by test on 12/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *myMapKit;
@property (strong, nonatomic)CLLocationManager *locationManager;
@end


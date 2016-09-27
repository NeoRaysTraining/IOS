//
//  ViewController.m
//  GooglePlaces
//
//  Created by Mahaboobsab Nadaf on 27/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    self.mapView.delegate = self;
     self.mapView.showsUserLocation = YES;
    CLLocationCoordinate2D annotationCord;
    annotationCord.latitude = 12.963829;
    annotationCord.longitude = 77.5342788;
    MKPointAnnotation *annotationpoint = [[MKPointAnnotation alloc]init];
    annotationpoint.coordinate = annotationCord;
    annotationpoint.title = @"Where I Am ?";
    annotationpoint.subtitle = @"Here I am";
    [_mapView addAnnotation:annotationpoint];
   // [self startLocationUpdates];
    
    // Do any additional setup after loading the view, typically from a nib.
   // CLLocationCoordinate2D annotationCord;
   // annotationCord.latitude = 12.9135;
  //  annotationCord.longitude = 77.4876;
   // MKPointAnnotation *annotationpoint = [[MKPointAnnotation alloc]init];
//    annotationpoint.coordinate = annotationCord;
//     [_mapView addAnnotation:annotationpoint];
    
   // self.mapView.showsUserLocation = YES;
//    currentCentre.latitude = 12.9135;
//    currentCentre.longitude = 77.4876;
    //Make this controller the delegate for the map view.
    //self.mapView.delegate = self;
    
    // Ensure that you can view your own location in the map view.
   // [self.mapView setShowsUserLocation:YES];
    
    //Instantiate a location object.
    locationManager = [[CLLocationManager alloc] init];
    
    //Make this controller the delegate for the location manager.
    [locationManager setDelegate:self];
    
    //Set some parameters for the location object.
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    firstLaunch=YES;
    [self startLocationUpdates];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






-(void)startLocationUpdates{
    
    if (locationManager == nil) {
        locationManager = [[CLLocationManager alloc]init];
        
        locationManager.delegate = self;
    }
    
    
    else{
        nil;
    }
    
    
    
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }
    
    else{
        nil;
    }
    
    locationManager.distanceFilter = 100.0;
    
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    
}


#pragma mark - MKMapViewDelegate methods.
-(void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views {
    //Zoom back to the user location after adding a new set of annotations.
    //Get the center point of the visible map.
    CLLocationCoordinate2D centre = [mv centerCoordinate];
    MKCoordinateRegion region;
    //If this is the first launch of the app, then set the center point of the map to the user's location.
    if (firstLaunch) {
        region = MKCoordinateRegionMakeWithDistance(locationManager.location.coordinate,10000,10000);
        firstLaunch=NO;
    }else {
        //Set the center point to the visible region of the map and change the radius to match the search radius passed to the Google query string.
        region = MKCoordinateRegionMakeWithDistance(centre,currenDist,currenDist);
    }
    //Set the visible region of the map.
    [mv setRegion:region animated:YES];
}
- (IBAction)toolBarButtonPress:(id)sender {
    
    UIBarButtonItem *button = (UIBarButtonItem *)sender;
    NSString *buttonTitle = [button.title lowercaseString];
    //Use this title text to build the URL query and get the data from Google.
    [self queryGooglePlaces:buttonTitle];
    
}

-(void) queryGooglePlaces: (NSString *) googleType {
    // Build the url string to send to Google. NOTE: The kGOOGLE_API_KEY is a constant that should contain your own API key that you obtain from Google. See this link for more info:
    // https://developers.google.com/maps/documentation/places/#Authentication
    NSString *url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/search/json?location=%f,%f&radius=%@&types=%@&sensor=true&key=%@", currentCentre.latitude, currentCentre.longitude, [NSString stringWithFormat:@"%i", currenDist], googleType, kGOOGLE_API_KEY];
    
    //Formulate the string as a URL object.
    NSURL *googleRequestURL=[NSURL URLWithString:url];
    
    // Retrieve the results of the URL.
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL: googleRequestURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    });
}

-(void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData
                          
                          options:kNilOptions
                          error:&error];
    
    //The results from Google will be an array obtained from the NSDictionary object with the key "results".
    NSArray* places = [json objectForKey:@"results"];
    
    //Write out the data to the console.
    NSLog(@"Google Data: %@", places);
    [self plotPositions:places];
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    //Get the east and west points on the map so you can calculate the distance (zoom level) of the current map view.
    MKMapRect mRect = self.mapView.visibleMapRect;
    MKMapPoint eastMapPoint = MKMapPointMake(MKMapRectGetMinX(mRect), MKMapRectGetMidY(mRect));
    MKMapPoint westMapPoint = MKMapPointMake(MKMapRectGetMaxX(mRect), MKMapRectGetMidY(mRect));
    
    //Set your current distance instance variable.
    currenDist = MKMetersBetweenMapPoints(eastMapPoint, westMapPoint);
    
    //Set your current center point on the map instance variable.
    currentCentre = self.mapView.centerCoordinate;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    CLLocation *loc = [locations lastObject];
    NSNumber *myLatttitude = [NSNumber numberWithDouble:loc.coordinate.latitude];
    
    NSNumber *mylongitude = [NSNumber numberWithDouble:loc.coordinate.longitude];
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = myLatttitude.doubleValue;
    coordinate.longitude = mylongitude.doubleValue;
    
    self.mapView.centerCoordinate = coordinate;
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc.coordinate, 1000, 1000);
    
    [self.mapView setRegion:region];
    
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
    
    [self.mapView addAnnotation:point];
    
    [self.mapView addAnnotation:second];
    [self.mapView addAnnotation:third];
    [self.mapView addAnnotation:fourth];
    [locationManager stopUpdatingLocation];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    
    [self.mapView setRegion:MKCoordinateRegionMake(userLocation.coordinate, MKCoordinateSpanMake(0.1f, 0.1f))];
}

-(void)plotPositions:(NSArray *)data {
    // 1 - Remove any existing custom annotations but not the user location blue dot.
    for (id<MKAnnotation> annotation in self.mapView.annotations) {
        if ([annotation isKindOfClass:[MapPoint class]]) {
            [self.mapView removeAnnotation:annotation];
        }
    }
    // 2 - Loop through the array of places returned from the Google API.
    for (int i=0; i<[data count]; i++) {
        //Retrieve the NSDictionary object in each index of the array.
        NSDictionary* place = [data objectAtIndex:i];
        // 3 - There is a specific NSDictionary object that gives us the location info.
        NSDictionary *geo = [place objectForKey:@"geometry"];
        // Get the lat and long for the location.
        NSDictionary *loc = [geo objectForKey:@"location"];
        // 4 - Get your name and address info for adding to a pin.
        NSString *name=[place objectForKey:@"name"];
        NSString *vicinity=[place objectForKey:@"vicinity"];
        // Create a special variable to hold this coordinate info.
        CLLocationCoordinate2D placeCoord;
        // Set the lat and long.
        placeCoord.latitude=[[loc objectForKey:@"lat"] doubleValue];
        placeCoord.longitude=[[loc objectForKey:@"lng"] doubleValue];
        // 5 - Create a new annotation.
        MapPoint *placeObject = [[MapPoint alloc] initWithName:name address:vicinity coordinate:placeCoord];
        [self.mapView addAnnotation:placeObject];
    }
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    // Define your reuse identifier.
    static NSString *identifier = @"MapPoint";
    
    if ([annotation isKindOfClass:[MapPoint class]]) {
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.animatesDrop = YES;
        return annotationView;
    }
    return nil;
}
- (IBAction)didClickStepper:(UIStepper *)sender{
    int value = sender.value;
    if (value > oldValue) {
        [self zoomin];
    }
    else{
        [self zoomOut];
    }
    oldValue = value;
}
-(IBAction)zoomin{
    MKCoordinateSpan span;
    span.latitudeDelta =_mapView.region.span.latitudeDelta/2;
    span.longitudeDelta =_mapView.region.span.longitudeDelta/2;
    MKCoordinateRegion region;
    region.span = span;
    region.center = _mapView.region.center;
    [self.mapView setRegion:region animated:YES];
    
}
-(IBAction)zoomOut{
    MKCoordinateSpan span;
    span.latitudeDelta = _mapView.region.span.latitudeDelta*2;
    span.longitudeDelta = _mapView.region.span.longitudeDelta*2;
    MKCoordinateRegion region;
    region.span = span;
    region.center = _mapView.region.center;
    [self.mapView setRegion:region animated:YES];
    
    
}



@end

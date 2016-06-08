//
//  ViewController.m
//  WeatherApp
//
//  Created by test on 6/7/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
  
self.degreeLabel.hidden=YES;
self.celsiusLabel.hidden=YES;

    [self.actiityIndicator startAnimating];
 self.cityNames=[[NSMutableArray alloc]initWithObjects:@"Bangalore",@"Chennai",nil];
NSURLSession *session = [NSURLSession sharedSession];
NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=656b9b92aa7547d18f955013160406&q=Bangalore&format=json&num_of_days=5"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        
        self.jsonData=[json valueForKey:@"data"];
        NSLog(@"All Json Values %@",self.jsonData);
    
    
        [self cityandName];
        [self imageDisplay];
         [self  dateDisplay]; 
        [self.actiityIndicator stopAnimating];
        [self.actiityIndicator setHidesWhenStopped:YES];
        self.celsiusLabel.hidden=NO;
        self.degreeLabel.hidden=NO;

}];
  
[dataTask resume];
    
}
-(void)cityandName{
    
for(NSArray *cityname in [self.jsonData valueForKey:@"request"]){
   
    self.cityDisplayLabel.text=[cityname valueForKey:@"query"];}
    
}

-(void)imageDisplay{
   
    for(NSArray *imageData in [self.jsonData valueForKey:@"current_condition" ]){
       
self.tempDisplaylabel.text=[imageData valueForKey:@"temp_C"];
        
for (NSArray *imageArray in [imageData valueForKey:@"weatherIconUrl"]) {
    
    
    NSString *image=[imageArray valueForKey:@"value"];
    NSLog(@"Image %@",image);
    
    for (NSArray *weatherDisc in [imageData valueForKey:@"weatherDesc"]) {
        NSLog(@"Weather Season %@",weatherDisc);
        self.weatherDiscLabel.text=[weatherDisc valueForKey:@"value"];
    }
    
    NSData *imagedata=[NSData dataWithContentsOfURL:[NSURL URLWithString:image]];
    self.imageViewDisplay.image=[UIImage imageWithData:imagedata];
   }
}
}

-(void)dateDisplay{
    
for (NSArray *dateDisp in [_jsonData valueForKey:@"weather"]) {
        
   self.DateDayLabel.text=[dateDisp valueForKey:@"date"];
}
    
}
- (IBAction)SwipeRight:(id)sender {
    NSLog(@"Inside Swipe Right");

[self.actiityIndicator startAnimating];
    
NSURLSession *session = [NSURLSession sharedSession];
NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=656b9b92aa7547d18f955013160406&q=Chennai&format=json&num_of_days=5"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        
self.jsonData=[json valueForKey:@"data"];
NSLog(@"All Json Values %@",self.jsonData);
        
        
        [self cityandName];
        [self imageDisplay];
    
        [self.actiityIndicator stopAnimating];
        [self.actiityIndicator setHidesWhenStopped:YES];
}];
    
[dataTask resume];
}
- (IBAction)swipeLeft:(id)sender {
    NSLog(@"Inside Swipe Left");
    [self.actiityIndicator startAnimating];


}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;{
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=656b9b92aa7547d18f955013160406&q=cityName&format=json&num_of_days=5"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        
        self.jsonData=[json valueForKey:@"data"];
        NSLog(@"All Json Values %@",self.jsonData);
        
        
        
        [self cityandName];
        [self imageDisplay];
        [self  dateDisplay];
        [self.actiityIndicator stopAnimating];
        [self.actiityIndicator setHidesWhenStopped:YES];
        self.celsiusLabel.hidden=NO;
        self.degreeLabel.hidden=NO;
 
    
    }];
    
    [dataTask resume];
    
    
}
@end




















































































































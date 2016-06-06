//
//  ViewController.m
//  WeatherAppDemo
//
//  Created by test on 6/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(strong,nonatomic)NSDictionary* json;
@property(strong,nonatomic)NSArray* jsonArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageDisplay.image = [UIImage imageNamed:@"dis1"];

    
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=a3ce7967a5ff4216bd555247160406&q=Bangalore&format=json&num_of_days=1"] completionHandler:^(NSData *data,NSURLResponse* response,NSError* error)
        {
          self.json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
           // NSLog(@"%@",json);
            
            [self showCurrentLocation];
            
            [self showCurrentTemperature];
                                }];
    [dataTask resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showCurrentLocation
{
     self.jsonArray = [self.json valueForKey:@"data"];
    NSLog(@"value is %@",self.jsonArray);
    
    for (NSArray* locationDetails in [self.jsonArray valueForKey:@"request"]) {
        NSLog(@"parsed data %@",locationDetails);
        
        NSLog(@"%@",[locationDetails valueForKey:@"type"]
              );
        NSLog(@"%@",[locationDetails valueForKey:@"query"]
              );
        self.cityLabel.text = [NSString stringWithFormat:@"%@",[locationDetails valueForKey:@"type"]];
        self.locationLabel.text = [locationDetails valueForKey:@"query"];
        
    }

}
-(void)showCurrentTemperature
{
    for (NSArray* weatherDetails in [self.jsonArray valueForKey:@"current_condition"]) {
        NSLog(@"parsed data %@",weatherDetails);
        
        NSLog(@"current temperature %@",[weatherDetails valueForKey:@"temp_C"]);
        
        self.currentTemperatureLabel.text = [weatherDetails valueForKey:@"temp_C"];
              }
    
    for (NSArray* imageDetails in [self.jsonArray valueForKey:@"weatherIconUrl"]) {
      //  NSLog(@"parsed data %@",imageDetails);
        
        self.imageDisplay.image = [UIImage imageNamed:[imageDetails valueForKey:@"value"]];
    }

}

@end

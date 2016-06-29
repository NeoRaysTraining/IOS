//
//  ViewController.m
//  AFNetworkingExample
//
//  Created by Mahaboobsab Nadaf on 29/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "AFURLSessionManager.h"
#import "AFHTTPSessionManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickMe:(id)sender {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=0494752a675946e292d55629160406&q=Delhi&format=json&num_of_days=3767" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error Report is : %@", error);
    }];
}
@end

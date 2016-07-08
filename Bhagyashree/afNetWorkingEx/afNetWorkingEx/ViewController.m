//
//  ViewController.m
//  afNetWorkingEx
//
//  Created by test on 6/30/16.
//  Copyright © 2016 test. All rights reserved.
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
- (IBAction)clickButton:(id)sender {
    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    
    [manager GET:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=a6806d269e4a4bf79e360847160406&q=Bengaluru&format=json&num_of_days=3" parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"json : %@",responseObject);
        NSLog(@"sucessful");
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"failed..");
    }];
}

@end

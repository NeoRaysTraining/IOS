//
//  ViewController2.m
//  AfNetWithDelegate
//
//  Created by test on 7/1/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"
#import "AFURLSessionManager.h"
#import "AFHTTPSessionManager.h"


@interface ViewController2 ()
@property (nonatomic,strong) NSArray* jsonArray;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)jsonMethod
{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    [manager GET:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=a6806d269e4a4bf79e360847160406&q=Bengaluru&format=json&num_of_days=3" parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
  //      NSLog(@"json : %@",responseObject);
        NSLog(@"sucessful");
        [self.delegate getData:responseObject];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"failed..");
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ViewController.m
//  SettingTimeApp
//
//  Created by test on 3/31/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    UIAlertView *myAlert = [[UIAlertView alloc]initWithTitle:@"TimeProject"
                                                     message:@"Clock is 24 hr format"
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles: nil];
    [myAlert show];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refreshButton:(id)sender {
    
    NSLog(@"Refresh button was clicked...");
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    NSString *time = [dateFormatter stringFromDate:[NSDate date]];
    [_timeDisplayLabel setText:time];
    
    UIAlertView *myAlert = [[UIAlertView alloc]initWithTitle:@"Current time is"
                                                     message:time
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles: nil];
    [myAlert show];

    
}
@end

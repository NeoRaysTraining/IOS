//
//  ViewController.m
//  SlowWorkerGCD
//
//  Created by Mahaboobsab Nadaf on 31/05/16.
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSString *)fetchSomethingFromServer{

    [NSThread sleepForTimeInterval:1];
    return @"Hi There!!";
}

-(NSString *)processData : (NSString *)data{


    [NSThread sleepForTimeInterval:2];
    
    return [data uppercaseString];
    
    
}

-(NSString *)calulateFirstResult : (NSString *)data{
    
    
    [NSThread sleepForTimeInterval:3];
    
    return [NSString stringWithFormat:@"Number Of Chars : %lu",(unsigned long)[data length]];
    
    
}

-(NSString *)calulateSecondResult : (NSString *)data{
    
    
    [NSThread sleepForTimeInterval:4];
    
    return [data stringByReplacingOccurrencesOfString:@"E" withString:@"e"];
    
    
}


- (IBAction)startButton:(id)sender {
    NSDate *startTime = [NSDate date];
    NSString *fetchData = [self fetchSomethingFromServer];
    NSString *processData = [self processData:fetchData];
    NSString *firstResult = [self calulateFirstResult:processData];
    NSString *secondResult = [self calulateSecondResult:processData];
    
    NSString *resultSummary = [NSString stringWithFormat:@"First : [%@]\nSecond : [%@]",firstResult,secondResult];
    
    self.resultsTextView.text = resultSummary;
    
    NSDate *endeTime = [NSDate date];
    
    NSLog(@"Completed in %f seconds ",[endeTime timeIntervalSinceDate:startTime]);
}



@end

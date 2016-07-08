//
//  ViewController.m
//  SlowWorkerAppGCD
//
//  Created by test on 5/31/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textViewOutlet;

@property (weak, nonatomic) IBOutlet UIButton *startWorking;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityOutlet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.activityOutlet.hidden=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSString *)fetchSomethingFromServer
{
    [NSThread sleepForTimeInterval:1];
    return @"Hi there";
}
- (NSString *)processData:(NSString *)data
{
    [NSThread sleepForTimeInterval:2];
    return [data uppercaseString];
}
- (NSString *)calculateFirstResult:(NSString *)data
{
    [NSThread sleepForTimeInterval:3];
    return [NSString stringWithFormat:@"Number of chars: %lu",
            (unsigned long)[data length]];
}
- (NSString *)calculateSecondResult:(NSString *)data
{
    [NSThread sleepForTimeInterval:4];
    return [data stringByReplacingOccurrencesOfString:@"E" withString:@"e"];
}

- (IBAction)startWorkAction:(id)sender {
//    NSDate *startTime = [NSDate date];
//    NSString *fetchedData = [self fetchSomethingFromServer];
//    NSString *processedData = [self processData:fetchedData];
//    NSString *firstResult = [self calculateFirstResult:processedData];
//    NSString *secondResult = [self calculateSecondResult:processedData];
//    NSString *resultsSummary = [NSString stringWithFormat:
//                                @"First: [%@]\nSecond: [%@]", firstResult,
//                                secondResult];
//    self.textViewOutlet.text = resultsSummary;
//    NSDate *endTime = [NSDate date];
//    NSLog(@"Completed in %f seconds",
//          [endTime timeIntervalSinceDate:startTime]);
 
    
//    NSDate *startTime = [NSDate date];
//    dispatch_queue_t queue =
//    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(queue, ^{
//        NSString *fetchedData = [self fetchSomethingFromServer];
//        NSString *processedData = [self processData:fetchedData];
//        NSString *firstResult = [self calculateFirstResult:processedData];
//        NSString *secondResult = [self calculateSecondResult:processedData];
//        NSString *resultsSummary = [NSString stringWithFormat:
//                                    @"First: [%@]\nSecond: [%@]", firstResult,
//                                    secondResult];
//        self.textViewOutlet.text = resultsSummary;
//        NSDate *endTime = [NSDate date];
//        NSLog(@"Completed in %f seconds",[endTime timeIntervalSinceDate:startTime]);
//    });
    
//    NSDate *startTime = [NSDate date];
//    dispatch_queue_t queue =
//    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(queue, ^{
//        NSString *fetchedData = [self fetchSomethingFromServer];
//        NSString *processedData = [self processData:fetchedData];
//        NSString *firstResult = [self calculateFirstResult:processedData];
//        NSString *secondResult = [self calculateSecondResult:processedData];
//        NSString *resultsSummary = [NSString stringWithFormat:
//                                    @"First: [%@]\nSecond: [%@]", firstResult,
//                                    secondResult];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.textViewOutlet.text = resultsSummary;
//        });
//        NSDate *endTime = [NSDate date];
//        NSLog(@"Completed in %f seconds",
//              [endTime timeIntervalSinceDate:startTime]);
//    });
    
    
//    NSDate *startTime = [NSDate date];
//    self.activityOutlet.hidden=NO;
//    self.startWorking.enabled = NO;
//    [self.activityOutlet startAnimating];
//    dispatch_queue_t queue =
//    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(queue, ^{
//        NSString *fetchedData = [self fetchSomethingFromServer];
//        NSString *processedData = [self processData:fetchedData];
//        NSString *firstResult = [self calculateFirstResult:processedData];
//        NSString *secondResult = [self calculateSecondResult:processedData];
//        NSString *resultsSummary = [NSString stringWithFormat:
//                                    @"First: [%@]\nSecond: [%@]", firstResult,
//                                    secondResult];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.textViewOutlet.text = resultsSummary;
//            self.startWorking.enabled = YES;
//            [self.activityOutlet stopAnimating];
//        });
//        NSDate *endTime = [NSDate date];
//        NSLog(@"Completed in %f seconds",
//              [endTime timeIntervalSinceDate:startTime]);
//    });
    
    
    
    NSDate *startTime = [NSDate date];
    self.startWorking.enabled = NO;
    self.startWorking.alpha = 0.5f;
    [self.activityOutlet startAnimating];
    dispatch_queue_t queue =
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSString *fetchedData = [self fetchSomethingFromServer];
        NSString *processedData = [self processData:fetchedData];
        __block NSString *firstResult;
        __block NSString *secondResult;
        dispatch_group_t group = dispatch_group_create(); dispatch_group_async(group, queue, ^{
            firstResult = [self calculateFirstResult:processedData];
        });
        dispatch_group_async(group, queue, ^{
            secondResult = [self calculateSecondResult:processedData];
        });
        dispatch_group_notify(group, queue, ^{
            NSString *resultsSummary = [NSString stringWithFormat:
                                        @"First: [%@]\nSecond: [%@]",
                                        firstResult,
                                        secondResult];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.textViewOutlet.text = resultsSummary;
                self.startWorking.enabled = YES;
                self.startWorking.alpha = 1;
                [self.activityOutlet stopAnimating];
            });
            NSDate *endTime = [NSDate date];
            NSLog(@"Completed in %f seconds",
                   [endTime timeIntervalSinceDate:startTime]);
        });
    });
}
@end

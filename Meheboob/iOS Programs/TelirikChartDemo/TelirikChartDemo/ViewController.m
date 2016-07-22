//
//  ViewController.m
//  TelirikChartDemo
//
//  Created by Mahaboobsab Nadaf on 22/07/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#import <TelerikUI/TelerikUI.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *randomNumericData = [[NSMutableArray alloc] init];
    for (int i=0; i<10; i++) {
        [randomNumericData addObject:[[TKChartDataPoint alloc] initWithX:@(i) Y:@(arc4random()%100)]];
    }
    self.chartView.allowAnimations = YES;
    self.chartView.hidden = NO;
    self.chartView.title.text = @"Todays Graph";
    
    [self.chartView addSeries:[[[TKChartLineSeries alloc]init ]initWithItems:randomNumericData]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

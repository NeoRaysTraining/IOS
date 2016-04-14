//
//  ViewController.m
//  SegmentedControlAndSwitchDemo
//
//  Created by test on 4/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UISwitch *switchOutlet;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControlOutlet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.segmentedControlOutlet setHidden:YES];
}
- (IBAction)switchActionButton:(id)sender {
    
    if ([_switchOutlet isOn]) {
        [self.segmentedControlOutlet setHidden:NO];
    }
    else
    {
        [self.segmentedControlOutlet setHidden:YES];
    }
}
- (IBAction)segmentedControlAction:(id)sender {
    
    if(_segmentedControlOutlet.selectedSegmentIndex==0)
    {
        self.view.backgroundColor=[UIColor greenColor];
    }
    else if (_segmentedControlOutlet.selectedSegmentIndex==1)
    {
        self.view.backgroundColor=[UIColor blueColor];
    }
    else
    {
        self.view.backgroundColor=[UIColor redColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

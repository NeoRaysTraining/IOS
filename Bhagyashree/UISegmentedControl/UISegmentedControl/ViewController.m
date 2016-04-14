//
//  ViewController.m
//  UISegmentedControl
//
//  Created by test on 4/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UISwitch *switchOutlet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.segmentedControl.hidden=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)segmentedControlAction:(id)sender {
    if(_segmentedControl.selectedSegmentIndex==0)
    {
        self.view.backgroundColor=[UIColor redColor];
    }
    else if(_segmentedControl.selectedSegmentIndex==1)
    {
        self.view.backgroundColor=[UIColor orangeColor];
    }
    else
    {
        self.view.backgroundColor=[UIColor purpleColor];
    }
}
- (IBAction)switchAction:(id)sender {
    if(self.switchOutlet.isOn)
    {
        self.segmentedControl.hidden=NO;
    }
    else
    {
        self.segmentedControl.hidden=YES;
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

@end

//
//  Blue.m
//  TabBarExample
//
//  Created by test on 4/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "Blue.h"

@interface Blue ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControler;
@property (weak, nonatomic) IBOutlet UISwitch *switchOutlet;

@end

@implementation Blue

- (void)viewDidLoad {
    [super viewDidLoad];

    self.segControler.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)switchButton:(id)sender {
    if(self.switchOutlet.isOn)
    {
        self.segControler.hidden=NO;
    }
    else{
        self.segControler.hidden=YES;
    }
}
- (IBAction)segControlerAction:(id)sender {
    if(self.segControler.selectedSegmentIndex==0)
    {
        self.view.backgroundColor=[UIColor grayColor];
    }
    else if (self.segControler.selectedSegmentIndex==1)
    {
        self.view.backgroundColor=[UIColor greenColor];
    }
    else{
        self.view.backgroundColor=[UIColor redColor];
    }
}

@end

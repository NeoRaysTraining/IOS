//
//  ViewController.m
//  SegmentandSwitch
//
//  Created by test on 4/14/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentcontrolOutlet;
@property (weak, nonatomic) IBOutlet UISwitch *switchOutlet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
self.segmentcontrolOutlet.hidden=YES;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchButton:(id)sender

{

if(self.switchOutlet.isOn)
{

    self.segmentcontrolOutlet.hidden=YES;

}
else
{
    self.segmentcontrolOutlet.hidden=NO;

}
    



}


- (IBAction)segementControlBotton:(id)sender
{
    
    if (self.segmentcontrolOutlet.selectedSegmentIndex==0)
    {
        self.view.backgroundColor=[UIColor grayColor];
    }


    else if (self.segmentcontrolOutlet.selectedSegmentIndex==1)
    {
        self.view.backgroundColor=[UIColor blueColor];
    }
 


}


@end

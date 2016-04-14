//
//  ViewController.m
//  SegmentsAndSwitches
//
//  Created by test on 14/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentBarOutlet;
@property (weak, nonatomic) IBOutlet UISwitch *switchOutletOnOff;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.segmentBarOutlet.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)segmentActions:(id)sender {
    
    if(self.segmentBarOutlet.selectedSegmentIndex == 0)
    {
        self.view.backgroundColor = [UIColor grayColor];
    }
    
  else  if(self.segmentBarOutlet.selectedSegmentIndex == 1)
    {
        self.view.backgroundColor = [UIColor greenColor];
    }
    
  else if(self.segmentBarOutlet.selectedSegmentIndex == 2)
  {
      self.view.backgroundColor = [UIColor redColor];
  }

    
}
- (IBAction)switchActions:(id)sender {
    
    
    if(self.switchOutletOnOff.isOn){
    
        self.segmentBarOutlet.hidden = YES;
    
    }
    
    else{
        self.segmentBarOutlet.hidden = NO;
    }
}


@end

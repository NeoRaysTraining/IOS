//
//  ViewController.m
//  UITabBarController
//
//  Created by test on 14/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControlers;
@property (weak, nonatomic) IBOutlet UISwitch *switchButtonOutlet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.segmentControlers.hidden =YES;

   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segmentControlAction:(id)sender {
    
    if(self.segmentControlers.selectedSegmentIndex == 0)
    {
        self.view.backgroundColor = [UIColor grayColor];
    }
    
    else   if(self.segmentControlers.selectedSegmentIndex == 1)
    {
        self.view.backgroundColor = [UIColor blueColor];
    }
    

    
    else   if(self.segmentControlers.selectedSegmentIndex == 2)
    {
        self.view.backgroundColor = [UIColor lightGrayColor];
    }
    
    else   if(self.segmentControlers.selectedSegmentIndex == 3)
    {
        self.view.backgroundColor = [UIColor greenColor];
    }
    

    
}
- (IBAction)switchAction:(id)sender {
    
    
    if(self.switchButtonOutlet.isOn){
    
        self.segmentControlers.hidden = NO;
    }
    
    else{
    
        self.segmentControlers.hidden =YES;
    }
}


@end

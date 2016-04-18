//
//  ViewController.m
//  UIGestureDemo
//
//  Created by test on 4/15/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *gestureNameLabel;
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
- (IBAction)tapGesture:(id)sender {
    
    [self.gestureNameLabel setText:@"Tab Gesture"];
    
    
}
- (IBAction)DoubleTap:(id)sender {
    
    [self.gestureNameLabel setText:@"DoubleTab Gesture"];
}
- (IBAction)rightSwipe:(id)sender {
    
    [self.gestureNameLabel setText:@"right swipe Gesture"];
}
- (IBAction)upSwipe:(id)sender {
    
    [self.gestureNameLabel setText:@"up swipe Gesture"];
}
- (IBAction)pinchGesture:(id)sender {
    
    [self.gestureNameLabel setText:@"pinch Gesture"];
}
- (IBAction)panGesture:(id)sender {
    
    [self.gestureNameLabel setText:@" pan Gesture"];
}
- (IBAction)rotationGesture:(id)sender {
    
    [self.gestureNameLabel setText:@"rotation Gesture"];
}
- (IBAction)lognPressGesture:(id)sender {
    
    [self.gestureNameLabel setText:@"long press Gesture"];
}

@end

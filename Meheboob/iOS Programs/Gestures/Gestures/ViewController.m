//
//  ViewController.m
//  Gestures
//
//  Created by test on 15/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *myLabel;
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
    
    self.myLabel.text = @"Tap Gesture";
    
}
- (IBAction)swipeGesture:(id)sender {
    
    self.myLabel.text = @"Swipe Gesture";
}
- (IBAction)longPressGesture:(id)sender {
    
    self.myLabel.text = @"Long Press Gesture";
}
- (IBAction)pinchGesture:(id)sender {
    
    self.myLabel.text = @"Pinch Gesture";
}

- (IBAction)RotationGesture:(id)sender {
    
    self.myLabel.text = @"Rotation Gesture";
}
- (IBAction)panGesture:(id)sender {
    
    self.myLabel.text = @"Pan Gesture";
}
- (IBAction)ScreenRdgeGesture:(id)sender {
    
    self.myLabel.text = @"Tap Gesture";
}

- (IBAction)swipeLefe:(id)sender {
    
    self.myLabel.text = @"Swipe left Gesture";
}


@end

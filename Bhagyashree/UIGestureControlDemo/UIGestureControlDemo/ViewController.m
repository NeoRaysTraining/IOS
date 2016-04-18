//
//  ViewController.m
//  UIGestureControlDemo
//
//  Created by test on 4/15/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@end

@implementation ViewController
- (IBAction)swipeRight:(id)sender {
    self.displayLabel.text = @"Swipe Right";
}
- (IBAction)swipeLeft:(id)sender {
    self.displayLabel.text = @"Swipe Left";
}
- (IBAction)pinch:(id)sender {
    self.displayLabel.text = @"Pinch Gesture";

}
- (IBAction)rotate:(id)sender {
    self.displayLabel.text = @"Rotate Gesture";
}
- (IBAction)screenEdgePan:(id)sender {
    self.displayLabel.text = @"Screen Edge Pan Gesture";

}
- (IBAction)longpress:(id)sender {
    self.displayLabel.text = @"Long Press Gesture";

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tap:(id)sender {
    self.displayLabel.text = @"Tap Gesture";
}

@end

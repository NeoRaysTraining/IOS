//
//  UIViewAndGesture.m
//  UIGestureControlDemo
//
//  Created by test on 4/15/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "UIViewAndGesture.h"

@interface UIViewAndGesture ()
@property (weak, nonatomic) IBOutlet UIView *uiViewOutlet;

@end

@implementation UIViewAndGesture
- (IBAction)uiViewTap:(id)sender {
    self.uiViewOutlet.frame = CGRectMake(self.uiViewOutlet.frame.origin.x, self.uiViewOutlet.frame.origin.y, self.uiViewOutlet.frame.size.height*2, self.uiViewOutlet.frame.size.width*2);
}

- (IBAction)doubleTap:(id)sender {
    self.uiViewOutlet.frame = CGRectMake(self.uiViewOutlet.frame.origin.x, self.uiViewOutlet.frame.origin.y, 100,100);
}
- (IBAction)swipeRight:(id)sender {
    self.uiViewOutlet.frame = CGRectMake(self.uiViewOutlet.frame.origin.x+20, self.uiViewOutlet.frame.origin.y, 100, 100);
}
- (IBAction)swipeDown:(id)sender {
        self.uiViewOutlet.frame = CGRectMake(self.uiViewOutlet.frame.origin.x, self.uiViewOutlet.frame.origin.y+20, 100, 100);
}
- (IBAction)swipeUp:(id)sender {
        self.uiViewOutlet.frame = CGRectMake(self.uiViewOutlet.frame.origin.x, self.uiViewOutlet.frame.origin.y-20, 100, 100);
}

- (IBAction)swipeLeft:(id)sender {
        self.uiViewOutlet.frame = CGRectMake(self.uiViewOutlet.frame.origin.x-20, self.uiViewOutlet.frame.origin.y, 100, 100);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

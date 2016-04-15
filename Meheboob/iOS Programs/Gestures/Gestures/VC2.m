//
//  VC2.m
//  Gestures
//
//  Created by test on 15/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "VC2.h"

@implementation VC2

- (IBAction)tapGesture:(id)sender {
    
    NSLog(@"Tap Gesture clicked");
    
    
   // self.subView.frame = CGRectMake(10, 20, 100, 200);
    
     self.subView.frame = CGRectMake(self.subView.frame.origin.x, self.subView.frame.origin.y, 240, 128);
    
}
- (IBAction)doubleTap:(id)sender {
    
    NSLog(@"Inside Double tap");
    
    
    //self.subView.frame = CGRectMake(self.subView.frame.origin.x, self.subView.frame.origin.y, 240, 128);
}
- (IBAction)swipeUP:(id)sender {
    NSLog(@"Inside swipe Up");
   // self.subView.frame = CGRectMake(200, 236, 240, 128);
    
     self.subView.frame = CGRectMake(self.subView.frame.origin.x, self.subView.frame.origin.y-40, 240, 128);
    
}

- (IBAction)SwipeDown:(id)sender {
    
    NSLog(@"Inside Swipe down");
    //self.subView.frame = CGRectMake(10, 20, 240, 128);
    
     self.subView.frame = CGRectMake(self.subView.frame.origin.x, self.subView.frame.origin.y+40, 240, 128);
}
@end

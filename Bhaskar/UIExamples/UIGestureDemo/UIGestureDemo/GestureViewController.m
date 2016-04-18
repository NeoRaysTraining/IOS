//
//  GestureViewController.m
//  UIGestureDemo
//
//  Created by test on 4/15/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "GestureViewController.h"
@interface GestureViewController()



@end
@implementation GestureViewController

@synthesize tempView;
- (IBAction)swipeRightAction:(id)sender {
    
    
    
     self.tempView.frame= CGRectMake(self.tempView.frame.origin.x+10, self.tempView.frame.origin.y, self.tempView.frame.size.width,self.tempView.frame.size.height);
    
    //self.tempView.backgroundColor=[UIColor redColor];
    
}
- (IBAction)singelTapDoubleTheSize:(id)sender {
    
    self.tempView.frame= CGRectMake(self.tempView.frame.origin.x, self.tempView.frame.origin.y, self.tempView.frame.size.width*2,self.tempView.frame.size.height*2);
}
- (IBAction)leftSwipe:(id)sender {
    
    self.tempView.frame= CGRectMake(self.tempView.frame.origin.x-10, self.tempView.frame.origin.y, self.tempView.frame.size.width,self.tempView.frame.size.height);
}
- (IBAction)doubleTapMakeItToOrinalSize:(id)sender {
    self.tempView.frame= CGRectMake(self.tempView.frame.origin.x, self.tempView.frame.origin.y, 100,100);
}

- (IBAction)topSwipe:(id)sender {
    
    self.tempView.frame= CGRectMake(self.tempView.frame.origin.x, self.tempView.frame.origin.y-10, self.tempView.frame.size.width,self.tempView.frame.size.height);

}

- (IBAction)downSwipe:(id)sender {
    
    self.tempView.frame= CGRectMake(self.tempView.frame.origin.x, self.tempView.frame.origin.y+10, self.tempView.frame.size.width,self.tempView.frame.size.height);
}

@end

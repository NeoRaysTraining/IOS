//
//  ViewController.m
//  multipleviewDemo
//
//  Created by test on 8/3/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "ViewController.h"
#import "YellowViewController.h"
#import "BlueViewController.h"

@interface ViewController ()

@property (strong,nonatomic) YellowViewController *yellowController;

@property (strong,nonatomic)  BlueViewController *blueController;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.blueViewController = [self.storyboard
//                               instantiateViewControllerWithIdentifier:
//                               @"Blue"];
//    [self.view insertSubview:self.blueViewController.view atIndex:0];
    
    self.blueController =[self.storyboard instantiateViewControllerWithIdentifier:@"Blue"];
    [self.view insertSubview:self.blueController.view atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    if (!self.blueController.view.superview) {
        self.blueController = nil;
    } else {
        self.yellowController = nil;
    }
}

-(IBAction)switchViews:(id)sender
{
    

    
    [UIView beginAnimations:@"View Flip" context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    if (!self.yellowController.view.superview) {
        if (!self.yellowController) {
            self.yellowController = [self.storyboard
                                         instantiateViewControllerWithIdentifier:@"Yellow"];
        }
        
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
        [self.blueController.view removeFromSuperview];
        [self.view insertSubview:self.yellowController.view atIndex:0];
    } else {
        if (!self.blueController) {
            self.blueController = [self.storyboard
                                       instantiateViewControllerWithIdentifier:@"Blue"];
        }
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
        [self.yellowController.view removeFromSuperview];
        [self.view insertSubview:self.blueController.view atIndex:0];
    }
    
    [UIView commitAnimations];
}

@end

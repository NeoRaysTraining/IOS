//
//  ViewController.m
//  Settings Bundle
//
//  Created by Mahaboobsab Nadaf on 22/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (BOOL)shouldAutorotate {
    
// Get user preference
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL enabled = [defaults boolForKey:@"enableRotation"];
    
       UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (enabled) {
        return YES;
    } else {
        return (orientation == UIInterfaceOrientationPortrait);
    }
}
@end

//
//  BlueViewController.m
//  multipleviewDemo
//
//  Created by test on 8/3/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "BlueViewController.h"

@implementation BlueViewController

-(void)viewDidLoad
{
    
}

-(void)didReceiveMemoryWarning
{
    
}

-(IBAction)blueButtonPressed {
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Blue view button pressed" message:@"you have pressed button in blue view" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end

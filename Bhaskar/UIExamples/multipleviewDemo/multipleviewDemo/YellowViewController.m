//
//  YellowViewController.m
//  multipleviewDemo
//
//  Created by test on 8/3/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "YellowViewController.h"

@implementation YellowViewController



-(void)viewDidLoad
{
    
}


-(void)didReceiveMemoryWarning
{
    
}

-(IBAction)yellowButtonPressed {
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"yellow view button pressed" message:@"you have pressed button in yellow view" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end

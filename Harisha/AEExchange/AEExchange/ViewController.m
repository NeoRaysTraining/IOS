//
//  ViewController.m
//  AEExchange
//
//  Created by test on 6/15/16.
//  Copyright © 2016 NeoRays. All rights reserved.
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
- (IBAction)agree:(id)sender
{
    [self performSegueWithIdentifier:@"homescene" sender:self];
}


@end

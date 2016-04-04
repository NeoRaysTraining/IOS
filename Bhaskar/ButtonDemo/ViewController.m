//
//  ViewController.m
//  ButtonDemo
//
//  Created by test on 3/30/16.
//  Copyright © 2016 test. All rights reserved.
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

- (IBAction)helloButton:(id)sender {
    
    [_helloLabel setText:@"Hello"];
    
    NSLog(@"helloButton is pressed");
}

- (IBAction)doNothin:(id)sender {
    self.helloLabel.text = @"Congrats";
    NSLog(@"doNothing is pressed");
    [self.view setBackgroundColor:[UIColor orangeColor]];
}


@end

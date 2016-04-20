//
//  ViewController.m
//  Image_Information
//
//  Created by test on 20/04/16.
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

- (IBAction)Kalam:(id)sender {
    
    [self performSegueWithIdentifier:@"kalam" sender:self];
}

- (IBAction)SRM:(id)sender {
    
    [self performSegueWithIdentifier:@"SRM" sender:self];
}

- (IBAction)jobs:(id)sender {
     [self performSegueWithIdentifier:@"jobs" sender:self];
}

- (IBAction)mark:(id)sender {
     [self performSegueWithIdentifier:@"mark" sender:self];
}

- (IBAction)swami:(id)sender {
     [self performSegueWithIdentifier:@"swami" sender:self];
}

- (IBAction)sachin:(id)sender {
    
     [self performSegueWithIdentifier:@"sachin" sender:self];
}
@end

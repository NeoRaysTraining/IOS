//
//  ViewController.m
//  SendingDataBackUsingNSNotification
//
//  Created by Mahaboobsab Nadaf on 14/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getRecievedData:) name:@"name" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextButton:(id)sender {
    
    [self performSegueWithIdentifier:@"next" sender:self];
}
-(void)getRecievedData : (NSNotification *)myNotification{


    self.labelField.text = [[myNotification userInfo]valueForKey:@"sendThis"];
}
@end

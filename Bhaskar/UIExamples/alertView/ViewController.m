//
//  ViewController.m
//  firstProject
//
//  Created by test on 3/26/16.
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

- (IBAction)press:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"AlertBox" message:@"welcome to iOS, this is alert box" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    [alert show];
}
@end

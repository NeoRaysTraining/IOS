//
//  ViewController.m
//  GoogleIntegrationExample
//
//  Created by test on 5/27/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // TODO(developer) Configure the sign-in button look/feel
    
    [GIDSignIn sharedInstance].uiDelegate = self;
    
    
    // Uncomment to automatically sign in the user. 106738025502898928345

    //[[GIDSignIn sharedInstance] signInSilently];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)googleSignUpBtn:(id)sender {
    
    [[GIDSignIn sharedInstance] signIn];
}


@end

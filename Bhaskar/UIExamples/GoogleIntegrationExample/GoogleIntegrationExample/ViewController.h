//
//  ViewController.h
//  GoogleIntegrationExample
//
//  Created by test on 5/27/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>
@interface ViewController : UIViewController<GIDSignInUIDelegate>

@property (nonatomic,strong)IBOutlet GIDSignInButton *signInButton;

@property (strong, nonatomic) IBOutlet UIButton *googleSignUpButton;

@end


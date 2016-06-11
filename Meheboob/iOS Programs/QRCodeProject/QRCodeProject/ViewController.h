//
//  ViewController.h
//  QRCodeProject
//
//  Created by Mahaboobsab Nadaf on 09/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
- (IBAction)login:(id)sender;

@end


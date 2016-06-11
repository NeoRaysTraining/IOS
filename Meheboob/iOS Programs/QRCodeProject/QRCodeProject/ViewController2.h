//
//  ViewController2.h
//  QRCodeProject
//
//  Created by Mahaboobsab Nadaf on 10/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController3.h"
#import "AppDelegate.h"

@interface ViewController2 : UIViewController<NSURLSessionDelegate,NSURLSessionDownloadDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;
@property (weak, nonatomic) IBOutlet UITextField *bgroup;
@property (weak, nonatomic) IBOutlet UITextField *locationField;
@property(strong, nonatomic)NSString *info;
@property(strong, nonatomic)NSData *data;
- (IBAction)shareButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

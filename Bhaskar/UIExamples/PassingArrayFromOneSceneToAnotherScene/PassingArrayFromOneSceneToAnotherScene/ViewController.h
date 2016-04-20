//
//  ViewController.h
//  PassingArrayFromOneSceneToAnotherScene
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *fName;
@property (strong, nonatomic) IBOutlet UITextField *mName;
@property (strong, nonatomic) IBOutlet UITextField *dob;
@property (strong, nonatomic) IBOutlet UITextField *address;

@property (strong, nonatomic) IBOutlet UITextField *mobileNumber;

@property (nonatomic,strong) NSString *nme,*fNme,*mNme,*dateOfBirth,*addr,*mobile;

@end


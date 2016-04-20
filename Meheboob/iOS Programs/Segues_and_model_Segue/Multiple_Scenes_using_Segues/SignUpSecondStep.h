//
//  SignUpSecondStep.h
//  Multiple_Scenes_using_Segues
//
//  Created by test on 19/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignUpFirstStep.h"
#import "VerifyDetails.h"
@interface SignUpSecondStep : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>


@property (weak, nonatomic) IBOutlet UITextField *myDOBTextField;


@property (weak, nonatomic) IBOutlet UITextField *genderField;

@property (weak, nonatomic) IBOutlet UIPickerView *genderPickerView;
@property(strong, nonatomic)NSArray *maleFemale;

@property (weak, nonatomic) IBOutlet UITextField *adreeField;
- (IBAction)nextButton:(id)sender;
@property(strong, nonatomic)NSMutableArray *signUpFields2;

@property(strong, nonatomic) NSMutableDictionary *usersDetails2;
-(void)receiveFirstVewDetails : (NSMutableDictionary *) firstViewDetails;



@property(strong, nonnull) NSMutableDictionary *ReceivedFirstViewDetails;


@end

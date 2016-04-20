//
//  VerifyDetails.h
//  Multiple_Scenes_using_Segues
//
//  Created by test on 19/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignUpSecondStep.h"

@interface VerifyDetails : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *forDisplayDetails;



@property (strong, nonatomic) NSMutableDictionary *firstScreenDictionary;

@property (strong, nonatomic) NSMutableDictionary *secondScreenDictionary;

@property (strong, nonatomic)NSMutableArray *allUsersDataFromTextfields;





-(void)allCustomerDictionary : (NSMutableDictionary *)dict1 : (NSMutableDictionary *) dct2;
- (IBAction)Submit:(id)sender;


@end

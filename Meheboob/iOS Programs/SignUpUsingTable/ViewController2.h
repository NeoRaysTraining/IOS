//
//  ViewController2.h
//  SignUpUsingTable
//
//  Created by test on 27/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"


@interface ViewController2 : UIViewController
-(void)getDetails : (NSDictionary *)getDetails;

@property(strong, nonatomic)NSDictionary *scene2Dictionary;

@property (weak, nonatomic) IBOutlet UILabel *nameLabelVc2;

@property (weak, nonatomic) IBOutlet UILabel *ageLabelVc2;
@property (weak, nonatomic) IBOutlet UILabel *genderLabelVc2;
@property (weak, nonatomic) IBOutlet UILabel *countryLabelVc2;

@end

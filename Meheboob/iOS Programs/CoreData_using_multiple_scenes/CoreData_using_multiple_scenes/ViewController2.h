//
//  ViewController2.h
//  CoreData_using_multiple_scenes
//
//  Created by test on 06/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "TableViewCell.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface ViewController2 : UIViewController

@property(strong, nonatomic)NSString *allDetails;
@property (weak, nonatomic) IBOutlet UITextField *nameTextFleld;
@property (weak, nonatomic) IBOutlet UITextField *designationTextField;
- (IBAction)saveButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@property (weak, nonatomic) IBOutlet UITextField *genderTextField;
@property(strong,nonatomic)NSString*empName;
@property(strong,nonatomic)NSString*empDes;
@property(strong,nonatomic)NSString*empAge;
@property(strong,nonatomic)NSString*empGen;

@property(strong, nonatomic)NSArray *arrayToSend;
@property(strong, nonatomic)NSArray *coreObject;



@end

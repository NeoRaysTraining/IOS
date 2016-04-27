//
//  ViewController.h
//  CustomTableViewWithSegue
//
//  Created by test on 4/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController2.h"

@interface ViewController : UIViewController
@property (nonatomic,strong) NSArray *employee;
@property (weak, nonatomic) IBOutlet UITextField *nameOutlet;
@property (weak, nonatomic) IBOutlet UITextField *eidOutlet;
@property (weak, nonatomic) IBOutlet UITextField *desigOutlet;
@property (weak, nonatomic) IBOutlet UITextField *placeOutlet;
@property (nonatomic,strong) NSString* displayName;
@property (nonatomic,strong) NSString* displayId;
@property (nonatomic,strong) NSString* displayDesig;
@property (nonatomic,strong) NSString* displayPlace;


@end


//
//  viewController2.h
//  SegueDemo
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface viewController2 : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *dispalayNameText;
@property (strong, nonatomic) IBOutlet UILabel *displayPasswordText;

-(void)recieveData:(NSString *)name password:(NSString *)pwd;

@end

//
//  AppDelegate.h
//  SingletonForiPhone
//
//  Created by test on 4/5/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *information;

-(NSString *)getInformation;

-(void)settingInformation : (NSString *)someStringVal;
@end


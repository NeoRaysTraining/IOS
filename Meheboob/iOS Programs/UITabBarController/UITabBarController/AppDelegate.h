//
//  AppDelegate.h
//  UITabBarController
//
//  Created by test on 14/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic)NSString *storeInfrormation;

-(NSString *)getInformation;

-(void)saveInformation : (NSString *)saveInformation;
@end


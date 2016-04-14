//
//  AppDelegate.h
//  TabBarControlWithAppDelegate
//
//  Created by test on 4/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) NSString *userName;

-(void)setUserNameString:(NSString*)str;

-(NSString *)getUserNameString;



@end


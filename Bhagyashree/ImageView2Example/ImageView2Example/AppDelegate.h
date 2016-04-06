//
//  AppDelegate.h
//  ImageView2Example
//
//  Created by test on 4/5/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) NSString *info;
-(void) setStringValue:(NSString *) value;
-(NSString*) getStringValue;

@end


//
//  AppDelegate.h
//  SingletonImageViewProject
//
//  Created by test on 4/5/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong)NSString*strinfo;

-(NSString*)getstringInfo;
-(void)SetInfoValue:(NSString*)setString;
@end


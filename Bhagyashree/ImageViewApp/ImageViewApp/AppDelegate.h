//
//  AppDelegate.h
//  ImageViewApp
//
//  Created by test on 4/5/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) NSString *info;
-(NSString*)getInfo;
-(void) setInfoValue:(NSString *) infoValue;


@end


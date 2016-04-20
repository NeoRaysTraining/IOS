//
//  AppDelegate.h
//  PassingArrayFromOneSceneToAnotherScene
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) NSString* value;

-(void)setValueInt:(NSString *)value;
-(NSString *)getValueInt;



@end


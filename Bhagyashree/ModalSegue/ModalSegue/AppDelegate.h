//
//  AppDelegate.h
//  ModalSegue
//
//  Created by test on 4/20/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) NSString* enteredStr;
-(NSString*) getStrValue;
-(void) setStrVlaue:(NSString*)str;

@end


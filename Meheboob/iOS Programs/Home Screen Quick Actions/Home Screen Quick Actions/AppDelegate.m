//
//  AppDelegate.m
//  Home Screen Quick Actions
//
//  Created by Meheboob Nadaf on 24/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "AppDelegate.h"
#import "Action1.h"
#import "Action2.h"
#import "Action3.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:@"Action1" localizedTitle:@"title1" localizedSubtitle:@"sub1" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLocation] userInfo:nil];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"Action2" localizedTitle:@"title2" localizedSubtitle:@"sub2" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypePause] userInfo:nil];
    UIApplicationShortcutItem *item3 = [[UIApplicationShortcutItem alloc] initWithType:@"Action3" localizedTitle:@"title3" localizedSubtitle:@"sub3" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare] userInfo:nil];
    
    [[UIApplication sharedApplication] setShortcutItems: @[ item1, item2, item3 ]];
    
    return YES;
}
//- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
//{
//    NSLog(@"%@-%@-%@", shortcutItem.type, shortcutItem.localizedTitle, shortcutItem.localizedSubtitle);
//    
//    completionHandler(YES);
//}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    NSLog(@"%@", shortcutItem.type);
    
    if([shortcutItem.type isEqualToString:@"Action1"]){
        //ACTION HERE
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        Action1 *vc = [storyboard instantiateViewControllerWithIdentifier:@"action1"];
        //            self.window.rootViewController=vc;
        
        [(UINavigationController*)self.window.rootViewController pushViewController:vc animated:NO];
    }
    
  else  if([shortcutItem.type isEqualToString:@"Action2"]){
        //ACTION HERE
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        Action2 *vc = [storyboard instantiateViewControllerWithIdentifier:@"action2"];
        //            self.window.rootViewController=vc;
        
        [(UINavigationController*)self.window.rootViewController pushViewController:vc animated:NO];
    }
  else  if([shortcutItem.type isEqualToString:@"Action3"]){
      //ACTION HERE
      UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
      Action3 *vc = [storyboard instantiateViewControllerWithIdentifier:@"action3"];
      //            self.window.rootViewController=vc;
      
      [(UINavigationController*)self.window.rootViewController pushViewController:vc animated:NO];
  }
  else{
  
  }
    
    
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

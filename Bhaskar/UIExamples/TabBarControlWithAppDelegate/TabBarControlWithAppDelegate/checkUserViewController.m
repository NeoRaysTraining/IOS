//
//  checkUserViewController.m
//  TabBarControlWithAppDelegate
//
//  Created by test on 4/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "checkUserViewController.h"
#import "AppDelegate.h"


@implementation checkUserViewController


-(void)viewDidLoad
{
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    NSString *userName=[app getUserNameString];
    
    self.checkUserNameLabel.text=userName;
    
    
}
@end

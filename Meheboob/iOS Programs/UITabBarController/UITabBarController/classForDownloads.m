//
//  classForDownloads.m
//  UITabBarController
//
//  Created by test on 14/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "classForDownloads.h"
#import "AppDelegate.h"
@implementation classForDownloads
{
 
}


- (IBAction)SecondButton:(id)sender {
    
    
  AppDelegate *myAppDelegate =   [UIApplication sharedApplication].delegate;
    
    self.imageViewFoeDownloads.image = [UIImage imageNamed:@"2.jpg"];
    self.laodedImg = @"Now Second image is loaded...";
    
    [myAppDelegate setStoreInfrormation:self.laodedImg];
    
    self.labelForDownloads.text = [myAppDelegate storeInfrormation];
    
   
    
    NSString *tempString = @"Now third image is loadeded...";
    
    [myAppDelegate saveInformation:tempString];
    
}

- (IBAction)thirdButton:(id)sender {
  AppDelegate *myAppDelegate2 =   [UIApplication sharedApplication].delegate;
    
    self.labelForDownloads.text = [myAppDelegate2 getInformation];
    
    self.imageViewFoeDownloads.image = [UIImage imageNamed:@"3.jpg"];
    
    
}
@end

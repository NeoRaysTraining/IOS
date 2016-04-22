//
//  CustomSingleTon.m
//  UITabBarController
//
//  Created by test on 4/14/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "CustomSingleTon.h"

static CustomSingleTon *sharedInstance;


@implementation CustomSingleTon



+(CustomSingleTon *)instance
{
    if (sharedInstance==nil)
    {
        sharedInstance=[[super alloc]init];
    }

    return sharedInstance;


}

-(NSString*)getInfo
{
    return self.info;
    
}

-(void)setSharedInfo:(NSString*)setString
{
    
    self.info=setString;
}



@end

//
//  CustomSingleton.m
//  CustomSingletonClasses
//
//  Created by test on 4/9/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "CustomSingleton.h"
static CustomSingleton *sharedInstance;
@implementation CustomSingleton

+(CustomSingleton *)sharedInstance{
    
   
if(sharedInstance == nil)
{
    sharedInstance =[[super alloc]init];
}
    return sharedInstance;
}


-(NSString *)getSharedInfo{
    return self.info;
}

-(void)setSharedInfo: (NSString *)stringValue{
     self.info =  stringValue;
}


@end

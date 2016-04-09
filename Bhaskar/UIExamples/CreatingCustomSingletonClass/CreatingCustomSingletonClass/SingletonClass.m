//
//  SingletonClass.m
//  CreatingCustomSingletonClass
//
//  Created by test on 4/9/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "SingletonClass.h"

static SingletonClass *sharedInstance;
@implementation SingletonClass

+(SingletonClass*)createSharedInstance
{
    if(sharedInstance == nil)
    {
        sharedInstance=[[super alloc]init];
        
    }
    else{
        NSLog(@"sharedInstance not initialized");
    }
    
    return sharedInstance;
}

-(NSString *)getInforValue
{
    return self.infoValue;
}

-(void)setInfovalueString:(NSString *)value
{
    self.infoValue=value;
}

@end

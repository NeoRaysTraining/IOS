//
//  CustomSingleton.h
//  CustomSingletonClasses
//
//  Created by test on 4/9/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomSingleton : NSObject
+(CustomSingleton *)sharedInstance;
@property(nonatomic, strong) NSString *info;
-(NSString *)getSharedInfo;

-(void)setSharedInfo: (NSString *)stringValue;
@end

//
//  CustomSingleTon.h
//  UITabBarController
//
//  Created by test on 4/14/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomSingleTon : NSObject


+(CustomSingleTon* )instance;

@property NSString*info;
-(NSString*)getInfo;
-(void)setSharedInfo:(NSString*)setString;




@end

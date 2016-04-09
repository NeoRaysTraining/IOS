//
//  CustomSingleTon.h
//  CustomSingleTon
//
//  Created by test on 4/9/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomSingleTon : NSObject


+(CustomSingleTon*)createSharedInstance;


@property(nonatomic,strong) NSString* info;
-(NSString*)getInfo;
-(void)setSharedInfo:(NSString*)setString;



@end

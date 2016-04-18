//
//  CustomSingleton.h
//  CustomSingletonImageView
//
//  Created by test on 4/9/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomSingleton : NSObject
+(CustomSingleton *) createSharedInstance;
@property (nonatomic,strong) NSString* info;
-(NSString *) getSharedInfo;
-(void) setSharedInfo : (NSString*)stringValue;
@end

//
//  SingletonClass.h
//  CreatingCustomSingletonClass
//
//  Created by test on 4/9/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonClass : NSObject
@property (nonatomic,strong) NSString *infoValue;
+(SingletonClass*) createSharedInstance;

-(NSString*)getInforValue;
-(void)setInfovalueString:(NSString*)value;
@end

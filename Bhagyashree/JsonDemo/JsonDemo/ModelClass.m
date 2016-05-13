//
//  ModelClass.m
//  JsonDemo
//
//  Created by test on 5/13/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ModelClass.h"

@implementation ModelClass

- (instancetype)initWithName:(NSString*)artName initWithId:(NSString*)artId
{
    self = [super init];
    if (self) {
        _artistId=artId;
        _artistName=artName;
        
    }
    return self;
}

@end

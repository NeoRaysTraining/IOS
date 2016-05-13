//
//  Model.m
//  NSURLSessionDataTaskDemo
//
//  Created by test on 5/13/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "Model.h"

@implementation Model
- (instancetype)initWithName:(NSString *)aname trackName:(NSString*)atrack
{
    self = [super init];
    if (self) {
        self.name=aname;
        self.track=atrack;
    }
    return self;
}
@end

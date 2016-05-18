//
//  model.m
//  GettingValuesFromJSONAndStroingIntoCoreData
//
//  Created by test on 5/18/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "model.h"

@implementation model

- (instancetype)initWithName:(NSString *)artistName trackName:(NSString*)trackName
{
    self = [super init];
    if (self) {
        self.name=artistName;
        self.track=trackName;
    }
    return self;
}

@end

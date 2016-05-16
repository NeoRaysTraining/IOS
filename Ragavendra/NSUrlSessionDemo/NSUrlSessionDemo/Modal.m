//
//  Modal.m
//  NSUrlSessionDemo
//
//  Created by test on 5/13/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "Modal.h"

@implementation Modal

- (instancetype)initWithName:(NSString *)aname trackName:(NSString *)atrackName
{
        self = [super init];
       if (self) {
                self.name = aname;
                self.track = atrackName;
            }
        return self;
    }




@end

//
//  ModelClass.m
//  DownloadAndFetchData
//
//  Created by test on 5/17/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ModelClass.h"

@implementation ModelClass
- (instancetype)initWithName:(NSString*)artName initWithTrack:(NSString*)trkName
{
    self = [super init];
    if (self) {
        _artistName=artName;
        _trackName=trkName;
    }
    return self;
}
@end

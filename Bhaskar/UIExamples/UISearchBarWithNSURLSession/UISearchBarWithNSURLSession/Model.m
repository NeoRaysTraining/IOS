//
//  Model.m
//  UISearchBarWithNSURLSession
//
//  Created by test on 5/23/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "Model.h"

@implementation Model


- (instancetype)initWithArtistName:(NSString*) artistName trackName:(NSString*) trackName
{
    self = [super init];
    if (self) {
        self.aName=artistName;
        self.tName=trackName;
    }
    return self;
}
@end

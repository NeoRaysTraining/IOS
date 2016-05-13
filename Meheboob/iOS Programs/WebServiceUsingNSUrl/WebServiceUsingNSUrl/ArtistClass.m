//
//  ArtistClass.m
//  WebServiceUsingNSUrl
//
//  Created by test on 13/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ArtistClass.h"

@implementation ArtistClass

- (instancetype)initWithID : (NSString *)artID initWithName : (NSString *)artistName
{
    self = [super init];
    if (self) {
        self.artistId = artID;
        self.artistName = artistName;
    }
    return self;
}
@end

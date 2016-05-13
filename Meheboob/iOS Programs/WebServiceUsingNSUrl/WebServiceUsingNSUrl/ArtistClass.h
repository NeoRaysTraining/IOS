//
//  ArtistClass.h
//  WebServiceUsingNSUrl
//
//  Created by test on 13/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArtistClass : NSObject
@property(strong, nonatomic)NSString *artistId;
@property(strong, nonatomic)NSString *artistName;
- (instancetype)initWithID : (NSString *)artID initWithName : (NSString *)artistName;
@end

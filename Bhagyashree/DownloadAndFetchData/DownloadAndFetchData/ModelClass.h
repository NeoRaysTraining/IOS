//
//  ModelClass.h
//  DownloadAndFetchData
//
//  Created by test on 5/17/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelClass : NSObject
@property (nonatomic,strong) NSString* artistName;
@property (nonatomic,strong) NSString* trackName;
- (instancetype)initWithName:(NSString*)artName initWithTrack:(NSString*)trkName;
@end

//
//  ModelClass.h
//  JsonDemo
//
//  Created by test on 5/13/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelClass : NSObject

@property (nonatomic,strong)NSString* artistName;
@property (nonatomic,strong)NSString* artistId;
- (instancetype)initWithName:(NSString*)artName initWithId:(NSString*)artId;


@end

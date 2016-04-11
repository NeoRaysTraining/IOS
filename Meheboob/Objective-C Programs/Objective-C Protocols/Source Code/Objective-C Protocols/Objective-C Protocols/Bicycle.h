//
//  Bicycle.h
//  Objective-C Protocols
//
//  Created by test on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TrafficRules.h"
@interface Bicycle : NSObject<TrafficRules>

-(void)startPadling;
-(void)removeFrontWheel;
-(void)lockTheStructre : (id)structure;

@end

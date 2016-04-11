//
//  TrafficRules.h
//  Objective-C Protocols
//
//  Created by test on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TrafficRules <NSObject>
-(void)signalStop;
-(void)signalLeftTurn;
-(void)signalrightTurn;
@end

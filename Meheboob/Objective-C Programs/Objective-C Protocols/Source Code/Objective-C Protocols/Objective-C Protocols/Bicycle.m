//
//  Bicycle.m
//  Objective-C Protocols
//
//  Created by test on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Bicycle.h"

@implementation Bicycle
-(void)startPadling{
    NSLog(@"Started Padling of Bicycle");
}
-(void)removeFrontWheel{
    NSLog(@"Removed front wheel of biCycle");
}
-(void)lockBicycle : (id)bicycleStructure{

    NSLog(@"I locked the bicycle...");
}

-(void)signalStop{
    NSLog(@"Bicycle is stopped due to signal");

}

-(void)signalLeftTurn{
    NSLog(@"Bicycle is turned left...");
}

-(void)signalrightTurn{
    NSLog(@"Bycycle is turned right...");
}

-
(void)lockTheStructre:(id)structure{
    NSLog(@"Locked the Bicycle....");
}
@end

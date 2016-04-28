//
//  XYPoint.h
//  Objective-C Example to create an Object
//
//  Created by test on 4/7/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYPoint : NSObject
{
    int x;
    int y;
}
@property int x,y;

-(void)setXY : (int)xVal : (int)yVal;
@end

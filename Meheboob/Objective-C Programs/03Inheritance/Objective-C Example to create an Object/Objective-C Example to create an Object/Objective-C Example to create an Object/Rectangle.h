//
//  Rectangle.h
//  Objective-C Example to create an Object
//
//  Created by test on 4/7/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XYPoint;
@interface Rectangle : NSObject
{
    int width;
    int height;
    XYPoint *origin;
}

//Defines the properties
@property int width,height;

-(int)area;
-(int)parameter;
-(void)setWidthAndHeight : (int)w : (int)h;
-(XYPoint *)Origin;
-(void)setOrigin : (XYPoint *)pt;


@end

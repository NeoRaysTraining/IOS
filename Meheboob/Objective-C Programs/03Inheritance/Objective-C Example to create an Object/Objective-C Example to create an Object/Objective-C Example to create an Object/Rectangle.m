//
//  Rectangle.m
//  Objective-C Example to create an Object
//
//  Created by test on 4/7/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

@synthesize width,height;
-(void)setWidthAndHeight : (int)w : (int)h{
    width = w;
    height = h;
}

-(int)area{
    return width*height;
    
}
-(int)parameter{
    return (width*height)*2;
}

-(XYPoint *)Origin{

    return origin;
}
-(void)setOrigin : (XYPoint *)pt{

    origin = pt;
}

@end

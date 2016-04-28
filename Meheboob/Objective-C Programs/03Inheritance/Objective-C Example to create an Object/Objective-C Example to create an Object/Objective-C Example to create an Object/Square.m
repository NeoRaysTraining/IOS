//
//  Square.m
//  Objective-C Example to create an Object
//
//  Created by test on 4/7/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Square.h"

@implementation Square
-(void)setSide : (int)s{
    [self setWidthAndHeight:5 :5];

}
-(int)side{
    return width;
    
}
@end

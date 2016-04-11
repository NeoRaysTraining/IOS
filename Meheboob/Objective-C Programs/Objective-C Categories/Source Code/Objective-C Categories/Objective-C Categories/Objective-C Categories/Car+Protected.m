//
//  Car+Protected.m
//  Objective-C Categories
//
//  Created by Meheboob on 4/10/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "Car+Protected.h"

@implementation Car (Protected)
-(void)prepareToDrive{
    NSLog(@"Some internal work is running of %@ Car",[self model]);
}
@end

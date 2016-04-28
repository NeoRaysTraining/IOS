//
//  main.m
//  Objective-C Example to create an Object
//
//  Created by Meheboob 
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"
#import "Square.h"
#import "XYPoint.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        
//        //creating Rectangle Object

        Rectangle *myRectangle = [[Rectangle alloc]init];
//        
//        //[myRectangle setWidthAndHeight:6 :8];
//        
//        myRectangle.width = 6;
//        myRectangle.height  = 8;
//        NSLog(@"rectangle is %i by %i",myRectangle.width,myRectangle.height);
//        
//        NSLog(@"The area = %i and ,Perimeter = %i",[myRectangle area],[myRectangle parameter]);
//
//        
//        //creating Square Object
//        Square *mySquare = [[Square alloc]init];
//        
//        [mySquare setSide:0];
//        
//        NSLog(@"One side is %i ",[mySquare side]);
//        
//        NSLog(@"Area =  %i and perimeter = %i",[mySquare area],[mySquare parameter]);
        
        XYPoint *myXYPoint = [[XYPoint alloc]init];
        [myXYPoint setXY:100 :300];
        [myRectangle setWidthAndHeight:6 :8];
        
        //myRectangle.Origin = myXYPoint;
        
        [myRectangle setOrigin:myXYPoint];
        
        NSLog(@"Width is : %i and Height is : %i",myRectangle.width,myRectangle.height);
        
        NSLog(@"Origin is at %i, %i", myRectangle.Origin.x,myRectangle.Origin.y);
       
        NSLog(@"Area and Perameter are %i and %i",[myRectangle area],[myRectangle parameter]);
        
    }
    return 0;
}

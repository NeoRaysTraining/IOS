//
//  main.m
//  Objective-C NSNumber Class
//
//  Created by Meheboob on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        NSNumber *meheboobInt,*meheboobFloat;
        
        meheboobInt = [NSNumber numberWithInteger:100];
        
        meheboobFloat = [NSNumber numberWithFloat:117.45];
        
        //Gives some value because its object
      //  NSLog(@"The Val from meheboobInt is : %i",meheboobInt);
        
       int x =  [meheboobInt integerValue];
        
        NSLog(@"The val of x is from integerValue is : %i",x);
       
        int y =  [meheboobInt intValue];
        
        NSLog(@"The val of y is from intValue is : %i",y);

        float aFloatVal = [meheboobFloat floatValue];
         NSLog(@"The val of aFloatVal is from floatValue is : %f",aFloatVal);
        
    }
    return 0;
}

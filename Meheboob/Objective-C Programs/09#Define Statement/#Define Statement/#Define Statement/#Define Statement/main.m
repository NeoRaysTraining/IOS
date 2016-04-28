//
//  main.m
//  #Define Macro
//
//  Created by Meheboob on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

//Avoids of defining bunch of #define statements
#import "FoodRate.h"

//Semicolon will cause error because we are going add value to macros in future

#define PI 3.14159
#define TWOPI 3.14159*2
#define  TWOPIE 2.0*PI
#define AND &&
#define OR ||
#define EQUALS ==

#define EVEN(E)  E%2 == 0

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        float x = PI+6;
        
        NSLog(@"The val of x is : %f",x);
       
        if(EVEN(13)){
            NSLog(@"The number is Even");
        }
        
        else{
            NSLog(@"The number is Odd");
        }
        
        int breakFast = IDLI+VODA;
        
        NSLog(@"I require :%i Rupees for my breakfast",breakFast);
        
    }
    return 0;
}

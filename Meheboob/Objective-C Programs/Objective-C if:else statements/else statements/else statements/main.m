//
//  main.m
//  else statements
//
//  Created by test on 4/6/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int menAge = 15;
        int womanAge = 37;
        
//        if(menAge < womanAge)
//        {
//            NSLog(@" It's not good pair");
//        }
//        
//        if (womanAge < menAge) {
//            NSLog(@"It's a good pair");
//        }
        
        
//        if(menAge < womanAge)
//        {
//            NSLog(@" It's not good pair");
//        }
//        
//        else {
//            NSLog(@"It's a good pair");
//        }
        
        
        
//        if(menAge > womanAge)
//        {
//            NSLog(@"It's better choice");
//            NSLog(@"Every one like this pair");
//            NSLog(@"Woman is younger than Men");
//        }
//        else
//            NSLog(@"No way old woman");
        
        
        
        // Even or Odd
        
        int number;
        
        int reminder;
        
        NSLog(@"Enter a number to check Even or Odd");
        
        scanf("%i",&number);
        
       reminder =  (number %2);
        
        if(reminder == 0)
        {
            NSLog(@"Entered Number is even ..");
        }
        else
        {
            NSLog(@"Entered Number is Odd..");
        }
        
    }
    return 0;
}

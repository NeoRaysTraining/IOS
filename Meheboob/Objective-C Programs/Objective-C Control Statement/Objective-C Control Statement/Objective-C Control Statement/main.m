//
//  main.m
//  Objective-C Control Statement
//
//  Created by test on 4/5/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        int x;
        
        for (x =1; x<=10; x=x+1) {
            NSLog(@"%i",x);
        }
        
        for(int x =1;x<=10;x = x+2)
        {
         NSLog(@"%i",x);
        }
        
        for (int j=4; j<=10; j++) {
            NSLog(@"Inside J %i",j);
        }
        
        //Defining local var
        int i, userNumber;
        
        NSLog(@"Enter a number & I will Print it out");
        
        //Storing value in var userNumber
        scanf("%i",&userNumber);
        
        for (i=1; i<=userNumber; i++) {
            NSLog(@"The Val Of i is : %i",i);
        }
    }
    //Returns 0 to main method
    return 0;
}

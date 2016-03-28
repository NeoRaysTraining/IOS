//
//  main.m
//  NSArrayMemborshipChecking
//
//  Created by Mahaboobsab Nadaf on 3/27/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Creates Array
        NSArray *myFrinds = @[@"Shruthi",@"Bhagya",@"Soumya",@"Shailashree",@"Veda"];
        
        //Checks whether var myFrinds contains object Soumya
        if([myFrinds containsObject:@"Soumya"]){
        
            NSLog(@"Soumya is also my Friend");
        }
        
        else
        {
           NSLog(@"Soumya is not my Friend....???");
        }
        
        //Checking Index Checking of object
        NSUInteger index = [myFrinds indexOfObject:@"Soumya"];
        
        //Checks whether given object is there or what
        if(index == NSNotFound){
            NSLog(@"OOhhh Object is not there ");
        }
        
        else{
        
            NSLog(@"Soumya is my Friend and her index is %ld",index);
        }
        
    }
    return 0;
}

//
//  main.m
//  Objective-C data Encapsulation
//
//  Created by test on 4/5/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Error acssessing memors outside the class
        
        //age = 23;
        
        //creating object of an Person
        Person *meheboob = [[Person alloc]init];
        
        //Setting Age
        [meheboob setAge:23];
        
        //Setting Weight
        [meheboob setWeight:62];
        
        //Printing age and weight by calling methods
        NSLog(@"I am %i yers old and my weight is %i Kg's",[meheboob age],[meheboob weight]);
    }
    return 0;
}

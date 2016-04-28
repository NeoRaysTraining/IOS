//
//  main.m
//  Objective-CExampleOnInterfaceAndImplementation
//
//  Created by test on 4/5/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        //creats Person Object
       Person *myDetails =  [[Person alloc]init];
        
        
        //Sets age to 23
        [myDetails setAge:26];
        
        //Sets weight to 63
        [myDetails setWeight:68];
        
        //prints the details
        [myDetails print];
        
        //Memory is released Explicitly
        //[myDetails release];
        
        
        
        //Creating Multiple Objects
        
        Person *meheboob = [[Person alloc]init];
        
        [meheboob setWeight:63];
        
        [meheboob setAge:23];
        
        [meheboob print];

    }
    
    //rewtuns 0 to main method
    return 0;
}

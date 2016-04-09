//
//  main.m
//  BasicPrograms
//
//  Created by test on 4/8/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

//import particular class //
#import "Person.h"

// main method starts Execution //
int main(int argc, const char * argv[]) {
    @autoreleasepool {
   
// Create Person Object Oneway //
Person *raghu=[Person alloc];
        raghu=[raghu init];
        
// Onemore way in single line //
   // set values //
[raghu setAge:24];
[raghu setWeight:55];
[raghu print];
        
        
        
    }
    return 0;
}

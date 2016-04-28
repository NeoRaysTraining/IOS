//
//  main.m
//  Objective-C Creating Objects
//
//  Created by Meheboob on 4/6/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //creating Person Object
       Person *meheboob =  [[Person alloc]init];
        
        //Sets Age
        [meheboob setAge:23];
        
        //Sets weight
        [meheboob setWeight:63];
        
        //Print details about person
        [meheboob print];
        
    }
    return 0;
}

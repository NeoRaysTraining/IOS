//
//  main.m
//  Objective-C Errors and Exceptions
//
//  Created by Meheboob.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
       //Creating Array object
        NSArray *myArray = @[@"Meheboob",@"Raghavendra",@"Bhagyashree",@"Sabiya"];
        
        int selectIndexValueNotExist = 4;
       
        //Try catch Block
//        @try {
//            NSString *myString = myArray[selectIndexValueNotExist];
//            
//            NSLog(@"The selected name is : %@",myString);
//        } @catch (NSException *theException) {
//            NSLog(@"In try block the exception is occured and the Exception name is : %@",theException.name);
//        } @finally {
//            NSLog(@"This finally block executes sure whether error occours or not occures");
//        }
        
        
        @try {
            NSString *myString = myArray[selectIndexValueNotExist];
             NSLog(@"The selected name is : %@",myString);
    } @catch(NSException *theException) {
        if (theException.name == NSRangeException) {
            NSLog(@"Caught an NSRangeException");
        } else {
            NSLog(@"Ignored a %@ exception", theException);
            
            //Raise NSException objects that contain custom data.
            @throw;
        }
       

        
    }
        @finally {
                       NSLog(@"This finally block executes sure whether error occours or not occures");
                   }
    
        
        
    }
    return 0;
}
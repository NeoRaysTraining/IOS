//
//  main.m
//  NSDictionaryCreatingDictionryObjects
//
//  Created by test on 3/29/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Creating Dictionary using literal syntax
        
        NSDictionary *carInventory = @{
                                       @"Maruthi 800" :[NSNumber numberWithInt:20],
                                       @"Hundai Santro" : [NSNumber numberWithInt:12],
                                       @"Mahendra Bulero" : [NSNumber numberWithInt:5],
                                       @"Toyota innova" : [NSNumber numberWithInt:9]
                                       
                    };
        //Prints carInventory object
        
        NSLog(@"The total Car Stock is : %@",carInventory);
        
        //Values and keys as arguments
        NSDictionary *bykeInventory = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:50],@"Hero Splendor",[NSNumber numberWithInt:44],@"Bajaj CT100",[NSNumber numberWithInt:23],@"Honda Active",[NSNumber numberWithInt:4],@"Royal Enfield", nil];
        
        //Prints bykeInventory object
        
        NSLog(@"The total Byke Stock is : %@",bykeInventory);
        
        //Values and keys as Arrays
        
        NSArray *language = @[@"Kannada",@"Marathi",@"Panjabi",@"gujarathi",@"Hindi"];
        NSArray *states = @[@"Karnataka",@"Maharashtra",@"Panjab",@"Gujarat",@"Delhi"];
        
        NSDictionary *statesAndLanguage = [NSDictionary dictionaryWithObjects:language forKeys:states];
        //Prints states and language
        
        NSLog(@"The states and their languages : %@",statesAndLanguage);
        
        //Crating NSArray Objects
        NSArray *studentName = @[@"Meheboob",@"Soumya",@"Meheboobpashya",@"Mohan",@"Swami"];
        
         //Crating NSArray Objects
        NSArray *studentReg = @[[NSNumber numberWithInt:412],[NSNumber numberWithInt:055],[NSNumber numberWithInt:072],[NSNumber numberWithInt:416],[NSNumber numberWithInt:432]];
        
        //Creating Dictionary using Objects
        NSDictionary *studentDetails = [NSDictionary dictionaryWithObjects:studentName forKeys:studentReg];
        NSLog(@"The student details is : %@",studentDetails);
     
        
        
        
    }
    
    //Returns 0 to main method
    return 0;
}

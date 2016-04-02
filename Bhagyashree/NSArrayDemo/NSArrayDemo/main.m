//
//  main.m
//  NSArrayDemo
//
//  Created by test on 3/31/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        //CREATING NSArray
        
        //Declaring and initializing the array with objects
        NSArray *employee = @[@"Nadaf",@"Bhaskar",@"Harish",@"Raghu",@"Bhagya"];
        
        /*Declaring an array and initializing it with objects using method arrayWithObjects*/
        NSArray *empId = [NSArray arrayWithObjects:@"NR147",@"NR151",@"NR150",@"NR149",@"NR148", nil];
        
        /*Printing object at specific index using objectAtIndex method*/
        NSLog(@"The first employee is : %@",[employee objectAtIndex:0]);
        
        //Printing array element by specifying the index
        NSLog(@"The empid of first employee is: %@",empId[0]);
        
        //ENUMERATING ARRAYS
        
        //Fast enumeration
        for(NSString *item in employee)
        {
            NSLog(@"%@",item);
        }
        
        //Using traditional for loop
        for(int i=0;i<[empId count];i++)
        {
            NSLog(@"The employee having empId %@ is at index %d",empId[i],i);
        }
        
        //COMPARING ARRAYS
        //Comparing arrays using isEqualToArray method
        if([employee isEqualToArray:empId])
        {
            NSLog(@"Arrays are equal");
        }
        else
        {
            NSLog(@"Arrays are not equal");
        }
        
        //MEMBERSHIP CHECKING
        //BOOL Checking
        if([employee containsObject:@"Bhagya"])
        {
            NSLog(@"Bhagya is present in employee array");
        }
        
        //INDEX CHANGING
        NSUInteger *index =[employee indexOfObject:@"Bhagya"];
        
        if(index==NSNotFound)
        {
            NSLog(@"NOT FOUND");
        }
        else{
            NSLog(@"Bhagya found at index:%ld",index);
        }
    }
    return 0;
}

//
//  main.m
//  ArraysAndDictionary
//
//  Created by test on 3/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //creating the NSArray variable
        NSArray *Employee1;
        NSArray *Employee2;
        NSArray *Employee3;
        NSArray *EmployeeArray;
        
        //creating the NSdictionary variables
        NSDictionary *employee1;
        NSDictionary *employee2;
        NSDictionary *employee3;
        NSDictionary *employeeDictionary;
   
        
        //storing values for NSArray 1st employee data using alloc method
        Employee1 = [[NSArray alloc]initWithObjects:@"NR150",@"Harish",@"kn",@"8722131314",@"knharish14@gmail.com",@"banglore", nil];
        
        // NSLog(@"The Employee 1 details are %@",Employee1);
        
        //storing values for NSArray 2nd employee data using alloc method
        Employee2 = [[NSArray alloc]initWithObjects:@"NR151",@"Bhaskar",@"NS",@"9880995143",@"bhaskar.ns@neorays.com",@"banglore", nil];
        
        //NSLog(@"The ARRAY CONTENTS ARE %@",Employee2);
        
        //storing values for NSArray 3rd employee data using alloc method
        Employee3 = [[NSArray alloc]initWithObjects:@"NR152",@"Sameer",@"Ranjan",@"87221313124",@"sameer@neorays.com",@"banglore", nil];
        
        //  NSLog(@"The ARRAY CONTENTS ARE %@",Employee3);
        
        //Stroring all the array objects data into the single array using arrayWithObjects method
        EmployeeArray = [NSArray arrayWithObjects:Employee1,Employee2,Employee3, nil];
        
        //NSLog(@"The employee deatails are %@",EmployeeArray);
        
        
        //creating the dictionary storing the key and value pair using the initWithObjects and keys method
        employee1 = [[NSDictionary alloc]initWithObjectsAndKeys:@"NR150",@"Eployee ID",
                     @"Harish",@"First Name",
                     @"K N", @"Last Name",
                     @"8722131314",@"Mobile number",
                     @"knharish14@gmail.com",@"Email ID",
                     @"Banglore",@"Address", nil];
        
        // NSLog(@"The dictionary vaues are %@",employee1);
        
        
        //creating the dictionary storing the key and value pair using the initWithObjects and keys method
        employee2 = [[NSDictionary alloc]initWithObjectsAndKeys:@"NR151",@"Eployee ID",
                     @"Sagar",@"First Name",
                     @"K", @"Last Name",
                     @"8722133456",@"Mobile number",
                     @"sagar.sk@gmail.com",@"Email ID",
                     @"Banglore",@"Address", nil];
        //NSLog(@"The second employee details are %@",employee2);
        
        
        
        //creating the dictionary storing the key and value pair using the initWithObjects and keys method
        employee3 = [[NSDictionary alloc]initWithObjectsAndKeys:@"NR152",@"Eployee ID",
                     @"Ragavendra",@"First Name",
                     @"K", @"Last Name",
                     @"9732133456",@"Mobile number",
                     @"raghu.sk@gmail.com",@"Email ID",
                     @"Banglore",@"Address", nil];
        // NSLog(@"The second employee details are %@",employee3);
        
        
        
        //creating dictionary and storing all the dictionary values into the single Dictionary using dictioanryWithObjectsAndKeys method
        employeeDictionary = [NSDictionary dictionaryWithObjectsAndKeys:employee1,@"Dict1",
                              employee2,@"Dict2",
                              employee3,@"Dict3",nil];
        
        
        //printing the value of all dictionary stored in a single dictionary object
        NSLog(@"The dictionary values are %@",employeeDictionary);
    

    }
    return 0;
}

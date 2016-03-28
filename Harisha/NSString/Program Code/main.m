//
//  main.m
//  Objective C Basics
//
//  Created by test on 3/27/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        
        //creating the string variable
        NSString *firstName = @"Harish";
        
        //printing the value of string variable
        NSLog(@"The author first name is %@",firstName);
        
        //creating the 2 nd string variable
        NSString *lastName = @"Nagaraj";
        
        //printing the value of second string variable
        NSLog(@"The author last name is %@",lastName);
        
        //printing the 2 string variable names
        NSLog(@"The first and last name is %@ %@",firstName,lastName);
        
        //enumaretion of string
        NSString *fullName = @"HarishNagaraj";
        
        //for loop using lenght
        for(int i = 0; i<[fullName length]; i++)
        {
            unichar letter = [fullName characterAtIndex:i];
            NSLog(@"the characters are %d and letter is %c",i,letter);
        }
        
        //comparing the string
        if([firstName isEqualToString:lastName])
        {
            //if the condition is true it will print the statement
            NSLog(@"The given strings are equal");
        }
        else{
            //condtion fails print this statement
            NSLog(@"The given strings are not equal");
        }
        //using the has suffix method
        if ([fullName hasSuffix:lastName])
        {
            //the hassuffix condtion is true it will print this statement
            NSLog(@"The name end with %@",lastName);
        }
        //using has prefix method
        if ([fullName hasPrefix:firstName])
        {
            //if the hasprefix is true it will print this statement
            NSLog(@"The name start with %@",firstName);
        }
        
        //Combining two strings using stringByAppendingString method
        NSString *append = [firstName stringByAppendingString:lastName];
        
        //printing the value of appended string
        NSLog(@"The value of appended streing is %@",append);
        
        //using 2 string append methods
        NSString *append2 = [[firstName stringByAppendingString:@" "] stringByAppendingString:lastName];
        
        //printing the value of appended string
        NSLog(@"The appended string with format is %@",append2);
        
        //copying the string using method
        NSString *copy = []
        
    }
    return 0;
}

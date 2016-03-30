//
//  main.m
//  NSMutableString
//
//  Created by test on 3/30/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    //CREATING MUTABLE STRING
       //Declaring and initializing string
        NSMutableString *name = [NSMutableString stringWithString:@"Bhagyashree"];
        //Printing the string
        NSLog(@"name : %@",name);
        
        //Using setString method change the string
        [name setString:@"Bhagyashree Kandakur"];
        
        //Didplsy the string
        NSLog(@"name : %@",name);
    
    //EXPANDING MUTABLE STRING
        //Declaring a string with capacity
        NSMutableString *mobile1 = [NSMutableString stringWithCapacity:20];
        NSMutableString *mobile2 = [NSMutableString stringWithCapacity:15];
        
        //Declaring and initializing string of type NSString
        NSString *model1 = @"6S";
        NSString *model2 = @"6S Plus";
        
        //Set mutable string with a string value
        [mobile1 setString:@"iPhone"];
        
        /*Append string to mutable string using appendString method*/
        [mobile1 appendString:model1];
        
        //Display the modified string
        NSLog(@"The mobile is : %@",mobile1);
        
        //Set a string value
        [mobile2 setString:@"iPhone"];
        
        /*Using appendFormat method to append the format to a string*/
        [mobile2 appendFormat:@"%@",model2];
        
        //Print a modified string
        NSLog(@"The mobiel is : %@",mobile2);
        
        //Declare a mutable string with capacity
        NSMutableString *mobile3 = [NSMutableString stringWithCapacity:20];
        
        //Set a value to the string
        [mobile3 setString:@"Samsung"];
        
        //Insert a string to a string at a specific index
        [mobile3 insertString:@"j7" atIndex:7];
        
        //Print a modified string
        NSLog(@"The mobile is : %@",mobile3);
        
    //RPLACING AND DELETING SUBSTRING AT SPECIFIC INDEX
        //Replace the characters at specific index with substring
        [mobile1 replaceCharactersInRange:NSMakeRange(6,2) withString:@"4S"];
        
        //Print modified string
        NSLog(@"After replacing characters : %@",mobile1);
        
        //Delete the characters at specific index with substring
        [mobile1 deleteCharactersInRange:NSMakeRange(6, 2)];
        
        //Print the string after deleting characters
        NSLog(@"String after deleting characters : %@ ,model name is deleted",mobile1);
    }
    return 0;
}

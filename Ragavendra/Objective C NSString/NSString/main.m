//
//  main.m
//  NSString
//
//  Created by test on 4/7/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

//******************************NSString*************************//

//NSString:It is  immutable Class Once Object is Created it cannot be modified //

#import <Foundation/Foundation.h>

// main method starts execution //
int main(int argc, const char * argv[]) {
    @autoreleasepool {

        
// Creating NSString Object
NSString* str=@"Welcome To iOS" ;
        
// printing  given  string Value //
NSLog(@"the given String is %@",str);
        
// One More way we Create NSString Object//
NSString*mystr=[[NSString alloc]init];
        
mystr=@"Hello";
        
NSLog(@"The  string  Value is %@",mystr);
        
// Methods Of NSString //
        
//i)Enumerating String//
        
NSString*iteratingstr=@"IPHONE";
// iteratinng string  for given length//
for(int i=0;i<[iteratingstr length];i++)
{
// length of the   given string //
NSLog(@"the length of string is %d", i);
//itertating the given string  to iterate we use char and //characterAtIndex Method used.
char letter=[iteratingstr characterAtIndex:i];
            
NSLog(@"%d:  %c",i,letter);

}
//2) Comparing String//
// To Compare String we use isEqualToString Method //
        
// Creating String //
NSString*phone=@"IPHONE";
        
NSLog(@"the length of the string is %lu",[phone length]);
        
// check  the conditon for phone belongs to that company//
if([phone isEqualToString:@"IPHONE"])
{
NSLog(@" The Phone is Of Apple Company");
            
}
else
{
NSLog(@"It is from Other Company");
}
        
        
if([phone hasPrefix:@"IPH"])
{
            
NSLog(@"Apple");
}
        
if([phone hasSuffix:@"IPH"])
{
            
NSLog(@"Apple");

}
        
//3) Combining String //

// Creating a string //
NSString*company=@"Apple";
NSString*phones=@"IPHONE";
        
NSString*combstr=[company stringByAppendingString:phones];
        
NSLog(@" After Combining: %@", combstr);
        
        
// 4) Searching String //
        
NSString*car=@"Mercedize Benze";
NSRange searchrange=[car rangeOfString:@"Benze"];
// check condition //
if (searchrange.location==NSNotFound)
{
NSLog(@"Search string not found");
}
else
{
NSLog(@"Benze starts at index %lu and %lu", searchrange.location,searchrange.length);

}
        
// 5) Subdividnig  String //
        
// Create a string //
NSString* subdivstr=@"IPhone6S";
        
//substringToIndex method it starts from starting up to given length//
NSLog(@" The Starting length string is :%@",[subdivstr substringToIndex:5]);
        
        //substringFromIndex method it is  starts after for given length in string //
NSLog(@" after the string is: %@",[subdivstr substringFromIndex:6]);
        
NSRange range= NSMakeRange(3, 5);
        
NSLog(@"%@",[subdivstr  substringWithRange:range]);
        

//6  // change case  Method///
        
NSString*changecasephone=@"iphone";
        
NSLog(@"After Lower Case:%@",[changecasephone lowercaseString ]);
NSLog(@"After Upper Case:%@",[changecasephone uppercaseString ]);
NSLog(@"After Capital:%@",[changecasephone capitalizedString]);
 
 //7) Replacing String //

NSString *replacingstr=@"Iphone 6s";

// NSMakeRange give length after how much length for given string it has to change //
NSRange rangestr= NSMakeRange(6, 3);

NSString *repstrwithstr=[replacingstr

                         
//stringByReplacingCharactersInRange method replaces string value after given length //
stringByReplacingCharactersInRange:rangestr withString:@"Plus"];
        
NSLog(@"%@", repstrwithstr);
        
NSString *repstr = [repstrwithstr

                    
//stringByReplacingOccurrencesOfString give string value after it will change for that given string //
stringByReplacingOccurrencesOfString:@"Plus"withString:@"Plusplus"];
        NSLog(@"%@", repstr);

                    
        
//*************************NSMutableStringClass **********************
 
//NSMutableStringClass: When to use NSMutableClass means whenever you want to add or remove functionality we use  of e
 
        
// creating MutableString //
 // Mutable Means after created string value  it can be changed //
NSMutableString *mutablestrcar = [NSMutableString stringWithString:@"Mercedize  Benze"];
  
NSLog(@" The Car name is %@",mutablestrcar);
    
        
 // add another string value //
[mutablestrcar setString:@"Innova"];

// create Mutable String  with capacity //
//  Means method we use stringWithCapacity
NSMutableString *cars = [NSMutableString stringWithCapacity:20];
NSString *model = @"458 Spider";
        
[cars setString:@"Ferrari"];
[mutablestrcar appendString:model];
NSLog(@"after adding new string value %@", car);
        
[cars setString:@"Ferrari"];
[cars appendFormat:@" %@", model];

//One more time afterappendFormat Method //
NSLog(@"One more time after appending :%@", car);
[cars setString:@"Ferrari Spider"];
   
//insertString method is to add at specifed index //

[cars insertString:@"458 " atIndex:8];
       
NSLog(@" after adding at specide index :%@", car);
    
    
    }
    return 0;
}

//
//  main.m
//  NSString
//
//  Created by test on 4/3/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
  
// Creating NSString Object
NSString* str=@"Welcome To iOS" ;
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

NSString*phone=@"IPHONE";

NSLog(@"the length of the string is %lu",[phone length]);
 
        
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
     
//3) Combining String //
        
NSString*company=@"Apple";
NSString*phones=@"IPHONE";

NSString*combstr=[company stringByAppendingString:phones];
  
NSLog(@" After Combining: %@", combstr);
        
        
// 4) Searching String //
        
NSString*car=@"Mercedize Benze";
NSRange searchrange=[car rangeOfString:@"Benze"];
        if (searchrange.location==NSNotFound)
        {
            NSLog(@"Search string not found");
        }
   else
   {
       NSLog(@"Benze starts at index %lu and %lu", searchrange.location,searchrange.length);
    }
    
// 5) Subdividnig  String //

        
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
        
        
    
    
    }
    return 0;
}

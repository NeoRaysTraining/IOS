//
//  main.m
//  NSArray
//
//  Created by test on 4/5/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//
///*******************NSArray****************************

#import <Foundation/Foundation.h>

// main method starts execution
int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
// Creating NSArray By using Literals //
NSArray*array=@[@"IPhone4",@"IPhon5s",@"IPhone5s",@"IPhone6",@"IPhone6s"];

// for printing the value
NSLog(@"all The Array Elements:%@",array);

// Creating NSArray By using arrayWithObjects method //
NSArray*laptopArray=[NSArray arrayWithObjects:@"Dell",@"HP",@"Lenovo",@"acer", nil];
    
NSLog(@"Different Laptop Brands %@",laptopArray);

// if you want to access specific index  use objectAtIndex method //
NSLog(@"At particular Index: %@", array[0]);
NSLog(@"The Elements at Specific index: %@",[laptopArray objectAtIndex:0]);
        
 
// Different Methods  Of NSArray //
        
//i) Enumerating Array //

 
// Creating NSArray By using NSArray using literals //
NSArray *differentcars = @[@"Mercedes-Benz", @"BMW", @"Scorpio",
                                 @"Opel", @"Volkswagen", @"Audi"];
// With fast-enumeration method
for (NSString *item in differentcars)
{
NSLog(@"After iterating by fast enumeration: %@", item);
}
       
// With a traditional for loop method //
for (int i=0; i<[differentcars count]; i++)
{
  NSLog(@"After iterating by traditional loop: %d: %@", i, differentcars[i]);
    
}
        
//ii) Comparing Array //
    
// creating  NSArray  Object //
NSArray *differenCompanyMobile = @[@"Nokia", @"Samsung", @"Lg",
                                 @"Motorola", @"HTC"];

//creating NSArray By using arrayWithObjects method //
NSArray *arraywithObjects = [NSArray arrayWithObjects:@"Nokia", @"Samsung", @"Lg",
                                    @"Motorola", @"HTC", nil];
       
// isEqualToArray Method   used to compare both conststing of same value or not //
    
//check condition //
if ([differenCompanyMobile isEqualToArray:arraywithObjects])
{
  NSLog(@"Oh God Both are Equal ");
}
else
{
    NSLog(@"Both are not Equal ");
}
        
//iii) Membership Checking //
        
        
NSArray*differentmobiiles=@[@"IPhone4",@"IPhon5s",@"IPhone5s",@"IPhone6",@"IPhone6s"];
//  checking condition for if stokes are there by using containsObject method //
 
//containsObject method  it it checks in array object //
if([differentmobiiles containsObject:@"IPhone5s"])
{
    NSLog(@"Stockes are Avialable");
}
        // Index checking
NSUInteger index = [differentmobiiles indexOfObject:@"IPhone5s"];
        
if (index == NSNotFound)
{
NSLog(@"Well that's not quite right...");
}
else
    
{
    NSLog(@"Iphone5s is there stocks at : %ld", index);
}


// iv) Subdividnig Array //

// Creating an NSArray
NSArray *carss = @[@"Mercedes-Benz", @"BMW", @"Porsche",
                                 @"Opel", @"Volkswagen", @"Audi"];
        
// subarrayWithRange method   we have to give range and length //
NSArray *lastTwo = [carss subarrayWithRange:NSMakeRange(2, 3)];
NSLog(@"After given range : %@", lastTwo);
        
//v) combining an Array //
        
// Creating an Array //
    
NSArray *phoenes = @[@"Iphone4",@"Iphone5", @"Iphone 5s"];
//Creating array by usnign adding new values //
NSArray *allphones = @[@"Iphone6",@"Iphone 6s",@"Iphone6sPlus "];
    
//arrayByAddingObjectsFromArray method it is used to combine both array Elements //
NSArray *allMakes = [phoenes arrayByAddingObjectsFromArray:allphones];
NSLog(@" After Combing All phones%@", allMakes);
 
// vi) String Conversion //
        

// Creating an Array //
NSArray *days=@[@"Day1", @"Day2", @"Day3", @"Day4"];

//componentsJoinedByString method  it concantinate each string element and it will seperated by  anytype like(, .)
NSLog(@" After compontes joined %@", [days componentsJoinedByString:@", "]);
        
  
        

        
//*********************NSMutableArray******************************
        
// Creating NSMutableArray  by using arrayWithObjects method //
NSMutableArray *mobilephones =[NSMutableArray arrayWithObjects:
                                      @"IPhone4",@"Iphone4s",@"Iphone5",@"Iphone5s", nil];
NSLog(@"Allphones %@",mobilephones);
        
        
// Adding and removing Objects //
[mobilephones addObject:@"Iphoe6s"];
NSLog(@" After adding :%@", mobilephones);
        
[mobilephones removeLastObject];
NSLog(@"After removing :%@", mobilephones);
        
        
        
// insert at particular index //
[mobilephones insertObject:@"Iphone6sPlus"  atIndex:0];
NSLog(@"After adding at specificIndex :%@", mobilephones);

// Remove BMW F25 from front
[mobilephones removeObjectAtIndex:1];
 NSLog(@"After removing  at specific index:%@", mobilephones);
        
        
        
        
// RemoveObject by using rem
[mobilephones removeObject:@"IPhone5s"];
NSLog(@"After removing removeObject Method :%@", mobilephones);
        
        
 // replaceObjectAtIndex method  at particualrindex
 [mobilephones replaceObjectAtIndex:1 withObject:@""];
        
        
        
        
    }
    return 0;
}

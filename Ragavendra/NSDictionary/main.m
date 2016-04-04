//
//  main.m
//  NSDictionary
//
//  Created by test on 4/4/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

// creating NSDictionary by using literals
NSDictionary *phones=@{
@"Iphone4":[NSNumber numberWithInt:1],
@"Iphone5":[NSNumber numberWithInt:2],
@"Iphone5s":[NSNumber numberWithInt:3],
@"Iphone6":[NSNumber numberWithInt:4],
@"Iphone4":[NSNumber numberWithInt:5]
                               
};
    
NSLog(@"the Key values are: %@",phones);

// Creating NSDictionary Objects by using dictionaryWithObjectsAndKeys Method //

NSDictionary*empdetails=[NSDictionary dictionaryWithObjectsAndKeys:
[NSNumber numberWithInt:145],@"Mehabob",
[NSNumber numberWithInt:149],@"Raghavendra",
[NSNumber numberWithInt:150],@"Harish",
[NSNumber numberWithInt:151],@"BHaskhar",
[NSNumber numberWithInt:148],@"Bhagya",nil];
        
NSLog(@"All Employee ID and Name Details :%@",empdetails);
    
 
// only keys by using method allKeys //
NSLog(@"Only Keys %@",[empdetails allKeys]);
    
// only values by using allValues method //
   
NSLog(@"Only Values %@",[empdetails allValues]);
// Crea

NSDictionary*carsandrate=@{
    @"MercedizeBenze":[NSNumber numberWithInt:1000000],
    @"Maruti" :[NSNumber numberWithInt:400000],
    @"Toyato":[NSNumber numberWithInt:600000],
    @"Scorpio":[NSNumber numberWithInt:900000]
};

    
NSArray*cars=@[@"MercedizeBenze",@"Maruti",@"Toyato",@"Scorpio"];
   
NSArray *rateofCars=@[[NSNumber numberWithInt:1000000],
                      [NSNumber numberWithInt:400000],
                      [NSNumber numberWithInt:600000],
                      [NSNumber numberWithInt:900000]];
    
    
[NSDictionary dictionaryWithObjects:rateofCars forKeys:cars ];
        
NSLog(@"%@",carsandrate);
        
    
// Enumerating Dictionary //

NSLog(@" No Of Cars stock  %ld",[cars count]);
 
for (id key in  rateofCars)
{
  
    NSLog(@"%@%@",carsandrate[key],key);
    
}
//Comparing NSDictionary //

NSDictionary *mobilephones=@{
@"Iphone4":[NSNumber numberWithInt:1],
@"Iphone5":[NSNumber numberWithInt:2],
@"Iphone5s":[NSNumber numberWithInt:3],
@"Iphone6":[NSNumber numberWithInt:4],
@"Iphone4":[NSNumber numberWithInt:5]
};

NSDictionary *companyOfMobilePhone=@{
@"Iphone4":[NSNumber numberWithInt:1],
@"Iphone5":[NSNumber numberWithInt:2],
@"Iphone5s":[NSNumber numberWithInt:3],
@"Iphone6s":[NSNumber numberWithInt:4],
@"Iphone4":[NSNumber numberWithInt:5]
};
//isEqualToDictionary method if both lenght are same then only it will compare other wise it will
if ([mobilephones isEqualToDictionary:companyOfMobilePhone])
{
    
NSLog(@"the company of Iphone is Apple");
    
}
else
{
    NSLog(@"this is other Company");
}
        
        
        
        
        

    }
    return 0;
}

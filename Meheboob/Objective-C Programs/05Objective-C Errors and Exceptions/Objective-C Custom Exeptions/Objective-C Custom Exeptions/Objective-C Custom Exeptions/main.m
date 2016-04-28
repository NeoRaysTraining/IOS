//
//  main.m
//  Objective-C Custom Exeptions
//
//  Created by test on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>


NSString *getRandomCarFromShowRoom(NSArray *myCars){
    int maximum = (int)[myCars count];
    
   // maximum =3;
    
if(maximum == 0)
{
    NSException *myExeption = [NSException exceptionWithName:@"EmptyCarsExeption" reason:@"There is no car in showroom" userInfo:nil];
    @throw myExeption;
}
    int randomIndex = arc4random_uniform(maximum);
   return myCars[randomIndex];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        
        
        @try {
            //NSString *theCar = getRandomCarFromShowRoom(@[]);
            //NSLog(@"the selected car is : %@",theCar);
            
            NSString *theCar = getRandomCarFromShowRoom(@[@"Maruthi",@"Benz",@"Bmw",@"Honda"]);
            NSLog(@"the selected car is : %@",theCar);
            
        } @catch (NSException *theException) {
            if([theException.name  isEqual: @"EmptyCarsExeption"]){
            
                NSLog(@"Caought an EmptyCarsExeption ...");
            }
            else{
                NSLog(@"Ignored a %@ exeption",theException);
                @throw;
            
            }
            
        }
        
    }
    return 0;
}

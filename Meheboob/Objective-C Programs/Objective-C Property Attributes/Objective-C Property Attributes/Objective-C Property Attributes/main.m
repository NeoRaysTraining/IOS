//
//  main.m
//  Objective-C Property Attributes
//
//  Created by Meheboob on 10/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
         Person *meheboob = [[Person alloc]init];
        
        meheboob.name = @"Meheboob Nadaf";
        
        Car *maruthi = [[Car alloc]init];
        
        maruthi.model = @"Maruthi 800";
        
        maruthi.driver = meheboob;
        
        NSLog(@"%@ Driving %@ Car",maruthi.driver,maruthi.model);
    
        
        NSMutableString *model = [NSMutableString stringWithString:@"MaruthiSwift"];
        
        maruthi.carModel = model;
        NSLog(@"The new Car Model is : %@",maruthi.carModel);
        
        [model setString:@"Maruthi Manzaa"];
        
        //Still MaruthiSwift
        NSLog(@"The very neww Car Model is : %@",maruthi.carModel);
    }
    return 0;
}

//
//  main.m
//  NSArraySubdevidingArray
//
//  Created by test on 3/28/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Creating an Array
        NSArray *bykeCompany = @[@"HeroHonda",@"Bajaj",@"Hero",@"Royal Enfield",@"Honda",@"TVS"];
        
        //Selects Last Three Objects From Array
        NSArray *lastThreeBykes = @[[bykeCompany subarrayWithRange:NSMakeRange(3,3)]];
        
        //Prints Last three Objects in an Array
        NSLog(@"Last Three Byke Companyies : %@",lastThreeBykes);
    }
    
    //returns 0 to main Method
    return 0;
}

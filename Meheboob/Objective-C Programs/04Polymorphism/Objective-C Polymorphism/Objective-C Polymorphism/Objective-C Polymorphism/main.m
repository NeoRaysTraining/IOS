//
//  main.m
//  Objective-C Polymorphism
//
//  Created by Meheboob
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Numz.h"
#import "Charz.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
//       ------ //Polymorphism -------
//        
        Numz *numberClass = [[Numz alloc]init];
        Charz *characterClass = [[Charz alloc]init];
//        
//         //methods from Numz class
//        [numberClass setNumbers:4 :5];
//    
//        [numberClass add];
//        
//        [numberClass print];
//       
//         //methods from Charz class
//        [characterClass setChar];
//        
//        [characterClass add];
//        
//        [characterClass print];
        
        
        
       //------Dynamic binding and Id--------//
        
        id allInOneClass;
        
        allInOneClass = numberClass;
        
        [allInOneClass print];
        
        allInOneClass = characterClass;
        
        [characterClass print];
        
    }
    return 0;
}

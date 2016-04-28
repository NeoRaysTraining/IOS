//
//  main.m
//  NSDictionaryExamples
//
//  Created by Mahabooobsab Nadaf
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //Creating NSDictionary
        NSDictionary *myDictionary = [[NSDictionary alloc]initWithObjectsAndKeys:@"Car1",@"Car1Key",@"Car2",@"Car2Key",@"Car3",@"Car3Key",@"Car4",@"Car4Key", nil];
        
        //Prints Dictionary Objects
        NSLog(@"%@",myDictionary);
        
        //Getting Object by using key
       NSString *car3Object =  [myDictionary objectForKey:@"Car3Key"];
        
        //Prints Value using Key
        NSLog(@"Car3Key is Key for : %@",car3Object);
        
    }
    
    //Returns 0 to main method
    return 0;
}

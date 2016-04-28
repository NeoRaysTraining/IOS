//
//  main.m
//  else
//
//  Created by test on 4/6/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int time;
        NSLog(@"Enter the time : ");
        
        
        
        scanf("%d",&time);
        
        if(time < 12)
        {
            NSLog(@"Good morning !!!");
        }
        
        else if (time <16)
        {
            NSLog(@"Good Afternoon...");
        }
        else if (time<24)
        {
            NSLog(@"Good night...");
        }
        else
        NSLog(@"It's a wrong time...");
        
        
        
        
    }
    return 0;
}

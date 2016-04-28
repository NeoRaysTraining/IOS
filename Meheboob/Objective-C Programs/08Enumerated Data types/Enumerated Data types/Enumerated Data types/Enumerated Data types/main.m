//
//  main.m
//  Enumerated Data types
//
//  Created by Meheboob on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
       // enum day{Mon,Tue,Wed,Thu,Fri,Sat,Sun};
        
        //or
        
        //It automatically puts Tue = 5 ,Wed = 6
       enum day{Mon = 4,Tue,Wed,Thu,Fri,Sat,Sun};
        
        enum day today = Fri;
        
        NSLog(@"Today date is : %i",today);
        
        enum days{MonDay = 1,TueDay,WedDay,ThuDay,FriDay,SatDay,SunDay};
        
        enum days dayEntry;
        
        NSLog(@"Entry a number of day of the weak");
        
        scanf("%i",&dayEntry);
        
        switch (dayEntry) {
                
                
            case MonDay:
                NSLog(@"The day is : MonDay");
                break;
                
                
            case TueDay:
                NSLog(@"The day is : TueDay");
                break;
               
            case WedDay:
                NSLog(@"The day is : WedDay");
                break;
               
            case ThuDay:
                NSLog(@"The day is : ThuDay");
                break;
                
            case FriDay:
                NSLog(@"The day is : FriDay");
                break;
                
            case SatDay:
                NSLog(@"The day is : SatDay");
                break;
                
            case SunDay:
                NSLog(@"The day is : SunDay");
                break;
                
            default:
                
                   NSLog(@"The day is : Invalid");
                break;
        }
    }
    return 0;
}

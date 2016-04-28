//
//  Numz.h
//  Objective-C Polymorphism
//
//  Created by Meheboob on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Numz : NSObject

{
    int num1;
    int num2;
    int answer;

}
-(void)setNumbers : (int)a : (int)b;
-(void)add;
-(void)print;
@end

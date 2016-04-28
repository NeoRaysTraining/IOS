//
//  Person.h
//  Objective-C data Encapsulation
//
//  Created by test on 4/5/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int age;
    int weight;
}

-(void)print;
-(void)setAge : (int)a;
-(void)setWeight : (int)w;
-(int)age;
-(int)weight;
@end

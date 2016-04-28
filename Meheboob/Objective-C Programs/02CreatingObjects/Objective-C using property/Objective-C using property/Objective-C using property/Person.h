//
//  Person.h
//  Objective-C using property
//
//  Created by test on 4/6/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
//
//{
//    int age;
//    int weight;
//
//}

//If we use Propert it automatically generates setters and getters
@property int age, weight;


-(void)print;

-(void)maxAge : (int)a;

-(void)setSalary : (int)minSal : (int)maxSal;
@end

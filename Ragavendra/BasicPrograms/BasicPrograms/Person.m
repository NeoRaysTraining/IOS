//
//  Person.m
//  BasicPrograms
//
//  Created by test on 4/8/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "Person.h"

@implementation Person


-(void)setAge:(int)a
{
    age=a;

}

-(void)setWeight:(int)w
{

    weight=w;
}


-(void)print
{
NSLog(@"I am %i years old and My  weight is : %i ",age,weight);


}



@end

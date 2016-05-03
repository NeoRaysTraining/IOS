//
//  EmployeeModel.m
//  MVCDemo
//
//  Created by test on 5/3/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "EmployeeModel.h"

@implementation EmployeeModel

-(instancetype)initWithName:(NSString *)eName Designation:(NSString *)design
{
    self=[super init];
    if (self) {
        self.empname=eName;
        self.empdesignation=design;
    }
    return self;
}




@end

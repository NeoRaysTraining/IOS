//
//  EmployeeClass.m
//  MVC
//
//  Created by test on 03/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "EmployeeClass.h"

@implementation EmployeeClass
- (instancetype)initWithObjects : (NSString *)empName : (NSString *)empDesignation
{
    self = [super init];
    if (self) {
        self.employeeName = empName;
        self.employeeDesignation = empDesignation;
    }
    return self;
}


@end

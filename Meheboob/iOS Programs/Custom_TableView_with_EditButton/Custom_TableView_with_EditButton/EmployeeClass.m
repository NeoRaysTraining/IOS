//
//  EmployeeClass.m
//  Custom_TableView_with_EditButton
//
//  Created by test on 05/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "EmployeeClass.h"

@implementation EmployeeClass


- (instancetype)initWithName : (NSString *)empName initWithAge: (NSString *)empAge initWithDesignation: (NSString *)empDesignation initWithPhone :  (NSString *)empPhone
{
    self = [super init];
    if (self) {
        self.employeeName = empName;
        self.employeeDesignation = empDesignation;
        self.employeeAge = empAge;
        self.employeePhone = empPhone;
    }
    return self;
}

@end

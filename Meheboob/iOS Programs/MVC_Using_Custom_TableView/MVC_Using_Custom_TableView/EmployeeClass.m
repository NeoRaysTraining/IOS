//
//  EmployeeClass.m
//  MVC_Using_Custom_TableView
//
//  Created by Meheboob Nadaf on 03/05/16.
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

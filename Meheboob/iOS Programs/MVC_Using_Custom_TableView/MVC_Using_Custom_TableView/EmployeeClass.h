//
//  EmployeeClass.h
//  MVC_Using_Custom_TableView
//
//  Created by Meheboob Nadaf on 03/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployeeClass : NSObject
@property(strong ,nonatomic)NSString *employeeName;
@property(strong ,nonatomic)NSString *employeeAge;
@property(strong ,nonatomic)NSString *employeeDesignation;
@property(strong ,nonatomic)NSString *employeePhone;

- (instancetype)initWithName : (NSString *)empName initWithAge: (NSString *)empAge initWithDesignation: (NSString *)empDesignation initWithPhone :  (NSString *)empPhone;
@end

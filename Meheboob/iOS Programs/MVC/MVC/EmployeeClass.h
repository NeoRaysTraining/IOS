//
//  EmployeeClass.h
//  MVC
//
//  Created by test on 03/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployeeClass : NSObject
@property(strong, nonatomic) NSString *employeeName;
@property(strong, nonatomic)NSString *employeeDesignation;
- (instancetype)initWithObjects : (NSString *)empName : (NSString *)empDesignation;
@end

//
//  EmployeeModel.h
//  MVCDemo
//
//  Created by test on 5/3/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmployeeModel : NSObject

@property(nonatomic,strong)NSString* empname;
@property(nonatomic,strong)NSString *empdesignation;


- (instancetype)initWithName:(NSString*)eName Designation:(NSString*)design;


@end

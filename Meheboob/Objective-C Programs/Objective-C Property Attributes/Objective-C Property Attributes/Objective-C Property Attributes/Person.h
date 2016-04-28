//
//  Person.h
//  Objective-C Property Attributes
//
//  Created by Meheboob on 10/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic) NSString *name;

@property (nonatomic) NSString *model;



@property(nonatomic,strong) Person *driver;
@end

//
//  Car.h
//  Objective-C Property Attributes
//
//  Created by test on 10/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
@property NSString *model, *driver;

//Copy Attributes
@property (nonatomic ,copy)NSString *carModel;
@end

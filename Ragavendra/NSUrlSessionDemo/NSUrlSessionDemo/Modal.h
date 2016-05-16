//
//  Modal.h
//  NSUrlSessionDemo
//
//  Created by test on 5/13/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Modal : NSObject
@property(strong,nonatomic)NSString *name,*track;
-(instancetype)initWithName:(NSString*)aname trackName:(NSString*)atrackName;


@end

//
//  Tuna.h
//  Objective-C Scope Directive
//
//  Created by test on 4/8/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tuna : NSObject
{
@private int varY, varG;
    
@protected int Varh,Vare;
}
-(void)changeVar;

-(void)add;
@end

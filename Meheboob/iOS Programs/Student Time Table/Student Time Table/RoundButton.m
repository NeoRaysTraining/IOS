//
//  RoundButton.m
//  Student Time Table
//
//  Created by test on 26/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "RoundButton.h"

@implementation RoundButton
-(void)awakeFromNib{
    
    //self.touchButton.layer.cornerRadius = 10.0;
    
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = TRUE;
    [self.layer setBorderWidth:1.0f];
    [self.layer setBorderColor:[UIColor redColor].CGColor];
}
@end

//
//  RoundButton.m
//  CalculatorApp
//
//  Created by test on 16/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "RoundButton.h"

@implementation RoundButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib{
    
    //self.touchButton.layer.cornerRadius = 10.0;
    
    self.layer.cornerRadius = 23;
    self.layer.masksToBounds = TRUE;
    
}
@end

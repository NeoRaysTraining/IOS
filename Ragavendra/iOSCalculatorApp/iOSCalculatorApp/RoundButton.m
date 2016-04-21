//
//  RoundButton.m
//  iOSCalculatorApp
//
//  Created by test on 4/16/16.
//  Copyright © 2016 NeoRays. All rights reserved.
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




-(void)awakeFromNib
{

    self.layer.cornerRadius=10;
    self.layer.masksToBounds=true;



}



@end

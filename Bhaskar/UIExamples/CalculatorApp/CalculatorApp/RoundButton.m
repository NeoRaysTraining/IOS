//
//  RoundButton.m
//  CalculatorApp
//
//  Created by test on 4/16/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "RoundButton.h"

@implementation RoundButton

-(void)awakeFromNib
{
    self.layer.cornerRadius=23;
    //self.clipsToBounds=YES;
    self.layer.masksToBounds=true;
    //self.backgroundColor=[UIColor blueColor];

}

@end

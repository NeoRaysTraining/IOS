//
//  ButtonRound.m
//  Multiple_Scenes_using_Segues
//
//  Created by test on 19/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ButtonRound.h"

@implementation ButtonRound

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib{
    
    //self.touchButton.layer.cornerRadius = 10.0;
    
    self.layer.cornerRadius = 25;
    self.layer.masksToBounds = TRUE;
    //self.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor redColor]);
    
}
@end

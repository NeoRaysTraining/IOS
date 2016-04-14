//
//  textFieldAndLabels.m
//  UITabBarController
//
//  Created by test on 14/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "textFieldAndLabels.h"

@implementation textFieldAndLabels
{
    NSString *stringFromTextField;
}
- (IBAction)submitForContacts:(id)sender {
    
    stringFromTextField =  self.textFieldForContacts.text;
    
    self.labelForContacts.text = stringFromTextField;
}
@end

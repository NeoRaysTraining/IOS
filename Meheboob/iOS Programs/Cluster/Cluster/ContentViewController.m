//
//  ContentViewController.m
//  Cluster
//
//  Created by test on 15/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ContentViewController.h"

@implementation ContentViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = self.moduleObject.name;
    self.timeLabel.text = self.moduleObject.duration;
    self.imageField.image = [UIImage imageNamed:self.moduleObject.imageFile];
    
    NSMutableString *ingredientText = [NSMutableString string];
    for (NSString* ingredient in self.moduleObject.contents) {
        [ingredientText appendFormat:@"%@\n", ingredient];
    }
    self.textViewField.text = ingredientText;

}
@end

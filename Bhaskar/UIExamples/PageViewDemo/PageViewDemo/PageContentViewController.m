//
//  PageContentViewController.m
//  PageViewDemo
//
//  Created by test on 5/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "PageContentViewController.h"


@interface PageContentViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UILabel *lTitle;

@end


@implementation PageContentViewController

-(void)viewDidLoad
{
    self.backgroundImageView.image=[UIImage imageNamed:_imageFile];
    self.lTitle.text=_titleText;
}

@end

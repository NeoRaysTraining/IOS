//
//  ViewController.m
//  ParallaxViewController
//
//  Created by Meheboob Nadaf on 17/08/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
     self.headerImageViewHeight.constant = 250;
    
   
    [self adjustContentViewHeight];
    self.contentViewHeight.constant = [UIScreen mainScreen].bounds.size.height;
    
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 180, 21)];
    lable.text = @"Meheboob Nadaf";
    lable.textColor = [UIColor whiteColor];
    [self.contentView addSubview:lable];
    
    UILabel *imageLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 220, 180, 20)];
    
    imageLabel.textColor = [UIColor whiteColor];
    imageLabel.text = @"iOS Developer";
    [self.headerImageView addSubview:imageLabel];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  UIroundimage
//
//  Created by test on 4/5/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"log1");
    NSLoog(@"log2");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self performSelector:@selector(circleImage:) withObject:_image afterDelay:0];
}
-(void)circleImage:(UIImageView *)img
{
    img.layer.cornerRadius= self.image.frame.size.height/2.0;
    
    img.clipsToBounds = YES;
    
    NSLof(@"branch2");
    NSLog(@"branch 2 log");
}

@end

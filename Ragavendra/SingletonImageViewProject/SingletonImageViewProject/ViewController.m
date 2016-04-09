//
//  ViewController.m
//  SingletonImageViewProject
//
//  Created by test on 4/5/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewdisp;
@property (weak, nonatomic) IBOutlet UILabel *messagedisplayLabel;
@property(nonatomic,strong)NSString* saveValue;

@end

@implementation ViewController

- (void)viewDidLoad {
  
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Inside viewDidLoad Method ");
    self.imageViewdisp.image=[UIImage imageNamed:@"one"];
   [self. imageViewdisp.layer setCornerRadius:_imageViewdisp.frame.size.width/2];
    
    self.imageViewdisp.layer.cornerRadius = self.imageViewdisp.frame.size.height/2;
   
    self.imageViewdisp.layer.borderWidth = 3.0f;
    self.imageViewdisp.layer.borderColor = [UIColor greenColor].CGColor;
    
    
    self.imageViewdisp.layer.cornerRadius = self.imageViewdisp.frame.size.width/2;
    

//CAShapeLayer* maskLayer = [CAShapeLayer layer];
//UIBezierPath* path = [UIBezierPath bezierPath];
//[path moveToPoint:CGPointMake(75, 200)];
//[path addCurveToPoint:CGPointMake(0, 100) controlPoint1:CGPointMake(0, 150) controlPoint2:CGPointMake(0, 150)];
//    [path addArcWithCenter:CGPointMake(75, 100) radius:75 startAngle:M_PI endAngle:0 clockwise:YES];
//   [path addCurveToPoint:CGPointMake(75, 200) controlPoint1:CGPointMake(150, 150) controlPoint2:CGPointMake(150, 150)];
//[path closePath];
//maskLayer.backgroundColor = [[UIColor clearColor] CGColor];
//maskLayer.path = [path CGPath];
//_imageViewdisp.layer.mask = maskLayer;
//


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveButton:(id)sender
{
    NSLog(@"Inside saveButton Method...");
  
    AppDelegate*app=[UIApplication sharedApplication].delegate;
    
    [app setStrinfo:@"second"];
    self.imageViewdisp.image=[UIImage imageNamed:@"two"];
    self.imageViewdisp.layer.borderWidth = 3.0f;
    self.imageViewdisp.layer.borderColor = [UIColor greenColor].CGColor;
    
}

- (IBAction)loadButton:(id)sender
{
     NSLog(@"Inside loadButton Method...");
    
    AppDelegate*app=[UIApplication sharedApplication].delegate;
    self.saveValue=[app getstringInfo];

    self.imageViewdisp.image=[UIImage imageNamed:@"three"];
    
    self.messagedisplayLabel.text=[NSString stringWithFormat: @"Loaded successfully %@", self.saveValue];

    self.imageViewdisp.layer.borderWidth = 3.0f;
    self.imageViewdisp.layer.borderColor = [UIColor greenColor].CGColor;
   }



@end

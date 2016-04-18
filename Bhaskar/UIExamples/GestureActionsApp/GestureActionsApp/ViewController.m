//
//  ViewController.m
//  GestureActionsApp
//
//  Created by test on 4/15/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)swipe:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imgViewCtrl;
@property (strong, nonatomic) IBOutlet UILabel *label;

@property (nonatomic,strong) NSArray *imageList;

@property (nonatomic,strong) NSArray *labelList;

@property (assign,nonatomic) int i;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _imageList=[NSArray arrayWithObjects:[UIImage imageNamed:@"one"],[UIImage imageNamed:@"two"],[UIImage imageNamed:@"three"], nil];
    
    _labelList = [NSArray arrayWithObjects:@"running",@"walking",@"jumping", nil];
    
    //self.imgViewCtrl.image = [UIImage imageNamed:@"one"];
    self.i=2;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    
}

- (IBAction)swipe:(id)sender {
    
    //NSLog(@"swipe left");
    
    self.imgViewCtrl.image=[self.imageList objectAtIndex:self.i];
    
    
    self.i++;
    if([_imageList count]==self.i)
    {
        self.i=0;
    }
    
    
}
- (IBAction)swipeLeft:(id)sender
{
    self.label.text = [self.labelList objectAtIndex:self.i];
    
    self.i++;
    
    if([_imageList count]==self.i)
    {
        self.i=0;
    }

    
}
@end

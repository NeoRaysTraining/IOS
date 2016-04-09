//
//  ViewController.m
//  CreatingCustomSingletonClass
//
//  Created by test on 4/9/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "SingletonClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.imageView setImage:[UIImage imageNamed:@"one"]];
    SingletonClass *obj=[SingletonClass createSharedInstance];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SaveButton:(id)sender {
    
    [self.imageView setImage:[UIImage imageNamed:@"two"]];
    SingletonClass *obj=[SingletonClass createSharedInstance];
    
    [obj setInfovalueString:@"saving image"];
}

- (IBAction)LoadButton:(id)sender {
    
    [self.imageView setImage:[UIImage imageNamed:@"three"]];
    SingletonClass *obj=[SingletonClass createSharedInstance];
    _displayLabel.text=[NSString stringWithFormat:@"%@ and all images loaded successfull",[obj getInforValue]];
}
@end

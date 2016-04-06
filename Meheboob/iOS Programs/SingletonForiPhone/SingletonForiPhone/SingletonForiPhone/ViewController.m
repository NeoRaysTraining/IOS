//
//  ViewController.m
//  SingletonForiPhone
//
//  Created by test on 4/5/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewField;

@property (weak, nonatomic) IBOutlet UILabel *labelField;

@property (strong, nonatomic) NSString *localStringvariable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageViewField.image = [UIImage imageNamed:@"one"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
- (IBAction)saveButton:(id)sender {
    
    
     AppDelegate *App = [UIApplication sharedApplication].delegate;
    [App settingInformation:@"Loading Image from App Delegate"];
    
    self.localStringvariable = [App getInformation];
    
   
    
    self.imageViewField.image = [UIImage imageNamed:@"two"];
    
 
    self.imageViewField.layer.cornerRadius = self.imageViewField.frame.size.width / 2;
    self.imageViewField.layer.cornerRadius = self.imageViewField.frame.size.height / 2;
    self.imageViewField.clipsToBounds = YES;
    
    self.imageViewField.layer.borderWidth = 2.0f;
    self.imageViewField.layer.borderColor = [UIColor redColor].CGColor;
    
   
    
}

- (IBAction)laodButton:(id)sender {
    AppDelegate *App = [UIApplication sharedApplication].delegate;
    
    _localStringvariable = [App getInformation];
    self.labelField.text  = [NSString stringWithFormat:@"This from Load Button : %@",_localStringvariable];
    
    self.imageViewField.image = [UIImage imageNamed:@"nature"];
}
@end

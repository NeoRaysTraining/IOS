//
//  ViewController.m
//  SegueDemo
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "viewController2.h"

@interface ViewController ()

@property (nonatomic,strong) NSString *userName,*password;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)passDataAction:(id)sender {
    
    self.userName=self.userNameText.text;
    self.password=self.passwordText.text;
    
    [self performSegueWithIdentifier:@"screen2" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    viewController2 *vc=[segue destinationViewController];
    [vc recieveData:self.userName password:self.password];
    
}

@end

//
//  SecondViewController.m
//  SendingDataBackUsingSegue
//
//  Created by Meheboob Nadaf on 07/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

 //In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ViewController *vd = [[ViewController alloc] init];
    
  //CommLetterDetails1 *commsVc = [segue destinationViewController];
    
    NSString *msg = self.myTextField.text;
    
    [vd getMessage:msg];
    
}


- (IBAction)prev:(id)sender {
    
    [self performSegueWithIdentifier:@"backward" sender:self];
}
@end

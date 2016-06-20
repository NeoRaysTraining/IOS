//
//  ViewController.m
//  aeExchange
//
//  Created by Mahaboobsab Nadaf on 15/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic)UIAlertController *alertController;
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

- (IBAction)quickAEButton:(id)sender {
    
    [self performSegueWithIdentifier:@"AEPensionCalculator" sender:self];
}

- (IBAction)menuButton:(id)sender {
    [self showAlert];
    
}





- (void)showAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@""
                                                                             message:@"Exit"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(closeAlert)];
    [alertController.view addGestureRecognizer:tapGestureRecognizer];
    self.alertController = alertController;
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)closeAlert {
    exit(0);
}

- (IBAction)closeAlert:(id)sender {
    [self.alertController dismissViewControllerAnimated:YES
                                             completion:nil];
}

- (IBAction)submitAEDataButton:(id)sender {
    
    [self performSegueWithIdentifier:@"direct" sender:self];
}

- (IBAction)aeNewsButton:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.aeexchange.com/usefulInfo.html"]];
}

- (IBAction)faqButton:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://webpayrolltraining.co.uk/AEHelp/"]];
}

- (IBAction)whichPensionButton:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.pensionplaypen.com/"]];
}

- (IBAction)signUpButton:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www1.aeexchange.com/portal/signup"]];
}
@end

//
//  ViewController.m
//  SendingDataBackUsingSegue
//
//  Created by Meheboob Nadaf on 07/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)next:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.receivedMessage = [[NSString alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)next:(id)sender {
    
    [self performSegueWithIdentifier:@"forward" sender:self];
}

-(void)getMessage:(NSString *)msg{
    self.receivedMessage = msg;
    NSLog(@"Recived Message : %@",msg);
    
    self.myTextField.text = msg;

    self.despalyLabel.text = [NSString stringWithFormat:@"%@",msg];
}

//-(void)viewWillAppear:(BOOL)animated{
//    self.despalyLabel.text =  self.receivedMessage;
//}
    @end

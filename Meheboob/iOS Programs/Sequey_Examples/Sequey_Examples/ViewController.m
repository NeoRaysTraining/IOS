//
//  ViewController.m
//  Sequey_Examples
//
//  Created by test on 19/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
@interface ViewController ()

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




- (IBAction)passButton:(id)sender {
    
    self.nameString = self.nameField.text;
    
    self.passwordString = self.passwordField.text;
    
   [self performSegueWithIdentifier:@"scene2" sender:self];
    

    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {


    ViewController2 *myViewController2 = [segue destinationViewController];
    
    
    [myViewController2 ReceiveNameAndPass:_nameString :_passwordString];
}




@end

//
//  SignUpFirstStep.m
//  Multiple_Scenes_using_Segues
//
//  Created by test on 19/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "SignUpFirstStep.h"
#import "SignUpSecondStep.h"

@interface SignUpFirstStep ()

@end

@implementation SignUpFirstStep{

    NSMutableArray *customerDetails;

}
@synthesize  signUpFields;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    signUpFields = [[NSMutableArray alloc]initWithObjects:@"FirstName",@"LastName",@"mobileNumber",@"emailId",@"Password",@"ReEnterPassowrd", nil];
    
    customerDetails = [[NSMutableArray alloc]init];
    
    _usersDetails = [[NSMutableDictionary alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)nextButton:(id)sender {
    
    customerDetails = [NSMutableArray arrayWithObjects:self.firstNameField.text,self.lastNameField.text,self.mobileNumberField.text,self.emailField.text,self.passwordField.text,self.reEnterPasswordField.text, nil];
    
    _usersDetails = [[NSMutableDictionary alloc ]initWithObjects:customerDetails forKeys:signUpFields];
    
    NSLog(@"Customer First Step Details : %@",_usersDetails);
    
    [self performSegueWithIdentifier:@"Step2" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
   SignUpSecondStep *myFirstStep =  [segue destinationViewController];
    
    [myFirstStep receiveFirstVewDetails:self.usersDetails];

}
@end

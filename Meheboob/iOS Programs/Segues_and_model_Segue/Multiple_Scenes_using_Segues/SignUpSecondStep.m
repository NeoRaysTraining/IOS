//
//  SignUpSecondStep.m
//  Multiple_Scenes_using_Segues
//
//  Created by test on 19/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "SignUpSecondStep.h"
#import "VerifyDetails.h"

@interface SignUpSecondStep ()

@end

@implementation SignUpSecondStep{
 NSMutableArray *customerDetails2;
    
}
@synthesize genderField;
@synthesize maleFemale;
@synthesize  signUpFields2;
@synthesize usersDetails2;
@synthesize ReceivedFirstViewDetails;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    
    
    
    self.signUpFields2 = [[NSMutableArray alloc]initWithObjects:@"DOB",@"Gender",@"Adress", nil];
    
   customerDetails2 = [[NSMutableArray alloc]init];
    
    self.usersDetails2 = [[NSMutableDictionary alloc]init];
    
    
    
    
    
    
    self.maleFemale = [[NSArray alloc]initWithObjects:@"Male",@"Female", nil];
    
       self.genderPickerView.hidden = NO;
    //self.genderPickerView.hidden = YES;
    
    UITapGestureRecognizer *tap =  [[UITapGestureRecognizer alloc]
                                    
                                    initWithTarget:self action:@selector(dismissKeyboard)
                                    ];
    [self.view  addGestureRecognizer:tap];
    
    
    
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    [self.myDOBTextField setInputView:datePicker];
    
    
  
    
    
}


-(void)dismissKeyboard{
    
    
   
    
    self.genderPickerView.hidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return self.maleFemale.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    return [maleFemale objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    self.genderField.text = [maleFemale objectAtIndex:row];
}












-(void)updateTextField:(id)sender
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    //Setting Date format
    [formatter setDateFormat:@"dd/MM/YYYY"];
    
    UIDatePicker *picker = (UIDatePicker*)self.myDOBTextField.inputView;
    self.myDOBTextField.text = [NSString stringWithFormat:@"%@",[formatter stringFromDate: picker.date]];
}





- (IBAction)nextButton:(id)sender {
    
    customerDetails2 = [NSMutableArray arrayWithObjects:self.myDOBTextField.text,self.genderField.text,self.adreeField.text, nil];
    
    self.usersDetails2 = [[NSMutableDictionary alloc ]initWithObjects:customerDetails2 forKeys:signUpFields2];
    
    NSLog(@"Customer Second Step Details : %@",self.usersDetails2);
    
    [self performSegueWithIdentifier:@"VerifyDetails" sender:self];
}


-(void)receiveFirstVewDetails:(NSMutableDictionary *)firstViewDetails{

    self.ReceivedFirstViewDetails = firstViewDetails;
    
    NSLog(@"After receiving value from from first view : %@",self.ReceivedFirstViewDetails);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    VerifyDetails *myVerfiDetails = [segue destinationViewController];
    [myVerfiDetails allCustomerDictionary:self.ReceivedFirstViewDetails :self.usersDetails2];

    //[myVerfiDetails receivedictionary:self.usersDetails2];
}

@end

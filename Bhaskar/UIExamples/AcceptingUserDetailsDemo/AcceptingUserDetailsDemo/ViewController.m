//
//  ViewController.m
//  AcceptingUserDetailsDemo
//
//  Created by test on 4/27/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UISwitch *verifyTermsAndConditions;

@property (assign,nonatomic) int flag;

@property (strong,nonatomic) NSArray *sendingData;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *nextButtonOutLet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.customPickerView setHidden:YES];
    self.genderArray=[[NSArray alloc]initWithObjects:@"Male",@"Female", nil];
    
    self.countryArray=[[NSArray alloc]initWithObjects:@"INDIA",@"USA",@"UK", nil];
    
    self.navigationItem.rightBarButtonItem.enabled=NO;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    

    [textField resignFirstResponder];
    
    if (self.genderText == textField)
    {
        //[self.genderText setKeyboardType:]
        
        [self.genderText setKeyboardAppearance:NO];
        self.customPickerView.hidden = NO;
        
    }
    else if (self.countryText == textField)
    {
        self.customPickerView.hidden = NO;
    }
    return YES;
}


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField==self.genderText) {
        [self.genderText resignFirstResponder];
        self.flag=0;
        [self.customPickerView setHidden:NO];
        [self.customPickerView reloadAllComponents];
        
        
    }
    
    if (textField==self.countryText) {
        [self.countryText resignFirstResponder];

        self.flag=1;
        [self.customPickerView setHidden:NO];
        [self.customPickerView reloadAllComponents];
        
    }
   
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (textField==self.genderText) {
        [self.customPickerView setHidden:YES];
    }
    
    if (textField==self.countryText) {
        [self.customPickerView setHidden:YES];
    }

    
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.genderText) {
        return NO;
    }
    else if (textField==self.countryText)
    {
        return NO;
    }
    return YES;
}

    -(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
    {
        
        return 1;
    }
    
    -(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
    {
        if(self.flag==0){
            
            return [self.genderArray count];
        }
        else
        {
            
            return [self.countryArray count];
        }
        

    }
    
    -(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
    {
        if (self.flag==0){
            
            return self.genderArray[row];
            
        }
        else
        {
            return self.countryArray[row];
            
        }
        
    }
    
    -(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
    {
        if (self.flag==0) {
            self.genderText.text=self.genderArray[row];
        }
        else
        {
           self.countryText.text=self.countryArray[row];
            
        }
        
    [self.customPickerView setHidden:YES ];
    }

- (IBAction)viewingDetailsButton:(id)sender {
    
    
    if (self.nameText.text.length==0||self.ageText.text.length==0||[self.genderText.text isEqualToString:@" "]|| [self.countryText.text isEqualToString:@" "]) {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Caution" message:@"Please fill all the details" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ok=[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
        
       
    }
    
    else
    {
        _sendingData=[[NSArray alloc]initWithObjects:self.nameText.text,self.ageText.text,self.genderText.text,self.countryText.text, nil];
        
        [self performSegueWithIdentifier:@"showDetails"sender:self];
    }
    
}

- (IBAction)verifyAction:(id)sender {
    
    if (self.verifyTermsAndConditions.isOn) {
        self.navigationItem.rightBarButtonItem.enabled=YES;
    }
    else
    {
        self.navigationItem.rightBarButtonItem.enabled=NO;

    }
    }


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2 *vc=[segue destinationViewController];
    [vc receivData:_sendingData];
}
@end

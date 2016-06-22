//
//  CommLetterDetails1.m
//  aeExchange
//
//  Created by Mahaboobsab Nadaf on 20/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "CommLetterDetails1.h"

@interface CommLetterDetails1 ()
@property(weak,nonatomic)UITextField* selectedTextField;
@end

@implementation CommLetterDetails1{


    int decidePicker;
    int selectedIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.selectTitle = [[NSArray alloc]initWithObjects:@"Select Title",@"Mr",@"Mrs",@"Ms",@"Dr",@"Sir",@"Rev",@"Cllr", nil];
    self.selectCountry = [[NSArray alloc]initWithObjects:@"Select Country",@"United kingdom", nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)continueButton:(id)sender {
    [self performSegueWithIdentifier:@"employersDetail" sender:self];
}
- (IBAction)selectTitle:(id)sender {
    
    [self resignTextFields];
    
    decidePicker = 1;
    [self.pickerView reloadAllComponents];
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-260);
    
   
    
    
}
- (IBAction)selectCoutry:(id)sender {
    [self resignTextFields];
    
    decidePicker = 2;
    [self.pickerView reloadAllComponents];
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-260);
}
- (IBAction)pickerDoneButton:(id)sender {
    
    
    
    if (decidePicker == 1) {
        [self.selectTitleButtonOutlet setTitle:[self.selectTitle objectAtIndex:selectedIndex] forState:UIControlStateNormal];
    }
    else if (decidePicker == 2){
        
        [self.selectCountryButtonOutlet
         
         setTitle:[self.selectCountry objectAtIndex:selectedIndex] forState:UIControlStateNormal];
    }
    
    
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height+260);
    

}

-(void)resignTextFields{
    [self.emailTextField resignFirstResponder];
    [self.searchByPostCodeField resignFirstResponder];
    [self.empAdressTextField resignFirstResponder];
    [self.townCityTextField resignFirstResponder];
    [self.coutryTextField resignFirstResponder];
    [self.employeeNumberTextField resignFirstResponder];

    
}



// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (decidePicker == 1) {
        return self.selectTitle.count;
    }
        else{
        
        return self.selectCountry.count;
    }
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (decidePicker == 1) {
        return [self.selectTitle objectAtIndex:row];
    }
    else if(decidePicker == 2){
        
        return [self.selectCountry objectAtIndex:row];
    }
       else{
        return @"";
    }
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    selectedIndex = row;
    
}






- (void)keyboardDidShow:(NSNotification *)notification
{
    NSDictionary* info = [notification userInfo];
    CGRect kbRect = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbRect.size.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbRect.size.height;
    
    
    if (!CGRectContainsPoint(aRect, self.selectedTextField.frame.origin) ) {
        [self.scrollView scrollRectToVisible:self.selectedTextField.frame animated:YES];
    }
}

- (void)keyboardWillBeHidden:(NSNotification *)notification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}
//#pragma mark textfield delegates
- (IBAction)textFieldDidBeginEditing:(UITextField *)sender
{
    self.selectedTextField = sender;
    
}


- (IBAction)textFieldDidEndEditing:(UITextField *)sender
{
    
    
    self.selectedTextField = nil;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

@end

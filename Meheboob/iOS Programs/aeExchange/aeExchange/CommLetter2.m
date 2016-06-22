//
//  CommLetter2.m
//  aeExchange
//
//  Created by Mahaboobsab Nadaf on 20/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "CommLetter2.h"

@interface CommLetter2 ()
@property(weak,nonatomic)UITextField* selectedTextField;

@end

@implementation CommLetter2{

    int selectedIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.selectCountry = [[NSArray alloc]initWithObjects:@"Select Country",@"United Kingdom", nil];
    
    
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
    
    [self performSegueWithIdentifier:@"viewPrintEmailLetter" sender:self];
}

-(void)resignKeyPads{
    [self.searchByEmpNameField resignFirstResponder];
    [self.empBusinessField resignFirstResponder];
    [self.townCityField resignFirstResponder];
    [self.countryField resignFirstResponder];
    [self.postCodeField resignFirstResponder];
    [self.crnField resignFirstResponder];
    [self.employersEmail resignFirstResponder];
    [self.commsLetterField resignFirstResponder];
    [self.employesrsTelepField resignFirstResponder];

    
}
- (IBAction)selectCoutry:(id)sender {
    

    [self resignKeyPads];

self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-260);
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.selectCountry.count;

}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
  
        return [self.selectCountry objectAtIndex:row];
   
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    selectedIndex = row;
    
}

- (IBAction)pickerViewDoneButton:(id)sender {
    [self.selectCoutryoutlet
     
     setTitle:[self.selectCountry objectAtIndex:selectedIndex] forState:UIControlStateNormal];
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height+260);
    
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

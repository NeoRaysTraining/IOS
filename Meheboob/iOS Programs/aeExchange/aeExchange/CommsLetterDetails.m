//
//  CommsLetterDetails.m
//  aeExchange
//
//  Created by Mahaboobsab Nadaf on 20/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "CommsLetterDetails.h"

@interface CommsLetterDetails ()


@property(weak,nonatomic)UITextField* selectedTextField;
@end

@implementation CommsLetterDetails{

    int decideDatePicker;
    int decidePicker;
    int selectedIndex;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.datePickeroutlet.hidden = YES;
    self.datePickerToolOutlet.hidden = YES;
    self.pickerViewDelegate.hidden = YES;
    self.toolBarDelegate.hidden =  YES;
    
    //pickers
    self.selectPensionProviderArray = [[NSArray alloc]initWithObjects:@"Select Pension Provider",@"Demo Pension",@"Aegon Pension",@"Aviva Pension",@"FriendsLife Pension",@"GenLife",@"Hargreaves Lansdown",@"Legal and General Pension",@"NEST Pension",@"NOW: Pension",@"People's Pension",@"Prudential Pension",@"Royal London Group",@"Scottish Widows",@"Standerd Life",@"True Potential",@"Salvus Master Trust",@"Others", nil];
    
    self.selectCountryArray = [[NSArray alloc]initWithObjects:@"Select Country",@"United Kingdom", nil];
    
    
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



- (IBAction)homeButton:(id)sender {
    
    [self performSegueWithIdentifier:@"viewPrintEmailLetter" sender:self];
}




- (IBAction)datePickerDoneButton:(id)sender {
    
   
    
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height+260);
    
    
    NSDate *choosen = [self.datePickeroutlet date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"dd/MM/YYYY"];
    
    NSString *weekDay = [formatter stringFromDate:choosen];
    
    NSString *msg = [[NSString alloc]initWithFormat:@"%@",weekDay];
    
    if (decideDatePicker == 1) {
        [self.stagingButtonOutlet setTitle:msg forState:UIControlStateNormal];
    }
    else if (decideDatePicker == 2){
    
        [self.dateOnCommsLetterButtonOutlet setTitle:msg forState:UIControlStateNormal];
    }
    else{
    
        [self.outOptButtonOutlet setTitle:msg forState:UIControlStateNormal];
    }
    
    
    
    
}

-(void)hideFields{

    [self.pensionProviderNameField resignFirstResponder];
    [self.pensionProviderAdreeField resignFirstResponder];
    [self.townCityField resignFirstResponder];
    [self.countryField resignFirstResponder];
    [self.postCodeField resignFirstResponder];
    [self.pensionProviderEmailIdField resignFirstResponder];
    [self.pensionProviderTelephoneNumberField resignFirstResponder];
}


- (IBAction)pickerDoneButton:(id)sender {
   
    if (decidePicker == 1) {
        [self.pensionProviderButtonOutlet setTitle:[self.selectPensionProviderArray objectAtIndex:selectedIndex] forState:UIControlStateNormal];
   }
    else if (decidePicker == 2){
        [self.selectCoutryOutlet
         
         setTitle:[self.selectCountryArray objectAtIndex:selectedIndex] forState:UIControlStateNormal];
    }
    
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height+260);
}
- (IBAction)continueButton:(id)sender {
    
    [self performSegueWithIdentifier:@"CommLetterDetails" sender:self];
}

- (IBAction)stagingDateButton:(id)sender {
    decideDatePicker = 1;
    [self hidePickers];
    [self hideFields];
     self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-260);
    [self showDatePicker];
    
}

- (IBAction)dateOnCommsButton:(id)sender {
    decideDatePicker = 2;
     [self hidePickers];
    [self hideFields];
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-260);
    [self showDatePicker];
}

- (IBAction)optOutEndDate:(id)sender {
    decideDatePicker = 3;
    
    [self hideFields];
     [self hidePickers];
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-260);
    [self showDatePicker];
}

- (IBAction)selectPensionProviderButton:(id)sender {
    [self hideDatePicker];
    decidePicker = 1;
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-260);
    [self hideDatePicker];
    self.pickerViewDelegate.hidden = NO;
    self.toolBarDelegate.hidden =  NO;
    
    [self.pickerViewDelegate reloadAllComponents];
}

- (IBAction)selectCountryButton:(id)sender {
       [self hideDatePicker];
    
    decidePicker = 2;
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-260);
    [self hideDatePicker];
    self.pickerViewDelegate.hidden = NO;
    self.toolBarDelegate.hidden =  NO;
    [self.pickerViewDelegate reloadAllComponents];
}


-(void)showDatePicker{

    self.datePickeroutlet.hidden = NO;
    self.datePickerToolOutlet.hidden = NO;
    
}
-(void)hideDatePicker{
    
    self.datePickeroutlet.hidden = YES;
    self.datePickerToolOutlet.hidden = YES;
    
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (decidePicker == 1) {
        return self.selectPensionProviderArray.count;
   }
    else
       return self.selectCountryArray.count;
   

}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (decidePicker == 1) {
        return [self.selectPensionProviderArray objectAtIndex:row];
    }

    else{
        return [self.selectCountryArray objectAtIndex:row];
    }
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    selectedIndex = row;
    
}

-(void)hidePickers{
    self.pickerViewDelegate.hidden = YES;
    self.toolBarDelegate.hidden =  YES;
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

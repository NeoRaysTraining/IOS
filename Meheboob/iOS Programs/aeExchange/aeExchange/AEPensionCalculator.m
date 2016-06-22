//
//  AEPensionCalculator.m
//  aeExchange
//
//  Created by Mahaboobsab Nadaf on 15/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "AEPensionCalculator.h"
#define kOFFSET_FOR_KEYBOARD 180.0
@interface AEPensionCalculator ()
@property(nonatomic,assign)BOOL keypadFlag;
@end

@implementation AEPensionCalculator{

    int decidePicker;
    int selectedIndex;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    self.activityIndicator.hidden = YES;
    self.loadingLabel.hidden = YES;
    
    self.payFrequency = [[NSArray alloc] initWithObjects:@"Weekly",@"Monthly",@"2 Weekly",@"4 Weekly",@"Quarterly",@"Bi-annual",@"Annual", nil];
    self.taxReliefArrangement = [[NSArray alloc]initWithObjects:@"Net Pay Arrangement",@"Relief at Source", nil];
    self.selectEarningBasis = [[NSArray alloc]initWithObjects:@"Full Pensionable Earning",@"Banded Qualified Earnings", nil];
    self.genders = [[NSArray alloc]initWithObjects:@"Male",@"Female", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)homeButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)calculateButton:(id)sender {
    
    [self performSegueWithIdentifier:@"AEPensionResult" sender:self];
}

- (IBAction)payFrequencyButton:(id)sender {
    decidePicker = 1;
    [self.pickerViewOutlet reloadAllComponents];
     self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-260);
    
    self.datePicker.hidden = YES;
    self.datePickerToolBar.hidden = YES;
    self.pickerViewOutlet.hidden = NO;
    self.pickerToolBar.hidden = NO;
    
   
    
    
   

}
- (IBAction)pickerViewDoneButton:(id)sender {
    
    if (decidePicker == 1) {
        [self.payFrequencyOutlet setTitle:[self.payFrequency objectAtIndex:selectedIndex] forState:UIControlStateNormal];
    }
    else if (decidePicker == 2){
        
        [self.taxReliefArragemetOutlet
         
         setTitle:[self.taxReliefArrangement objectAtIndex:selectedIndex] forState:UIControlStateNormal];
    }
    else if (decidePicker == 3){
        [self.selectEarningBasisOutlet
         
         setTitle:[self.selectEarningBasis objectAtIndex:selectedIndex] forState:UIControlStateNormal];
    }
    else if (decidePicker == 4){
        [self.selectTheGenderOutlet
         
         setTitle:[self.genders objectAtIndex:selectedIndex] forState:UIControlStateNormal];
    }

    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height+260);
    
    
    
   
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (decidePicker == 1) {
         return self.payFrequency.count;
    }
    else if(decidePicker == 2){
    
        return self.taxReliefArrangement.count;
    }
    else if (decidePicker == 3){
        return self.selectEarningBasis.count;
    }
    else{
    
        return self.genders.count;
    }
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
  
    if (decidePicker == 1) {
          return [self.payFrequency objectAtIndex:row];
    }
    else if(decidePicker == 2){
        
          return [self.taxReliefArrangement objectAtIndex:row];
    }
    else if (decidePicker == 3){
  return [self.selectEarningBasis objectAtIndex:row];
    }
    else if(decidePicker == 4){
    return [self.genders objectAtIndex:row];
    }
    else{
    return @"";
    }
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    selectedIndex = row;

    }


- (IBAction)taxReliefArrangement:(id)sender {
    [self resignAllKeyBoards];
     decidePicker = 2;
    
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-260);
   
    [self.pickerViewOutlet reloadAllComponents];
    self.datePicker.hidden = YES;
    self.datePickerToolBar.hidden = YES;
    self.pickerViewOutlet.hidden = NO;
    self.pickerToolBar.hidden = NO;

   
   
}
- (IBAction)selectEarningBasis:(id)sender {
    [self resignAllKeyBoards];
    decidePicker = 3;
    
    [self.pickerViewOutlet reloadAllComponents];
    self.datePicker.hidden = YES;
    self.datePickerToolBar.hidden = YES;
    self.pickerViewOutlet.hidden = NO;
    self.pickerToolBar.hidden = NO;
    
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-260);
    
  
}
- (IBAction)selectGender:(id)sender {
    [self resignAllKeyBoards];
    
    decidePicker = 4;
    [self.pickerViewOutlet reloadAllComponents];
    self.datePicker.hidden = YES;
    self.datePickerToolBar.hidden = YES;
    self.pickerViewOutlet.hidden = NO;
    self.pickerToolBar.hidden = NO;
    
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-260);
    
  
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if ([_employeeTextField isFirstResponder]|[_employerTextField isFirstResponder]) {
        
        if(range.length + range.location > textField.text.length)
        {
            return NO;
        }
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        
        
        
        
        NSString *newStr = [textField.text stringByReplacingCharactersInRange:range withString:string];
        
        NSString *expression = @"^([0-9]*)(\\.([0-9]+)?)?$";
        
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression
                                                                               options:NSRegularExpressionCaseInsensitive
                                                                                 error:nil];
        NSUInteger noOfMatches = [regex numberOfMatchesInString:newStr
                                                        options:0
                                                          range:NSMakeRange(0, [newStr length])];
        if (noOfMatches==0){
            return NO;
        }
        return newLength <= 6;
        return YES;

        
    }
    else{
    
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    
    NSUInteger newLength = [textField.text length] + [string length] - range.length;
    
    
    
    
    NSString *newStr = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    NSString *expression = @"^([0-9]*)(\\.([0-9]+)?)?$";
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:expression
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    NSUInteger noOfMatches = [regex numberOfMatchesInString:newStr
                                                    options:0
                                                      range:NSMakeRange(0, [newStr length])];
    if (noOfMatches==0){
        return NO;
    }
    return newLength <= 20;
    return YES;
}
}
//- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//    
//    [textField resignFirstResponder];
//    return YES;
//    
//}
- (IBAction)dateOfBirth:(id)sender {
    [self resignAllKeyBoards];
    self.pickerViewOutlet.hidden = YES;
    self.pickerToolBar.hidden = YES;
    self.datePickerToolBar.hidden = NO;
    self.datePicker.hidden = NO;
    
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-260);
    
}
- (IBAction)datePickerDone:(id)sender {
    
   
    
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height+260);
    
    
    NSDate *choosen = [_datePicker date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"dd/MM/YYYY"];
    
    NSString *weekDay = [formatter stringFromDate:choosen];
    
    NSString *msg = [[NSString alloc]initWithFormat:@"%@",weekDay];
    
    [self.dateOfBirtOulet setTitle:msg forState:UIControlStateNormal];
}

-(void)resignAllKeyBoards{

    [self.employeeTextField resignFirstResponder];
    [self.employerTextField resignFirstResponder];
    [self.pensionableEarningTextField resignFirstResponder];
    [self.avcTextField resignFirstResponder];
    

}










//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if (textField==self.employerTextField||textField==self.employeeTextField || textField == self.avcTextField) {
        if (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
        else if (self.view.frame.origin.y < 0)
        {
            [self setViewMovedUp:NO];
        }
        
        
    }
    [textField resignFirstResponder];
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField==self.employeeTextField||textField==self.employerTextField||textField==self.avcTextField)
    {
        self.keypadFlag=true;
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
}
@end

//
//  PensionSchemeVC.m
//  AEExchange
//
//  Created by test on 6/21/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "PensionSchemeVC.h"
#define kOFFSET_FOR_KEYBOARD 80.0
@interface PensionSchemeVC ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
@property(nonatomic,assign)int keyFlag;
@end

@implementation PensionSchemeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pensionProviderDeatails = [[NSArray alloc]initWithObjects:@"Demo Pension",@"Aegon Pension",@"Aviva Pension",@"FriendsLife Pension",@"Gen Life",@"Hargreave Lansdown",@"Legal and General Pension",@"NEST Pension",@"NOW:Pension",@"People's Pension",@"Prudential Pension",@"Royal London Group",@"Scottish Widows",@"Standard Life",@"True Potential",@"Salvus Master Trust",@"others", nil];

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
- (IBAction)continueButton:(id)sender
{
    [self performSegueWithIdentifier:@"letterDetails" sender:self];
}

- (IBAction)selectPensionProvider:(id)sender
{
    [self showPicker];
}
- (IBAction)pickerDone:(id)sender
{
       [self.pensionProviderStackView setHidden:false];
    [self hidePicker];
    self.secondView.userInteractionEnabled=YES;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.pensionProviderDeatails.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return  self.pensionProviderDeatails[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.provideNameField.text = self.pensionProviderDeatails[row];
}
-(void)hidePicker
{
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height+175);
    [self.customPicker setHidden:true];
    [self.toolBar setHidden:true];

}
-(void)hideDatePicker
{
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height+175);
    [self.datePicker setHidden:true];
    [self.dateToolBar setHidden:true];

}
-(void)showPicker
{
    [self.customPicker setHidden:false];
    [self.toolBar setHidden:false];
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-175);
    self.secondView.userInteractionEnabled=NO;

}
-(void)showDatePicker
{

    [self.datePicker setHidden:false];
    [self.dateToolBar setHidden:false];
     self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-175);
    self.secondView.userInteractionEnabled=NO;
}

- (IBAction)stagingDate:(id)sender
{
    self.keyFlag=0;
    [self showDatePicker];
    [self.datePicker reloadInputViews];
}

- (IBAction)optOutEndDate:(id)sender
{
    self.keyFlag=2;
    [self showDatePicker];
    [self.datePicker reloadInputViews];
}

- (IBAction)datePickerDone:(id)sender
{
    
    [self hideDatePicker];
    self.secondView.userInteractionEnabled=YES;
    if(self.keyFlag==0)
    {
        NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd/MM/yyyy"];
        [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        [self.stagingDate setTitle:[NSString stringWithFormat:@"%@",[formatter stringFromDate:self.datePicker.date] ] forState:UIControlStateNormal];
    }
    
    if(self.keyFlag==1)
    {
        NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd/MM/yyyy"];
        [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        [self.dateOfCommLett setTitle:[NSString stringWithFormat:@"%@",[formatter stringFromDate:self.datePicker.date] ] forState:UIControlStateNormal];
    }
    
    if(self.keyFlag==2)
    {
        NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd/MM/yyyy"];
        [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        
        [self.optOutEndDate setTitle:[NSString stringWithFormat:@"%@",[formatter stringFromDate:self.datePicker.date] ] forState:UIControlStateNormal];
    }


    
}
- (IBAction)dateOnCommlett:(id)sender
{
    self.keyFlag=1;
    [self showDatePicker];
    [self.datePicker reloadInputViews];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    

    [self animateTextField: textField up: YES];
   
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    [self animateTextField: textField up: NO];
     [textField resignFirstResponder];
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    self.datePicker.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height+250);
    
    const int movementDistance = 250; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end

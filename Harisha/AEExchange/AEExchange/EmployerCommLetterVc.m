//
//  EmployerCommLetterVc.m
//  AEExchange
//
//  Created by test on 6/24/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "EmployerCommLetterVc.h"

@interface EmployerCommLetterVc ()
- (IBAction)ContinueButton:(id)sender;

@end

@implementation EmployerCommLetterVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.countryDetails = [[NSArray alloc]initWithObjects:@"United Kingdom", nil];
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

- (IBAction)ContinueButton:(id)sender
{
    [self performSegueWithIdentifier:@"printcommletter" sender:self];
}
- (IBAction)pickerDone:(id)sender
{
    [self hidePicker];
    [self.countryName setTitle:self.countryString forState:normal];
}
- (IBAction)selectCountry:(id)sender
{
    [self showPicker];
}
-(void)hidePicker
{
    
    [self.pickerView setHidden:true];
    [self.pickerToolbar setHidden:true];
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height+150);
    self.secondView.userInteractionEnabled=YES;
}
-( void)showPicker
{
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-150);
    [self.pickerView setHidden:false];
    [self.pickerToolbar setHidden:false];
    self.secondView.userInteractionEnabled=NO;
    
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return self.countryDetails.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return self.countryDetails[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.countryString = self.countryDetails[row];
}


@end

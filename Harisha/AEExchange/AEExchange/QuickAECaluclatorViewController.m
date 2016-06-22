//
//  QuickAECaluclatorViewController.m
//  AEExchange
//
//  Created by test on 6/16/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "QuickAECaluclatorViewController.h"

@interface QuickAECaluclatorViewController ()<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
@property(strong,nonatomic)NSString* freqString;
@property(nonatomic,assign)BOOL keyFlag;
- (IBAction)caluclatePension:(id)sender;

@end

@implementation QuickAECaluclatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem.backBarButtonItem setTitle:@"Title here"];
   
    self.FreqperiodPickerArray = [[NSArray alloc]initWithObjects:@"Monthly",@"Quaterly",@"Weekly",@"day", nil];
    
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

- (IBAction)caluclatePension:(id)sender
{
    [self performSegueWithIdentifier:@"AECaluclationResult" sender:self];
}

-(void)hidePicker
{
    
    [self.picker setHidden:true];
    [self.pickerViewToolBar setHidden:true];
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height+250);
}
-( void)showPicker
{
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-250);
    [self.picker setHidden:false];
    [self.pickerViewToolBar setHidden:false];
}
-(void)hideDatePicker
{
    [self.datePicker setHidden:true];
    [self.datePickerToolBar setHidden:true];
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height+200);

}
-(void)showDatePicker
{
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-200);
    [self.datePickerToolBar setHidden:false];
    [self.datePicker setHidden:false];
}
-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide
{
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
   
    
    if (textField==self.empContributionRate||textField==self.employeecontRate||textField==self.avc)
    {
        [self hideDatePicker];
        [self hidePicker];
        self.keyFlag=true;
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
    
   
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
    if (textField==self.empContributionRate||textField==self.employeecontRate||textField==self.avc) {
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




- (IBAction)genderButton:(id)sender
{
    [self showPicker];
   
}



- (IBAction)payFrequencyButton:(id)sender
{
    [self showPicker];
}


- (IBAction)datePickerDone:(id)sender
{
    [self hideDatePicker];
    
}

- (IBAction)customPicDone:(id)sender
{
    [self.payFrequencyButton setTitle:self.freqString forState:normal];
    [self hidePicker];
    
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.FreqperiodPickerArray.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
   return  self.FreqperiodPickerArray[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.freqString = self.FreqperiodPickerArray[row];
}
- (IBAction)netPayArrangements:(id)sender
{
    [self.pickerViewToolBar setHidden:false];
    [self.picker setHidden:false];
}
- (IBAction)dateofBirth:(id)sender
{
    [self.pickerViewToolBar setHidden:false];
    [self.picker setHidden:false];
}

- (IBAction)taxReliefArrange:(id)sender
{
    [self showPicker];
}

- (IBAction)earningBasis:(id)sender
{
    [self.pickerViewToolBar setHidden:false];
    [self.picker setHidden:false];
}
@end

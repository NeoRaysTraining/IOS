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
@property(nonatomic,assign)int keyFlag;
@property(nonatomic,assign)int decidePickerArray;
- (IBAction)caluclatePension:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *secondView;

@end

@implementation QuickAECaluclatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem.backBarButtonItem setTitle:@"Title here"];
   
    self.FreqperiodPickerArray = [[NSArray alloc]initWithObjects:@"Weekly",@"Monthly",@"2Weekly",@"4Weekly",@"Quaterly",@"Bi-annual",@"Annual", nil];
    self.taxRelief=[[NSArray alloc]initWithObjects:@"Net Pay Arrangements",@"Relief at Source", nil];
    self.earningBasisArray = [[NSArray alloc]initWithObjects:@"Full Pensionable Earning",@"Banded Qualified Earnings", nil];
    self.gender = [[NSArray alloc]initWithObjects:@"Male",@"Female", nil];
    
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
    self.secondView.userInteractionEnabled=YES;
}
-( void)showPicker
{
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-250);
    [self.picker setHidden:false];
    [self.pickerViewToolBar setHidden:false];
    self.secondView.userInteractionEnabled=NO;
    
}
-(void)hideDatePicker
{
    [self.datePicker setHidden:true];
    [self.datePickerToolBar setHidden:true];
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height+200);
    self.secondView.userInteractionEnabled=YES;

}
-(void)showDatePicker
{
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-200);
    [self.datePickerToolBar setHidden:false];
    [self.datePicker setHidden:false];
    self.secondView.userInteractionEnabled=NO;
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
   

    textField.keyboardType=UIKeyboardTypeNumberPad;
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
    
    self.decidePickerArray=3;
    [self showPicker];
    [self.picker reloadAllComponents];
   
}



- (IBAction)payFrequencyButton:(id)sender
{
    
    self.decidePickerArray=0;
    [self showPicker];
    [self.picker reloadAllComponents];
}


- (IBAction)datePickerDone:(id)sender
{
    [self hideDatePicker];
    [self.datePicker setHidden:true];
    [self.datePickerToolBar setHidden:true];
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [self.dateofBirth setTitle:[NSString stringWithFormat:@"%@",[formatter stringFromDate:self.datePicker.date] ] forState:UIControlStateNormal];
    
}

- (IBAction)customPicDone:(id)sender
{
   
    [self hidePicker];
    if(self.decidePickerArray==0)
    {
        [self.payFrequencyButton setTitle:self.freqString forState:normal];
    }
    if (self.decidePickerArray==1)
    {
        [self.netPayArrangements setTitle:self.freqString forState:normal];
    }
    if (self.decidePickerArray==2)
    {
        [self.earningBasis setTitle:self.freqString forState:normal];
    }
    if (self.decidePickerArray==3)
    {
        [self.genderButton setTitle:self.freqString forState:normal];
    }

    
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *reqPickerArray = [self returnRequiredArray:self.decidePickerArray];
    return reqPickerArray.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *reqPickerArray = [self returnRequiredArray:self.decidePickerArray];
    return reqPickerArray[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSArray *reqPickerArray = [self returnRequiredArray:self.decidePickerArray];
    self.freqString = reqPickerArray[row];
   // [self setButtonTitle:self.freqString];
}
- (IBAction)dateofBirth:(id)sender
{
    [self showDatePicker];
    
}

- (IBAction)taxReliefArrange:(id)sender
{
    self.decidePickerArray=1;
    [self showPicker];
    [self.picker reloadAllComponents];
}

- (IBAction)earningBasis:(id)sender
{
    
    self.decidePickerArray=2;
    [self showPicker];
    [self.picker reloadAllComponents];
}

-(NSArray*)returnRequiredArray:(int)category{
    
    switch (category) {
        case 0:
            return self.FreqperiodPickerArray;
            break;
        case 1:
            return self.taxRelief;
            break;
        case 2:
            return self.earningBasisArray;
            break;
        case 3:
            return self.gender;
            break;
        default:
            break;
    }
    return 0;
}


@end

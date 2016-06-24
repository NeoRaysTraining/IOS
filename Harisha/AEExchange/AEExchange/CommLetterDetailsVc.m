//
//  CommLetterDetailsVc.m
//  AEExchange
//
//  Created by test on 6/24/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "CommLetterDetailsVc.h"

@interface CommLetterDetailsVc ()<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
- (IBAction)continueButton:(id)sender;
@property(nonatomic,strong)NSString* titleButton;
@end

@implementation CommLetterDetailsVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.EmployeeTitle = [[NSArray alloc]initWithObjects:@"Mr",@"Mrs",@"Miss",@"Ms",@"Dr",@"Sir",@"Rev",@"Cllr", nil];
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
    [self performSegueWithIdentifier:@"commletter" sender:self];
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return self.EmployeeTitle.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return self.EmployeeTitle[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.titleButton= self.EmployeeTitle[row];
}

- (IBAction)setEmpTitle:(id)sender
{
    
    [self showPicker];
}
- (IBAction)pickerDone:(id)sender
{
    [self hidePicker];
    [self.setTitle setTitle:self.titleButton forState:normal];
}

-(void)hidePicker
{
    
    [self.pickerView setHidden:true];
    [self.pickerToolBar setHidden:true];
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height+150);
    self.secondView.userInteractionEnabled=YES;
}
-( void)showPicker
{
    self.scrollView.frame=CGRectMake(0, self.scrollView.frame.origin.y, self.scrollView.frame.size.width, self.scrollView.frame.size.height-150);
    [self.pickerView setHidden:false];
    [self.pickerToolBar setHidden:false];
    self.secondView.userInteractionEnabled=NO;
    
}

@end

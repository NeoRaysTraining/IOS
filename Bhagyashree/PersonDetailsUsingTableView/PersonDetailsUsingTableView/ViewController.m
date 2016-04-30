//
//  ViewController.m
//  PersonDetailsUsingTableView
//
//  Created by test on 4/27/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameFiled;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;
@property (weak, nonatomic) IBOutlet UITextField *countryField;
@property (weak, nonatomic) IBOutlet UISwitch *switchButton;
@property (nonatomic,strong) NSArray* genders;
@property (nonatomic,strong) NSArray* countries;
@property (nonatomic,strong) UIPickerView *select;
@property(nonatomic,strong) NSString* name;
@property (nonatomic,strong) NSString* age;
@property(nonatomic,strong) NSString* gender;
@property (nonatomic,strong)NSString* country;
@property NSUInteger flag;
@property (nonatomic,strong) NSArray * sendArray;
@property (weak, nonatomic) IBOutlet UIButton *nextOutlet;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _select = [[UIPickerView alloc] initWithFrame:CGRectZero];
    _select.delegate = self;
    _select.dataSource = self;
    [_select setShowsSelectionIndicator:YES];
    _genderField.inputView = _select;
    _countryField.inputView = _select;
    
    _genders = [[NSArray alloc] initWithObjects:@"Male",@"Female", nil];
    _countries = [[NSArray alloc] initWithObjects:@"India",@"USA",@"Australia",@"UK", nil];
    
    self.nextOutlet.hidden=YES;

}
- (IBAction)tapGesture:(id)sender {
    [self.nameFiled resignFirstResponder];
    [self.ageField resignFirstResponder];
    [self.genderField resignFirstResponder];
    [self.countryField resignFirstResponder];
    
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    _flag=0;
    if([_genderField isFirstResponder])
    {
    _flag= _genders.count;
    }
    else
    {
    _flag= _countries.count;
    }
    return _flag;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if([_genderField isFirstResponder])
    return _genders[row];
    else
    return _countries[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if([_genderField isFirstResponder])
        _genderField.text = self.genders[row];
        _gender=_genderField.text;
        [_genderField resignFirstResponder];
    if([_countryField isFirstResponder])
        _countryField.text =self.countries[row];
        _country=_countryField.text;
    [_countryField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchAction:(id)sender {
    
    
    if([_switchButton isOn])
    {
        
        self.name=self.nameFiled.text;
        self.age=self.ageField.text;
        _sendArray=@[_name,_age,_gender,_country];

        self.nextOutlet.hidden=NO;
    }
    else
    {
    }
}
- (IBAction)nextButton:(id)sender {
    
    [self performSegueWithIdentifier:@"Segue1" sender:self];

}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2 *VC2 = [segue destinationViewController];
    [VC2 receiveData:self.sendArray];
}

@end


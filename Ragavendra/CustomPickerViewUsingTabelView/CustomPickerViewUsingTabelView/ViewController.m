//
//  ViewController.m
//  CustomPickerViewUsingTabelView
//
//  Created by test on 4/27/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@property (nonatomic,strong)NSString  *nameFieldVal;
@property (nonatomic,strong)NSString *ageFieldVal;

@property (nonatomic,strong)NSMutableArray *countryFieldval;
@property (nonatomic,strong)NSMutableArray *genderFieldVal;


@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    picker=[[UIPickerView alloc] init];
    
    
    
    self.nameFieldVal=[[NSString alloc]init];
    self.ageFieldVal=[[NSString alloc]init];
    
    self.countryFieldval=[[NSMutableArray alloc]init];
    self.genderFieldVal=[[NSMutableArray alloc]init];
    
    picker.delegate = self;
    picker.dataSource = self;
    [picker setShowsSelectionIndicator:YES];
    picker.tintColor =[UIColor brownColor];
    picker.backgroundColor=[UIColor whiteColor];
country=[[NSArray alloc]initWithObjects:@"U.S.A",@"U.K",nil];

    gender=[[NSArray alloc]initWithObjects:@"Male",@"Female", nil];;
    

    [self.countryField  setInputView:picker];
    [self.genderField  setInputView:picker];

    
    
    
    
UIToolbar *toolbar= [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];

    [toolbar setTintColor:[UIColor blueColor]];
    
    
    
    UIBarButtonItem *doneButton=[[UIBarButtonItem alloc]initWithTitle:@"done" style:UIBarButtonItemStyleDone target:self action:@selector (done)];

[toolbar setItems: [NSArray arrayWithObjects:doneButton, nil]];
    [self.countryField setInputAccessoryView:toolbar];
   [self.genderField setInputAccessoryView:toolbar];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{

    return 1;


}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    
    if ([self.countryField isFirstResponder  ]) {
        
        return [country count];
        
        
    }
    if ([self.genderField isFirstResponder  ]) {
        
        return [gender count];
        
        
    }

    return 0;

}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{


if([self.countryField isFirstResponder ])
{
    return [country objectAtIndex:row];



}
    if([self.genderField isFirstResponder ])
    {
        return [gender objectAtIndex:row];
        
        
        
    }
  
    return 0;

}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if([self.countryField isFirstResponder])
    {
        self.countryField.text=[country objectAtIndex:row];
    
   }

    if([self.genderField isFirstResponder])
    {
        self.genderField.text=[gender objectAtIndex:row];
        
        
        
    }


}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
{

   
    
    [picker reloadAllComponents];
    
    return YES;

}


-(void)done
{

    [self.countryField resignFirstResponder];
    [self.genderField resignFirstResponder];
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField






{
    [textField resignFirstResponder];
    
    
    return YES;


}

- (IBAction)nextButton:(id)sender {
    
    
    self.nameFieldVal=self.nameField.text;
    self.ageFieldVal=self.ageField.text;
    
    if([self.nameField.text isEqualToString:@""]){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Fill All The Details"
                                                                       message:@"Invalid  Name"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
    
    if([self.ageField.text isEqualToString:@""]){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Fill All The Details"
                                                                       message:@"Invalid  Age"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }

    if([self.genderField.text isEqualToString:@""]){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Fill All The Details"
                                                                       message:@"Plese Select gender  "
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    

    if([self.countryField.text isEqualToString:@""]){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Fill All The Details"
                                                                       message:@"Invalid  CountryName"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
   
        
    
    
    
    
    if(self.switchOutletOnOff.isOn)
{
    
 [self performSegueWithIdentifier:@"next" sender:self];



}
    
else
{

UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Fill All The Details"
                                                                   message:@"Invalid Detsils" 
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}

    [self.countryFieldval insertObject:self.countryField.text atIndex:0];

    [self.genderFieldVal insertObject:self.genderField.text atIndex:1];


}

- (IBAction)tapGestureButton:(id)sender {


[self.nameField  resignFirstResponder];

[self.ageField  resignFirstResponder];

[self.genderField  resignFirstResponder];
[self.countryField  resignFirstResponder];





}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

ViewController2*vc2=[segue destinationViewController];
[vc2 receivedAllDetails:self.countryFieldval:self.genderFieldVal];
[vc2 receivednameandAge:self.nameFieldVal :self.ageFieldVal];



}
    
@end

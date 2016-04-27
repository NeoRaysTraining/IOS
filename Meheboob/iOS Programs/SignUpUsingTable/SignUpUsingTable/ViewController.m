//
//  ViewController.m
//  SignUpUsingTable
//
//  Created by test on 27/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.fieldNames = [[NSArray alloc]initWithObjects:@"Name",@"Age",@"Gender",@"Country", nil];
    
    self.fieldValues = [[NSMutableArray alloc]init];
    
    
    self.firstSceneDetails = [[NSMutableDictionary alloc]init];
    
    
    
    
    
    
    
    
    
    
    Picker =
    [
     [UIPickerView alloc] init
     ];
    Picker.delegate = self;
    Picker.dataSource = self;
    [Picker setShowsSelectionIndicator: YES];
    Picker.tintColor = [UIColor greenColor];
    Picker.backgroundColor = [UIColor colorWithRed: 153.0 green: 204.0 blue: 255.0 alpha: 2];
    
    
    CountryArray =
    [
     [NSArray alloc] initWithObjects: @ "USA", @ "India", @ "France", @"America",@"UK",@"Pakistan",@"Sri Lanka",@"Bangladesh",nil
     ];
    
    
    gender =
    [
     [NSArray alloc] initWithObjects: @ "Male", @ "Female", nil
     ];
    
    
    //ForPicker
    [self.countryLabel setInputView: Picker];
    [self.GenderLabel setInputView: Picker];
    
    
    //For ToolBar
    UIToolbar * toolBar =
    [
     [UIToolbar alloc] initWithFrame: CGRectMake(0, 0, 320, 45)
     ];
    [toolBar setTintColor: [UIColor blueColor]];
    UIBarButtonItem * doneBtn =
    [
     [UIBarButtonItem alloc] initWithTitle: @ "Done"
     style: UIBarButtonItemStyleDone target: self action: @selector(Done)
     ];
    
   [toolBar setItems: [NSArray arrayWithObjects: doneBtn, nil]];
  
    
    
    
    
    //for country textfield
    [self.countryLabel setInputAccessoryView: toolBar];
    
    //for Height textfield
    [self.GenderLabel setInputAccessoryView: toolBar];

    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    UITapGestureRecognizer *tap =  [[UITapGestureRecognizer alloc]
                                    
                                    initWithTarget:self action:@selector(dismissKeyboard)
                                    ];
    [self.view  addGestureRecognizer:tap];
    
    
    
    
    
}



-(void) Done
{
    
   
    
    //forPicker
    [self.countryLabel resignFirstResponder];
    [self.GenderLabel resignFirstResponder];
}



//For Picker
-(NSInteger) numberOfComponentsInPickerView: (UIPickerView * ) pickerView
{
           return 1;
}

- (NSInteger) pickerView: (UIPickerView * ) pickerView numberOfRowsInComponent: (NSInteger) component
{
    if ([self.countryLabel isFirstResponder])
    {
        
        return [CountryArray count];
        
    }
    
     if ([self.GenderLabel isFirstResponder])
    {
        
       
            return [gender count];
        }
    
    return 0;
    }



- (NSString * ) pickerView: (UIPickerView * ) pickerView titleForRow: (NSInteger) row forComponent: (NSInteger) component {
    if ([self.countryLabel isFirstResponder])
    {
        return [CountryArray objectAtIndex: row];
        
    }
    
    else if ([self.GenderLabel isFirstResponder])
    {
        return [gender objectAtIndex:row];
        
     }
    
    return 0;
  
}

- (void) pickerView: (UIPickerView * ) pickerView didSelectRow: (NSInteger) row inComponent: (NSInteger) component
{
    
    if ([self.countryLabel isFirstResponder])
    {
        self.countryLabel.text = [CountryArray objectAtIndex: row];
    }
    if ([self.GenderLabel isFirstResponder])
    {
        
        self.GenderLabel.text = [gender objectAtIndex:row];
    }  
    
}








-(void) textFieldDidBeginEditing: (UITextField * ) textField
{
    [Picker reloadAllComponents];
}











-(void)dismissKeyboard{
    [self.NameLabel resignFirstResponder];
    
    [self.AgeLabel resignFirstResponder];
    
    [self.countryLabel resignFirstResponder];
    
    [self.GenderLabel resignFirstResponder];
    
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    [self.NameLabel resignFirstResponder];
    
    [self.countryLabel resignFirstResponder];
    
    [self.GenderLabel resignFirstResponder];
    
    [self.AgeLabel resignFirstResponder];
    
    return YES;

}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








































- (IBAction)switchButton:(id)sender {
}
- (IBAction)NextButton:(id)sender {
    
    
    
    
    if ([self.NameLabel.text isEqualToString:@""]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                       message:@"Please provide your name."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }

    
    
    if ([self.AgeLabel.text isEqualToString:@""]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                       message:@"Please provide your Age."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    
    if ([self.GenderLabel.text isEqualToString:@""]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                       message:@"Please provide your Gender"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    

    if ([self.countryLabel.text isEqualToString:@""]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                       message:@"Please provide your Country name."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    if (  self.switchButtonOutlet.isOn) {
        
        
        [self.fieldValues insertObject:self.NameLabel.text atIndex:0];
        
        
        [self.fieldValues insertObject:self.AgeLabel.text atIndex:1];
        
        
        [self.fieldValues insertObject:self.GenderLabel.text atIndex:2];
        
        
        [self.fieldValues insertObject:self.countryLabel.text atIndex:3];
        
        
        self.firstSceneDetails = [[NSDictionary alloc]initWithObjects:self.fieldValues forKeys:self.fieldNames];
        
        [self performSegueWithIdentifier:@"first" sender:self];
        
        NSLog(@"Field Names : %@",self.fieldNames);
        
        NSLog(@"Field Values : %@",self.fieldValues);
        
    }
    
    
    
    else{
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                       message:@"Please Agree for Terms & conditions."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    
    }
    
    
    
    
    
}



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ViewController2 *Vc2 = [segue destinationViewController];
    
    [Vc2 getDetails:self.firstSceneDetails];
    
    NSLog(@"First Scene details : %@",self.firstSceneDetails);
    
}







@end

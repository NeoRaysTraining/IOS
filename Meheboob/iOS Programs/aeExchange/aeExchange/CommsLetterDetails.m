//
//  CommsLetterDetails.m
//  aeExchange
//
//  Created by Mahaboobsab Nadaf on 20/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "CommsLetterDetails.h"

@interface CommsLetterDetails ()

@end

@implementation CommsLetterDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.datePickeroutlet.hidden = YES;
    self.datePickerToolOutlet.hidden = YES;
    self.pickerViewDelegate.hidden = YES;
    self.toolBarDelegate.hidden =  YES;
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

- (IBAction)homeButton:(id)sender {
    
    [self performSegueWithIdentifier:@"viewPrintEmailLetter" sender:self];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    [self hideFields];
    
    
    
    
    
    if (self.stagingDateTextField.isFirstResponder) {
        self.datePickeroutlet.hidden = NO;
        self.datePickerToolOutlet.hidden = NO;
    }
    if (self.dateOfCommsOutlet.isFirstResponder) {
        self.datePickeroutlet.hidden = NO;
        self.datePickerToolOutlet.hidden = NO;
    }
    if (self.optOutOutlet.isFirstResponder) {
        self.datePickeroutlet.hidden = NO;
        self.datePickerToolOutlet.hidden = NO;
    }
    if (self.selectPensionProviderOutlet.isFirstResponder) {
        self.datePickeroutlet.hidden = YES;
        self.datePickerToolOutlet.hidden = YES;
        self.pickerViewDelegate.hidden = NO;
        self.datePickerToolOutlet.hidden = NO;
    }
    
}



- (IBAction)datePickerDoneButton:(id)sender {
    
    [self showFields];
    self.datePickeroutlet.hidden = YES;
    self.datePickerToolOutlet.hidden = YES;
    
    
}

-(void)hideFields{

    self.pensionProviderOutlet.hidden = YES;
    self.selectPensionProoutlet.hidden = YES;
    self.continueButtonOutlet.hidden = YES;
    self.lineOutlet.hidden = YES;
}

-(void)showFields{

    self.pensionProviderOutlet.hidden = NO;
    self.selectPensionProoutlet.hidden = NO;
    self.continueButtonOutlet.hidden = NO;
    self.lineOutlet.hidden = NO;
}
- (IBAction)pickerDoneButton:(id)sender {
    [self showFields];
    self.pickerViewDelegate.hidden = YES;
    self.datePickerToolOutlet.hidden = YES;
    
    NSLog(@"Inside Picker Done....");
}
- (IBAction)continueButton:(id)sender {
    
    [self performSegueWithIdentifier:@"CommLetterDetails" sender:self];
}
@end

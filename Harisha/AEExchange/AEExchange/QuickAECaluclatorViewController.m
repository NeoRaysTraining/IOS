//
//  QuickAECaluclatorViewController.m
//  AEExchange
//
//  Created by test on 6/16/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "QuickAECaluclatorViewController.h"

@interface QuickAECaluclatorViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *bigViewActivity;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewOutlet;
- (IBAction)caluclatePension:(id)sender;

@end

@implementation QuickAECaluclatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem.backBarButtonItem setTitle:@"Title here"];
    
    [self.bigViewActivity setHidden:TRUE];
    
    [self.pickerViewOutlet setHidden:TRUE];
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

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.pickerViewOutlet setHidden:false];
}
@end

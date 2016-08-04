//
//  SingleComponentPickerViewController.m
//  PickerAndTabBarDemo
//
//  Created by test on 8/4/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "SingleComponentPickerViewController.h"

@interface SingleComponentPickerViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UIPickerView *pickerViewOutlet;

@property (strong,nonatomic) NSArray *names;
@end

@implementation SingleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.names=[[NSArray alloc]initWithObjects:@"Hari",@"Nadaf",@"Bhagya",@"Raghu",@"Bhaski", nil];
}
- (IBAction)selectAction:(id)sender {
    
    NSInteger row = [self.pickerViewOutlet selectedRowInComponent:0];
    NSString *selected = self.names[row];
    NSString *title = [[NSString alloc] initWithFormat:
                       @"You selected %@!", selected];
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:@"thank you for choosing" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
    
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

#pragma mark UIPickerView datasource and delegate methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.names count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.names objectAtIndex:row];
}
@end

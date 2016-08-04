//
//  DoubleComponentPickerViewController.m
//  PickerAndTabBarDemo
//
//  Created by test on 8/4/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "DoubleComponentPickerViewController.h"

#define kFillingComponent 0
#define KBreadComponent 1

@interface DoubleComponentPickerViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *doublePickerOutlet;

@property (strong, nonatomic) NSArray *fillingTypes;
@property (strong, nonatomic) NSArray *breadTypes;


@end

@implementation DoubleComponentPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.fillingTypes = @[@"Ham", @"Turkey", @"Peanut Butter", @"Tuna Salad",
                          @"Chicken Salad", @"Roast Beef", @"Vegemite"];
    self.breadTypes = @[@"White", @"Whole Wheat", @"Rye", @"Sourdough",
                        @"Seven Grain"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)selectAction:(id)sender {
    
    NSInteger fillingRow=[self.doublePickerOutlet selectedRowInComponent:kFillingComponent];
    
    NSInteger breadTypeRow=[self.doublePickerOutlet selectedRowInComponent:KBreadComponent];
    
    NSString *filling=[NSString stringWithFormat:@"%@",[self.fillingTypes objectAtIndex:fillingRow]];
    
    NSString *bread=[NSString stringWithFormat:@"%@",[self.breadTypes objectAtIndex:breadTypeRow]];
    
    NSString *message=[NSString stringWithFormat:@"%@,%@",filling,bread];
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Selected combination is" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark delegate methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component==kFillingComponent) {
        return [self.fillingTypes count];
    }
    else
    {
        return [self.breadTypes count];
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component==kFillingComponent) {
        return self.fillingTypes[row];
    }
    else
    {
        return self.breadTypes[row];
    }

}
@end

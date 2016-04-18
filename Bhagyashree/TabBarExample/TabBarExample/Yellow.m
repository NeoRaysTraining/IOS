//
//  Yellow.m
//  TabBarExample
//
//  Created by test on 4/14/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "Yellow.h"

@interface Yellow ()
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (nonatomic,strong) NSArray *names;

@end

@implementation Yellow

- (void)viewDidLoad {
    [super viewDidLoad];
    _names=@[@"bhagya",@"Bhaskar",@"Nadaf",@"Raghu",@"Harish"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.names.count;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.names[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.displayLabel.text = _names[row];
}
@end

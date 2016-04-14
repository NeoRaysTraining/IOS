//
//  ViewController.m
//  CustomPickerView
//
//  Created by test on 4/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic,strong) NSArray *CName;
@property (nonatomic,strong) NSArray *PName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _CName = @[@"USA",@"India",@"Egypt",@"France",@"chaina"];
    _PName = @[@"Statue of Liberty",@"Taj Mahal",@"Pyramid",@"Eiffil",@"Great Wall"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component==0)
    {
        return _CName.count;
    }
    else{
        return _PName.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component==0)
    {
        return _CName[row];
    }
    else{
        return _PName[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component==0)
    {
        _countryLabel.text=self.CName[row];
    }
    else{
        _placeLabel.text=self.PName[row];
    }
}
@end

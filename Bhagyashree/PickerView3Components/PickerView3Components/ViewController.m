//
//  ViewController.m
//  PickerView3Components
//
//  Created by test on 4/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *pinLabel;

@property (nonatomic,strong) NSArray *state;
@property (nonatomic,strong) NSArray *place;
@property (nonatomic,strong) NSArray *pin;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _state = @[@"Karnataka",@"Maharashtra",@"Andhra Pradesh",@"Tamil Nadu",@"Kerala"];
    _place = @[@"Bengaluru",@"Mumbai",@"Hydrabad",@"Chennai",@"Cochin"];
    _pin=@[@"111",@"222",@"333",@"444",@"555"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component==0)
    {
        return _state.count;
    }
    else if (component==1)
    {
        return _place.count;
    }
    else
    {
        return _pin.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component==0)
    {
        return self.state[row];
    }
    else if(component==1)
    {
        return self.place[row];
    }
    else{
        return self.pin[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component==0)
    {
        _stateLabel.text= self.state[row];
    }
    else if(component==1)
    {
        _cityLabel.text=self.place[row];
    }
    else{
        _pinLabel.text=self.pin[row];
    }
}
@end

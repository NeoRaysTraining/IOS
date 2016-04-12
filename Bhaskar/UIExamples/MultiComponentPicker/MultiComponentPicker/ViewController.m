//
//  ViewController.m
//  MultiComponentPicker
//
//  Created by test on 4/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *designationLabel;
@property (strong, nonatomic) IBOutlet UILabel *phoneNoLabel;

@property (nonatomic,strong) NSArray *name,*designation,*phoneNo;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.name=@[@"Bhaskar", @"Harish",@"Raghavendra"];
    self.designation=@[@"Employee",@"TL",@"Manager"];
    self.phoneNo=@[@"123",@"456",@"789"];
    
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
        return self.name.count;
    }
    else if (component==1)
    {
        return self.designation.count;
    }
    else
    {
        return self.phoneNo.count;
    }
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component==0)
    {
        return self.name[row];
    }
    else if (component==1)
    {
        return self.designation[row];
    }
    else
    {
        return self.phoneNo[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component==0)
    {
        self.nameLabel.text=self.name[row];
    }
    else if (component==1)
    {
        self.designationLabel.text=self.designation[row];
    }
    else
    {
        self.phoneNoLabel.text=self.phoneNo[row];
    }

}
@end

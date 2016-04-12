//
//  ViewController.m
//  CustomPickerDemo
//
//  Created by test on 4/12/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSArray *countryName;
@property NSArray *plceNames;

@property (weak, nonatomic) IBOutlet UILabel *countryLabelDisplay;

@property (weak, nonatomic) IBOutlet UILabel *placelabelDisplay;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.countryName=@[@"India",@"London",@"Paris"];
    self.plceNames=@[@"Taj Mahal",@"Bridge",@"Tower"];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{

    return  2;

}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component

{
    if (component==0)
    
    {    NSLog(@"Values are :%ld",component);
        return self.countryName[row];
    }
 else 
 {
 
     return  self.plceNames[row];
 
 }


}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
   
    if (component==0)
    {
        return self.countryName.count;
    }else
    {
    
        return  self.plceNames.count;
    }
    
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

if(component==0)
{
    self.countryLabelDisplay.text=[self.countryName objectAtIndex:row];
    
}
else{
    
    self.placelabelDisplay.text=[self.plceNames objectAtIndex:row];



}



}








@end

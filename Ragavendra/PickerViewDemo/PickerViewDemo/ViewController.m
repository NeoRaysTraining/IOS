//
//  ViewController.m
//  PickerViewDemo
//
//  Created by test on 5/15/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

self.IPlTeams=[[NSArray alloc ]initWithObjects:@"Mumbai Indians",@"Chennai Super Kings",@"Royal Challengers Bangalore",@"KingsXI panjab",@"Pune Warriors", nil];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
   // returns the # of rows in each component..
    
    return 1;
    
}





- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    
    return  self.IPlTeams.count;

}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return self.IPlTeams[row];
    
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    self.displaylabel.text=[self.IPlTeams objectAtIndex:row];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

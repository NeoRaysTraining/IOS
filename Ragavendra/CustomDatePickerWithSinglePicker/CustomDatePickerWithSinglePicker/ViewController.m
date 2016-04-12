//
//  ViewController.m
//  CustomDatePickerWithSinglePicker
//
//  Created by test on 4/12/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSArray *fruits;

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UILabel *messagelabel;
@property NSString *messgetext;

@property (weak, nonatomic) IBOutlet UIImageView *imageDisplay;



@end

@implementation ViewController

 NSInteger *integerValue;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.fruits=@[@"Apple",@"Grapes,",@"Banana"];
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    return  1;
    
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    
            return  self.fruits[row];
    

}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    
        return self.fruits.count;
  
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
   
    
   self.displayLabel.text=[self. fruits objectAtIndex:row];

     integerValue = row;
    [self fruitImages:integerValue];
    
    
}

-(void) fruitImages:(NSInteger)integer

{
    if (integerValue ==0)
    {
        
        self.imageDisplay.image=[UIImage imageNamed:@"Apple"];
        
    }
    
    else if (integerValue ==1)
    {
        
        self.imageDisplay.image=[UIImage imageNamed:@"Banana"];
        
    }
    
    
    else if (integerValue ==2)
    {
        
        self.imageDisplay.image=[UIImage imageNamed:@"Grapes"];
        
    }
    

    
}
@end

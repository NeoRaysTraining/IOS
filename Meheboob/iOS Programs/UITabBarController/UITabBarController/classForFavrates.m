//
//  classForFavrates.m
//  UITabBarController
//
//  Created by test on 14/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "classForFavrates.h"

@implementation classForFavrates
{
    NSMutableArray *myTeamMemors;
    
    NSString *valueFromTextField;
    int clickButton;
    

    
    
}
@synthesize myTeam;


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;


}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    
    myTeam = [[NSMutableArray alloc]initWithObjects:@"Meheboob",@"Raghavendra",@"Bhaskar",@"Harish",@"Bhagyashree", nil];
     return self.myTeam.count;
    
    
    
    
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
   return  myTeam[row];

}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {


    self.labelForFav.text = [NSString stringWithFormat:@"Slelected name is : %@",myTeam[row]];
    NSString *placeHolder = @"Updaate your names...";
    self.textFieldOfFararate.placeholder = placeHolder;
    
}



- (IBAction)favButton:(id)sender {

    clickButton = 0;
    valueFromTextField = self.textFieldOfFararate.text;
    
    [myTeam insertObject:valueFromTextField atIndex:clickButton];

    clickButton++;
  
    
    }
@end

//
//  SecondViewController.m
//  UITabBarController
//
//  Created by test on 4/14/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
{
    NSMutableArray*IPLTeams;
    NSString * textFieldval;
    int count;
}

@synthesize IPLTeams;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.IPLTeams=[[NSMutableArray alloc ]initWithObjects:@"Mumbai Indians",@"Chennai Super Kings",@"Royal Challengers Bangalore",@"KingsXI panjab",@"Pune Warriors", nil];
    



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
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView

{

    return 1;

}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{


    return self.IPLTeams.count;


}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    
    return self.IPLTeams[row];
    
}
    
    
    
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.dispalayLabel.numberOfLines=2;
    

    self.dispalayLabel.text=[NSString stringWithFormat:@"%@ \n",self.IPLTeams [row]];

    textFieldval=self.textFieldName.text;
    
}

- (IBAction)SubmitBotton:(id)sender
{
    count=0;
    textFieldval=self.textFieldName.text;
    
    [IPLTeams insertObject:textFieldval atIndex:count];
    count++;
}




@end

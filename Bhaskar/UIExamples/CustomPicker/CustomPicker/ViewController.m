//
//  ViewController.m
//  CustomPicker
//
//  Created by test on 4/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray *countryNames;
@property (nonatomic,strong) NSArray *placeNames;
@property (strong, nonatomic) IBOutlet UILabel *countryNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *placeNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *img;

@property NSInteger countryNameSaveRow,placeNameSaveRow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _countryNames=@[@"India",@"USA",@"China",@"Italy",@"Egypt",@"Paris"];
    self.placeNames=@[@"Taj Mahal",@"Statue of Liberty",@"Great Wall of China",@"Colosseum",@"Great Pyramid of Giza",@"Eiffel"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component==0)
    {
        return self.countryNames.count;
    }
    else if(component==1)
    {
        return self.placeNames.count;
    }
    else
        return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component==0)
    {
        return  self.countryNames[row];
    }
    else if(component==1)
    {
        return self.placeNames[row];
    }
    else{
        return  @"";
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component==0)
    {
        self.countryNameLabel.text=[NSString stringWithFormat:@"Name of the country selected is %@",self.countryNames[row]];
        self.countryNameSaveRow=row;
    }
    else
    {
        self.placeNameLabel.text=[NSString stringWithFormat:@"The place is %@",self.placeNames[row]];
        self.placeNameSaveRow=row;
    }
    [self displayWhenMathced:self.countryNameSaveRow showImagePlace:self.placeNameSaveRow];
}

-(void)displayWhenMathced :(int) countryNo showImagePlace:(int) planceNo
{
    if(countryNo==0 && planceNo==0)
    {
        self.img.image=[UIImage imageNamed:@"taj"];
    }
    else if(countryNo==1 && planceNo==1)
    {
        self.img.image=[UIImage imageNamed:@"Statue"];
    }

}

@end

//
//  ViewController.m
//  CustomPicker
//
//  Created by test on 4/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *placeImageView;
@property (strong, nonatomic) NSArray* placeName;
@property (strong, nonatomic) NSArray* countryName;

//@property (strong,nonatomic) NSDictionary* placeAndNames;

@property NSInteger saveCountry;
@property NSInteger savePlace;

@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.countryName = @[@"USA",@"India",@"China",@"France",];
    
    self.placeName = @[@"celesum",@"Tajmahal",@"GreatWall",@"eifiel Tower"];

  //  self.placeAndNames = [NSDictionary dictionaryWithObjects:self.countryName forKeys:self.placeName];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if (component == 0)
    {
        return self.countryName.count;
    }
    else
    {
    return self.placeName.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component==0)
    {
        return self.countryName[row];
    }
    else
    {
        return self.placeName[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component==0)
    {
        self.countryNameLabel.text = [NSString stringWithFormat:@"The Selected country is %@",self.countryName[row]];
        self.saveCountry = row;
            }
    else
    {
        self.placeNameLabel.text = [NSString stringWithFormat:@"Selected place is %@",self.placeName[row]];
        
        self.savePlace = row;
        
    }
    [self showcountry:self.saveCountry showPlace:self.savePlace];
}

-(void)showcountry:(NSInteger)countryimage showPlace:(NSInteger)placeimage
{
    if(countryimage==0 && placeimage==0)
    {
        self.placeImageView.image = [UIImage imageNamed:@"eifiel"];
    }
    else if(countryimage==1 && placeimage ==1)
    {
        self.placeImageView.image = [UIImage imageNamed:@"tajmahal"];
    }
    else if(countryimage==2 && placeimage ==2)
    {
        self.placeImageView.image = [UIImage imageNamed:@"greatwall"];
    }
    else if(countryimage ==3 && placeimage == 3)
    {
        self.placeImageView.image = [UIImage imageNamed:@"liberty"];
    }
    else
    {
        
    }
}

@end

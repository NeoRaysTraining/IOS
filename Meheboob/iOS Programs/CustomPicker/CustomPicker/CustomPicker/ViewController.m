//
//  ViewController.m
//  CustomPicker
//
//  Created by test on 12/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)NSArray *countryName;
@property (nonatomic, strong)NSArray *placeName;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
//-(void)displyImageForRows;
@end


@implementation ViewController
{
    NSInteger countryNameRowStore;
    NSInteger countryPlaceRowStore;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.countryName = @[@"India",@"USA",@"Egypt",@"China",@"Australia"];
    
    self.placeName = @[@"Taj",@"liberty",@"Mummy",@"Great wall",@"Kangaru"];
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
    
    
    if(component == 0){
        return [_countryName count];
    }
    else
    {
        return [_placeName count];
    }
    
 
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0)
    {
        return self.countryName[row];
    }
    else{
    
        return self.placeName[row];
    }
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
if(component == 0)
{

    self.topLabel.text = self.countryName[row];
    
    countryNameRowStore = row;
    
    
}
else{

    self.bottomLabel.text = self.placeName[row];
    countryPlaceRowStore = row;
    
    [self DisplyImageForRowsAndCol:countryNameRowStore Place:countryPlaceRowStore];
    
}

}


-(void)DisplyImageForRowsAndCol:(NSInteger)indexForCountry Place:(NSInteger)indexForPlace{
    
    NSLog(@"Inside Check for Math method");

    if (indexForCountry == 0&&indexForPlace == 0 ) {
      self.imageView.image=[UIImage imageNamed:@"TajMaha.jpg"];
    }
    
    
    
    else if (indexForCountry == 1&&indexForPlace == 1 ) {
        self.imageView.image = [UIImage imageNamed:@"liberty.jpg"];
    }
    
    
    else if (indexForCountry == 2&&indexForPlace == 2 ) {
        self.imageView.image = [UIImage imageNamed:@"Mummy.jpg"];
    }
    
    
    
    else if (indexForCountry == 3&&indexForPlace == 3 ) {
        self.imageView.image = [UIImage imageNamed:@"China Wall.jpg"];
    }
    
    else if (indexForCountry == 4&&indexForPlace == 4 ) {
        self.imageView.image = [UIImage imageNamed:@"Kangaru.jpg"];
    }
    

    
}

@end

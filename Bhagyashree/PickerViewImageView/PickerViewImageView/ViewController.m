//
//  ViewController.m
//  PickerViewImageView
//
//  Created by test on 4/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic,strong) NSArray *fruit;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _fruit = @[@"Mango",@"Apple",@"Orange",@"Grapes"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.fruit.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.fruit[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.displayLabel.text = self.fruit[row];
    if(row==0)
    {
        self.imageView.image=[UIImage imageNamed:@"mango"];
    }
    else if (row==1)
    {
        self.imageView.image=[UIImage imageNamed:@"apple"];
    }
    else if (row==2)
    {
        self.imageView.image=[UIImage imageNamed:@"orange"];
    }
    else if(row==3)
    {
        self.imageView.image =[UIImage imageNamed:@"grapes"];
    }
}

@end

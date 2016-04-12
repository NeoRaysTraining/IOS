//
//  ViewController.m
//  CustomPickerSingleComponent
//
//  Created by test on 4/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *fruitImages;

@property (weak, nonatomic) IBOutlet UILabel *fruitLabel;

@property (strong,nonatomic) NSArray* fruits;

@property NSInteger fruit;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.fruits =@[@"Mango",@"Bananna",@"Orange",@"Pineapple",@"Watermelon"];
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
    if (component == 0)
    {
        return self.fruits.count;
    }
    else
    {
        return 0;
    }
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        return self.fruits[row];
        
        
        
    }
    else
    {
            return @"";
    }
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component==0) {
        
        self.fruitLabel.text=[NSString stringWithFormat:@"Fruit name is: %@",self.fruits[row]];
        self.fruit=row;
    }
    
    [self showImage:self.fruit];
}

-(void)showImage: (NSInteger)fruitImage
{
    if(fruitImage==0)
    {
        self.fruitImages.image = [UIImage imageNamed:@"mango"];
    }
    else if(fruitImage==1)
    {
        self.fruitImages.image = [UIImage imageNamed:@"banana"];
    }
    else if(fruitImage == 2)
    {
        self.fruitImages.image = [UIImage imageNamed:@"orange"];
    }
    else if(fruitImage == 3)
    {
        self.fruitImages.image = [UIImage imageNamed:@"pineapple"];
    }
    else
    {
        self.fruitImages.image = [UIImage imageNamed:@"watermelon"];
    }
}


@end

//
//  ViewController.m
//  CustomPickerFruitSelection
//
//  Created by test on 12/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ImageViewForDisplayImage;
@property (weak, nonatomic) IBOutlet UILabel *labelField;
@property (weak, nonatomic) IBOutlet UIPickerView *selectedFriutFromView;
@property(strong,nonatomic)NSArray *fruitNames;
@end

@implementation ViewController
{
    
    NSInteger fruitRow;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.fruitNames = @[@"Apple",@"Mango",@"Banana",@"Grapes",@"Orange"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return [_fruitNames count];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return _fruitNames[row];
    
    

}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    self.labelField.text = [NSString stringWithFormat:@"The selected Fruit is : %@",self.fruitNames[row]];
    
    fruitRow = row;
    
    [self displyFruitImage:fruitRow];
}


-(void)displyFruitImage : (NSInteger )fruit{

   if(fruit == 0)
   {
       self.ImageViewForDisplayImage.image = [UIImage imageNamed:@"Apple.jpg"];
   }
    
    else if(fruit == 1)
    {
        self.ImageViewForDisplayImage.image = [UIImage imageNamed:@"Mango.jpg"];
    }
    else if(fruit == 2)
    {
        self.ImageViewForDisplayImage.image = [UIImage imageNamed:@"Banana.jpg"];
    }
    else if(fruit == 3)
    {
        self.ImageViewForDisplayImage.image = [UIImage imageNamed:@"Grapes.jpg"];
    }
    
    else if(fruit == 4)
    {
        self.ImageViewForDisplayImage.image = [UIImage imageNamed:@"Orange.jpg"];
    }
    
}
@end

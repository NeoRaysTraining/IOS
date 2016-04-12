//
//  ViewController.m
//  SingleComponentPickerView
//
//  Created by test on 4/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UIImageView *showImg;
@property (strong, nonatomic) IBOutlet UILabel *showFruitNameLabel;
@property (strong,nonatomic) NSArray *fruitNames;
@property (assign,nonatomic)  int indexNumber;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.fruitNames=@[@"Apple",@"Banana",@"Grapes",@"Orange",@"Pine Apple"];
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
    if(component==0)
        return self.fruitNames.count;
    else
        return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component==0)
        return self.fruitNames[row];
    else
        return nil;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component==0)
    {
        self.showFruitNameLabel.text=self.fruitNames[row];
        self.indexNumber=row;
        [self displayImageAtIndex:self.indexNumber];
    }
}


-(void)displayImageAtIndex:(int) i
{
    if(i==0)
        self.showImg.image=[UIImage imageNamed:@"Apple"];
    else if (i==1)
        self.showImg.image=[UIImage imageNamed:@"Banana"];
    else if (i==2)
        self.showImg.image=[UIImage imageNamed:@"Grapes"];
    else if (i==3)
        self.showImg.image=[UIImage imageNamed:@"Orange"];
    else
        self.showImg.image=[UIImage imageNamed:@"Pineapple"];
}

@end

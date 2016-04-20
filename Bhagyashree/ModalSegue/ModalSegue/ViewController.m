//
//  ViewController.m
//  ModalSegue
//
//  Created by test on 4/20/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
//@property (nonatomic,strong) NSArray *fruits;
@property (nonatomic,strong) NSString *item;
@property (nonatomic,strong) NSMutableString *fromScn2;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _fruits=@[@"Apple",@"Orange",@"Mango",@"Grapes"];
    
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
    return _fruits.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.fruits[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _item = self.fruits[row];
    self.displayLabel.text=self.fruits[row];
}

- (IBAction)viewButton:(id)sender {
    [self performSegueWithIdentifier:@"Scene1" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2 *VC2 = [segue destinationViewController];
    [VC2 receiveData :self.fruits:self.item];
}

-(void) afterDone:(NSMutableString*)entredStr
{
   _fromScn2 =entredStr;
}
-(void)viewWillAppear:(BOOL)animated
{
    self.displayLabel.text=_fromScn2;
}

@end

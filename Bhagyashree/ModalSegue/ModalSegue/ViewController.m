//
//  ViewController.m
//  ModalSegue
//
//  Created by test on 4/20/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic,strong) NSString *item;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _fruits=@[@"Apple",@"Orange",@"Mango",@"Grapes"];
}


-(void)viewWillAppear:(BOOL)animated
{
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    NSString *displayStr=[app getStrValue];
    self.displayLabel.text=displayStr;
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

@end

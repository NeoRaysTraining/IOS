//
//  ViewController.m
//  DelegateDemo
//
//  Created by test on 6/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<DemoDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic,strong) NSString* str;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)nextButton:(id)sender {
    
    NSLog(@"inside next button vc1");
    [self performSegueWithIdentifier:@"Segue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"inside prepare for segue vc1");
    UIViewController *VC2 = [segue destinationViewController];
    ViewController2 *viewController2 = (ViewController2*) VC2;
    viewController2.delegate=self;
}

-(void)getData:(NSString *)str
{
    NSLog(@"inside getdata vc1");
    NSLog(@"the string is : %@",str);
}


@end

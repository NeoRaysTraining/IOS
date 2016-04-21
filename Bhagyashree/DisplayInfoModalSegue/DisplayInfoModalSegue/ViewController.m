//
//  ViewController.m
//  DisplayInfoModalSegue
//
//  Created by test on 4/21/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)smvButton:(id)sender {
    _name = @"sirmv";
    [self performSegueWithIdentifier:@"InformationScene" sender:self];
}
- (IBAction)snButton:(id)sender {
    _name = @"sonu";
        [self performSegueWithIdentifier:@"InformationScene" sender:self];
}
- (IBAction)apjButton:(id)sender {
    _name = @"abdul";
        [self performSegueWithIdentifier:@"InformationScene" sender:self];
}
- (IBAction)sjButton:(id)sender {
    _name = @"steve";
        [self performSegueWithIdentifier:@"InformationScene" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2 *VC2 = [segue destinationViewController];
    [VC2 receiveInfo:self.name];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

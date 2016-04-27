//
//  ViewController.m
//  CustomTableViewWithSegue
//
//  Created by test on 4/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitAction:(id)sender {
    
    _displayName = self.nameOutlet.text;
    _displayId = self.eidOutlet.text;
    _displayDesig = self.desigOutlet.text;
    _displayPlace = self.placeOutlet.text;
    
    _employee=@[_displayName,_displayId,_displayDesig,_displayPlace];
    
    [self performSegueWithIdentifier:@"Segue1" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2 *VC2 = [segue destinationViewController];
    [VC2 receiveData:self.employee];
}

@end

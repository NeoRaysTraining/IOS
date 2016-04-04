//
//  ViewController.m
//  ChangingBackgroundColorsWithButtonClick
//
//  Created by test on 3/30/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int i;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    i=0;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeColor:(id)sender {
    
    
    NSArray *colors = [NSArray arrayWithObjects:[UIColor brownColor],[UIColor blackColor],[UIColor greenColor],[UIColor redColor], nil];
    
    self.view.backgroundColor = [colors objectAtIndex:i];
    
    switch (i) {
        case 0:
            [_colorNameLabel setText:@"Brown"];
            _colorNameLabel.textColor=[UIColor brownColor];
            break;
        case 1:
            [_colorNameLabel setText:@"Black"];
            _colorNameLabel.textColor=[UIColor blackColor];
            break;
        case 2:
            [_colorNameLabel setText:@"green"];
            _colorNameLabel.textColor=[UIColor greenColor];
            break;
        case 3:
            [_colorNameLabel setText:@"red"];
            _colorNameLabel.textColor=[UIColor redColor];
        default:
            break;
    }
    i++;
    
    if(i==[colors count])
    {
        i=0;
    }

}
@end

//
//  ViewController.m
//  ColourChangeApp
//
//  Created by test on 3/30/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (IBAction)pressButton:(id)sender {
    
    static int count = 0;
    count++;
    if(count==1)
    {
    self.view.backgroundColor = [UIColor orangeColor];
    [_colourDisplayLabel setText:@"Orange"];
    }
    else if (count==2)
    {
    self.view.backgroundColor = [UIColor greenColor];
    [_colourDisplayLabel setText:@"Green"];
    }
    else if (count==3)
    {
    self.view.backgroundColor = [UIColor redColor];
    [_colourDisplayLabel setText:@"Red"];
    }
    else if(count==4)
    {
    self.view.backgroundColor = [UIColor blueColor];
    [_colourDisplayLabel setText:@"Blue"];
    }
    else if(count==5)
    {
        self.view.backgroundColor = [UIColor purpleColor];
        [_colourDisplayLabel setText:@"Purple"];
    }
    else if(count==6)
    {
        self.view.backgroundColor = [UIColor whiteColor];
        [_colourDisplayLabel setText:nil];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Colours over" message:@"Please run the App again" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
      
    }
}
@end

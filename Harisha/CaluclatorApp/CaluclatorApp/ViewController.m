//
//  ViewController.m
//  CaluclatorApp
//
//  Created by test on 4/16/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property NSNumber* addition;



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
- (IBAction)inputButton:(UIButton *)sender
{
    self.displayLabel.text = [NSString stringWithFormat:@"%ld",sender.tag];
    if (sender.tag == 30)
    {
        self.displayLabel.text = [NSString stringWithFormat:@"inside addition loop"];
        
        
    }
    else if (sender.tag == 20)
    {
        self.displayLabel.text = [NSString stringWithFormat:@"subtraction"];
    }
    else if(sender.tag ==40)
    {
        self.displayLabel.text = [NSString stringWithFormat:@"division"];
    }
    else if(sender.tag==50)
    {
        self.displayLabel.text = [NSString stringWithFormat:@"multiplication"];
    }
}
- (IBAction)adiitionButton:(id)sender
{
    
    
}
- (IBAction)clearButton:(id)sender
{
    self.displayLabel.text = @"0";
}

@end

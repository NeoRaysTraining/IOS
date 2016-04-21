//
//  ViewController.m
//  SegueImageDisplayEx
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@property (nonatomic,strong) NSString *name;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)viewDetails:(id)sender {
    _name= self.enterField.text;
    [self performSegueWithIdentifier:@"Scene2Seg" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2 *VC2 = [segue destinationViewController];
    [VC2 recieveData :self.name];
}

@end

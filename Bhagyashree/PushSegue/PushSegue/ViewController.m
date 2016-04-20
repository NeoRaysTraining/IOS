//
//  ViewController.m
//  PushSegue
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()
@property (nonatomic,strong) NSString *nameStr;
@property (nonatomic,strong) NSString *passStr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)passDataButton:(id)sender {
    self.nameStr = self.nameLabel.text;
    self.passStr = self.passLabel.text;
    [self performSegueWithIdentifier:@"Scene2" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2 *destVC = [segue destinationViewController];
    [destVC receiveData :self.nameStr password: self.passStr];
}

@end

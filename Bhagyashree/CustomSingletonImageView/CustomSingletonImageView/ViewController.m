//
//  ViewController.m
//  CustomSingletonImageView
//
//  Created by test on 4/9/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "CustomSingleton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController
- (IBAction)savebutton:(id)sender {
    
    CustomSingleton *sharedInstance = [CustomSingleton createSharedInstance];
    [sharedInstance setSharedInfo:@"Loading Image"];
    self.imageView.image = [UIImage imageNamed:@"images-2"];
    [self.messageLabel setText:@"Saving image"];
    
}
- (IBAction)loadButton:(id)sender {
    CustomSingleton *sharedInst = [CustomSingleton createSharedInstance];
    NSString *getVal = [sharedInst getSharedInfo];
    self.messageLabel.text = getVal;
    self.imageView.image=[UIImage imageNamed:@"Westconf3"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.imageView setImage:[UIImage imageNamed:@"images"]];
    [self.messageLabel setText:@"ONE"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

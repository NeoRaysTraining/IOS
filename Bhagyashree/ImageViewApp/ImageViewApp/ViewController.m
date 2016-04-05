//
//  ViewController.m
//  ImageViewApp
//
//  Created by test on 4/5/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageView.image =[UIImage imageNamed:@"images"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveButton:(id)sender {

    AppDelegate *app = [UIApplication sharedApplication].delegate;
    [app setInfoValue:@"Loading image"];
    self.imageView.image = [UIImage imageNamed:@"images-2"];
    
}
- (IBAction)loadbutton:(id)sender {
    AppDelegate *app2 = [UIApplication sharedApplication].delegate;
    NSString *getInVal =[app2 getInfo];
    self.displayLabel.text= getInVal;
    self.imageView.image = [UIImage imageNamed:@"Westconf3"];    
}

@end

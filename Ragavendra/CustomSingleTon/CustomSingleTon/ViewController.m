//
//  ViewController.m
//  CustomSingleTon
//
//  Created by test on 4/9/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "CustomSingleTon.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewDisp;

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property NSString *savevalue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.imageViewDisp.image=[UIImage imageNamed:@"one"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveButton:(id)sender {

CustomSingleTon* sharedInstance=[CustomSingleTon createSharedInstance ];
    [sharedInstance setInfo:@"second"];
    self.imageViewDisp.image=[UIImage imageNamed:@"two"];
    self.savevalue=[sharedInstance getInfo];
    
}

- (IBAction)loadButton:(id)sender {


self.imageViewDisp.image=[UIImage imageNamed:@"three"];
    self.displayLabel.text=[NSString stringWithFormat:@"Loaded Succesfully %@",self.savevalue];


}


@end

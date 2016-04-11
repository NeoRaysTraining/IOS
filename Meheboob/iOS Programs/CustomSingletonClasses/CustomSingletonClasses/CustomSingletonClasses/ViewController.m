//
//  ViewController.m
//  CustomSingletonClasses
//
//  Created by test on 4/9/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "CustomSingleton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageViewField.image = [UIImage imageNamed:@"one"];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveButton:(id)sender {
    
    
  
        
        self.imageViewField.image = [UIImage imageNamed:@"two"];
        
    
}
- (IBAction)loadButton:(id)sender {
    
    CustomSingleton *sharedInstance = [CustomSingleton sharedInstance];
    
    [sharedInstance setSharedInfo:@"This is secondimage"];
    
    
    self.imageViewField.image = [UIImage imageNamed:@"three"];
    
    self.displayLabel.text = [sharedInstance getSharedInfo ];
    
    
}

@end

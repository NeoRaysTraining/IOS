//
//  ViewController.m
//  AfNetWithDelegate
//
//  Created by test on 7/1/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
@interface ViewController ()<DemoDelegate>

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



- (IBAction)clickButton:(id)sender {
    
    ViewController2 *VC2 = [[ViewController2 alloc] init];
    
    VC2.delegate = self;
    
    [VC2 jsonMethod];
}
    
-(void)getData:(NSArray *)str{
    NSLog(@"JSON is : %@",str);
}


@end

//
//  ViewController2.m
//  Sequey_Examples
//
//  Created by test on 19/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController.h"
@interface ViewController2 ()

@end

@implementation ViewController2
@synthesize nameLabelDisply;
@synthesize passwordLabelDisplay;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Name is : %@ password is : %@",self.receiveName,self.receivePass);
    
    self.nameLabelDisply.text = self.receiveName;
    
    self.passwordLabelDisplay.text = self.receivePass;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




-(void)ReceiveNameAndPass:(NSString *)userName :(NSString *)userPassword{

    self.receiveName = userName;
    
    self.receivePass = userPassword;
    
    
}
@end

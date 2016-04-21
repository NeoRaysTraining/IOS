//
//  ViewController2.m
//  SeguesDemo
//
//  Created by test on 4/19/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSLog(@"Recived name is : %@ and Passwrd is : %@",self.receiveName,self.receivePassword);
self.receivedPasswordLabel.text=self.receivePassword;
    
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
-(void)receiveNameandPassWord : (NSString *)receivedName : (NSString *)ReceivedPassword{

    self.receiveName = receivedName;
    self.receivePassword =ReceivedPassword;
    
    

}
@end

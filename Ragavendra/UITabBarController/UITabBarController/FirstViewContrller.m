//
//  FirstViewContrller.m
//  UITabBarController
//
//  Created by test on 4/14/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "FirstViewContrller.h"

@interface FirstViewContrller ()

@end

@implementation FirstViewContrller
{
    
    NSString * textname,*textpwd;
  
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)LoginButton:(id)sender

{
   textname= self.textFieldName.text;
    textpwd =self.textFieldPassWord.text;
    
if(([textname  isEqualToString:@"Raghu"])&&([textpwd isEqualToString: @"12345"]))
{
    self.firstLabel.text=@"Login SuccessFul";

    UIAlertView *view=[[UIAlertView alloc] initWithTitle:@"Login SuccessFul" message:@" Welcome" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    
    [view show];

   
    self.view.backgroundColor=[UIColor greenColor];

}
else
{
   
    self.view.backgroundColor=[UIColor redColor];
     self.firstLabel.text=@"Invaild User";


    UIAlertView *view=[[UIAlertView alloc] initWithTitle:@"InValid User "message:@"Enter Correct Username and Password" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    
    [view show];


}


    



}

@end

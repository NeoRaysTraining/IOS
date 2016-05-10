//
//  ViewControllerGet.m
//  Employee_Store_Find
//
//  Created by Mahaboobsab Nadaf on 10/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewControllerGet.h"

@interface ViewControllerGet ()

@end

@implementation ViewControllerGet

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.employeeIDstr = [[NSString alloc]init];
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

- (IBAction)getDetailsButton:(id)sender {
    
    self.employeeIDstr = self.employeeIDfield.text;
    
    [self performSegueWithIdentifier:@"details" sender:self];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   ViewControllerDisplay *VCDetails =  [segue destinationViewController];
    
    [VCDetails getEmployeeID:self.employeeIDstr];
    
}



@end

//
//  ViewController.m
//  GettingTheValueAtParticularIndexUsingDelegateMethod
//
//  Created by test on 5/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()<departmentDelegate>
@property (strong, nonatomic) IBOutlet UILabel *deptNameDisplayLabel;


@end

@implementation ViewController


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"departmentDetails"]) {
        
        TableViewController *vc=[segue destinationViewController];
        vc.delegate=self;
        
        
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)selectWith:(TableViewController *)controller department:(NSString *)deptName
{
    [controller dismissViewControllerAnimated:YES completion:nil];
    self.deptNameDisplayLabel.text=deptName;
}
@end

//
//  ViewController.m
//  MVC
//
//  Created by test on 03/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.employeeDetails = [[NSMutableArray alloc]init];
    
    EmployeeClass *meheboob = [[EmployeeClass alloc] initWithObjects:@"Meheboob" :@"CEO"];
    
     EmployeeClass *bhaskar = [[EmployeeClass alloc] initWithObjects:@"Bhaskar" :@"Manager"];
    
        EmployeeClass *harish = [[EmployeeClass alloc] initWithObjects:@"Harish" :@"Team Lead"];
    
    
    EmployeeClass *raghavendra = [[EmployeeClass alloc] initWithObjects:@"Raghavendra" :@"iOS Developer"];
    
    
    EmployeeClass *bhagyashree = [[EmployeeClass alloc] initWithObjects:@"Bhagyashree" :@"iOS Developer"];
    
    [self.employeeDetails addObjectsFromArray:@[meheboob,harish,raghavendra,bhagyashree,bhaskar]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.employeeDetails.count;


}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    EmployeeClass *employeeModel = self.employeeDetails[indexPath.row];
    
    cell.textLabel.text = employeeModel.employeeName;
    cell.detailTextLabel.text = employeeModel.employeeDesignation;
    
    return  cell;

}


@end

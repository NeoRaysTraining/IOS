//
//  ViewController.m
//  MVCDemo
//
//  Created by test on 5/3/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "EmployeeModel.h"
@interface ViewController ()

@property (nonatomic,strong)NSMutableArray *modelObjects;
@end

@implementation ViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.modelObjects=[[NSMutableArray alloc]init];
   
    
    EmployeeModel *rag=[[EmployeeModel alloc]initWithName:@"raghavendra" Designation:@"IOS"];
EmployeeModel *bha=[[EmployeeModel alloc]initWithName:@"Bhaskar" Designation:@"IOS"];

EmployeeModel *meh=[[EmployeeModel alloc]initWithName:@"Mehabob" Designation:@"IOS"];

    EmployeeModel *har=[[EmployeeModel alloc]initWithName:@"Harish" Designation:@"IOS"];
    
EmployeeModel *bhag=[[EmployeeModel alloc]initWithName:@"BHAGYA" Designation:@"IOS"];
    
    
    [self.modelObjects addObjectsFromArray:@[rag,bha,meh,har,bhag]];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.modelObjects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];

   
    EmployeeModel *model=self.modelObjects[indexPath.row];
    cell.textLabel.text=model.empname;
    cell.detailTextLabel.text=model.empdesignation;
    return cell;
    
}
@end

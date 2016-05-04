//
//  ViewController.m
//  MVCDemo
//
//  Created by test on 5/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "EmployeeModel.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addOutlet;
@property (weak, nonatomic) IBOutlet UITableView *tableViewOutlet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _nameObjects=[[NSMutableArray alloc]init];
    
    EmployeeModel *bhagya = [[EmployeeModel alloc] initWithName:@"bhagya" Designation:@"SE" :@"24" :@"76264"];
    
    EmployeeModel *bhaskar = [[EmployeeModel alloc] initWithName:@"bhaskar" Designation:@"SE" :@"24" :@"34234523"];
    
    [self.nameObjects addObjectsFromArray:@[bhagya,bhaskar]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _nameObjects.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    EmployeeModel *model = self.nameObjects[indexPath.row];
    
    cell.nameLbl.text = model.empname;
    cell.ageLbl.text = model.age;
    cell.DesigLbl.text = model.desig;
    cell.mobileLbl.text = model.mobile;
    
    return cell;
    
}
- (IBAction)addAction:(id)sender {
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Enter Employee Details"
                                          message:@""
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Name..",@"Employee Name");
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Designation..",@"Employee Designation");
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Age..",@"Employee Age");
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Mobile Number..",@"Employee Mobile Number");
     }];

    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSString *nameText =((UITextField*)[alertController.textFields objectAtIndex:0]).text;
        
        NSString *ageText = ((UITextField*)[alertController.textFields objectAtIndex:1]).text;
        
        NSString *desigText = ((UITextField*)[alertController.textFields objectAtIndex:2]).text;
        
        NSString *mobileText = ((UITextField*)[alertController.textFields objectAtIndex:3]).text;
    
        EmployeeModel *addingDetails=[[EmployeeModel alloc]initWithName:nameText Designation:ageText :desigText :mobileText ];
        [_nameObjects addObjectsFromArray:@[addingDetails]];
        [self.tableViewOutlet reloadData];
    }];
    
    [alertController addAction:ok];
    [self presentViewController:alertController animated:YES completion:nil];
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle==UITableViewCellEditingStyleDelete)
    {
        [_nameObjects removeObjectAtIndex:indexPath.row];
        
    }
    
    [self.tableViewOutlet reloadData];
}

@end

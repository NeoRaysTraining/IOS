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

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,assign) int specificRowToEdit;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.employeeDetailsArray=[[NSMutableArray alloc]init];
    
    EmployeeModel *bhaskar=[[EmployeeModel alloc]initWithName:@"Bhaskar" dob:@"November" designation:@"ios" phoneNo:@"123"];
    
    EmployeeModel *sameer=[[EmployeeModel alloc]initWithName:@"Sameer" dob:@"November" designation:@"Android" phoneNo:@"345"];
    
    EmployeeModel *harish=[[EmployeeModel alloc]initWithName:@"Harish" dob:@"June" designation:@"ios" phoneNo:@"236"];
    
    EmployeeModel *raghu=[[EmployeeModel alloc]initWithName:@"Raghavendra" dob:@"August" designation:@"ios" phoneNo:@"945"];
    
    EmployeeModel *mahima=[[EmployeeModel alloc]initWithName:@"Mahima" dob:@"August" designation:@"Android" phoneNo:@"598"];
    
    EmployeeModel *bhagya=[[EmployeeModel alloc]initWithName:@"BhagyaShree" dob:@"june" designation:@"ios" phoneNo:@"456"];
    
    
    
    [self.employeeDetailsArray addObjectsFromArray:@[bhaskar,sameer,harish,raghu,mahima,bhagya]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.employeeDetailsArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if ( indexPath.row % 2 == 0 )
        cell.backgroundColor = [UIColor darkGrayColor];
    else
        cell.backgroundColor = [UIColor lightGrayColor];

    EmployeeModel *model=self.employeeDetailsArray[indexPath.row];
    cell.empNameLbl.text=model.empName;
    cell.empDobLbl.text=model.empDOB;
    cell.empDesignationLbl.text=model.empDesignation;
    cell.empPhoneNoLbl.text=model.empPhoneNumber;
    
    
    return cell;
    
}
- (IBAction)addEmployeeDetails:(id)sender {
    [self addingEmployeeDetails];
}

-(void)addingEmployeeDetails
{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Employee Details" message:@"Add employee Details" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField ){
        textField.placeholder=@"Employee Name";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField ){
        textField.placeholder=@"Employee DOB";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField ){
        textField.placeholder=@"Employee Designation";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField ){
        textField.placeholder=@"Employee Phone Number";
    }];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"ADD" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        NSString *nameText=((UITextField*)[alert.textFields objectAtIndex:0]).text;
        NSString *dobText=((UITextField*)[alert.textFields objectAtIndex:1]).text;
        NSString *designationText=((UITextField*)[alert.textFields objectAtIndex:2]).text;
        NSString *phoneNoText=((UITextField*)[alert.textFields objectAtIndex:3]).text;
        
        EmployeeModel *addingEmpDetails=[[EmployeeModel alloc]initWithName:nameText dob:dobText designation:designationText phoneNo:phoneNoText];
        
        [self.employeeDetailsArray addObjectsFromArray:@[addingEmpDetails]];
        
        [self.tableView reloadData];
    }];
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];

}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        
        [self.employeeDetailsArray removeObjectAtIndex:indexPath.row];
    }
    
    [self.tableView reloadData];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.specificRowToEdit=(int)indexPath.row;
}

-(void)editingTextAtParticualrIndex:(int)editingRow
{
    EmployeeModel *model=[self.employeeDetailsArray objectAtIndex:editingRow];
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Employee Details" message:@"Add employee Details" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField ){
        textField.text=model.empName;
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField ){
        textField.text=model.empDOB;
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField ){
        textField.text=model.empDesignation;
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField ){
        textField.text=model.empPhoneNumber;
    }];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"ADD" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        NSString *nameText=((UITextField*)[alert.textFields objectAtIndex:0]).text;
        NSString *dobText=((UITextField*)[alert.textFields objectAtIndex:1]).text;
        NSString *designationText=((UITextField*)[alert.textFields objectAtIndex:2]).text;
        NSString *phoneNoText=((UITextField*)[alert.textFields objectAtIndex:3]).text;
        
        EmployeeModel *addingEmpDetails=[[EmployeeModel alloc]initWithName:nameText dob:dobText designation:designationText phoneNo:phoneNoText];
        
        [self.employeeDetailsArray insertObject:addingEmpDetails atIndex:editingRow];
        
        [self.tableView reloadData];
    }];
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
    

}

@end

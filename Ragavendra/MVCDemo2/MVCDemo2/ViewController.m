//
//  ViewController.m
//  MVCDemo2
//
//  Created by Raghavendra Dattwad on 5/3/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "TabelViewCell.h"
#import "EmployeeDetails.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tabelView;

@property (nonatomic,strong)NSString * recEid;
@property (nonatomic,strong)NSString *recEname;
@property (nonatomic,strong)NSString *recPhoneNum;
@property (nonatomic,strong)NSString *recplace;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.allModelObjects=[[NSMutableArray alloc]init];
    
    EmployeeDetails *bhag=[[EmployeeDetails alloc]initEId:@"148"
    name:@"Bhagyashree" phoneNum:@"11111" place:@"Rajajinagar 1stBlock"];


EmployeeDetails *meh=[[EmployeeDetails alloc]initEId:@"145" name:@"Mehabob" phoneNum:@"22222" place:@"Rajajinagar 6thBlock"];


EmployeeDetails *har=[[EmployeeDetails alloc]initEId:@"150" name:@"Harisha" phoneNum:@"33333" place:@"Padmanabnagar"];


EmployeeDetails *bha=[[EmployeeDetails alloc]initEId:@"151" name:@"Bhaskar" phoneNum:@"44444" place:@"GandhibAzar"];


EmployeeDetails *rag=[[EmployeeDetails alloc]initEId:@"149" name:@"Raghu" phoneNum:@"55555" place:@" Jayanagar"];

[self.allModelObjects addObjectsFromArray:@[bhag,meh,har,bha,rag]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.allModelObjects.count;
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    TabelViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];


EmployeeDetails *empDetail = self.allModelObjects[indexPath.row];

cell.nameLabel.text=empDetail.ename;
cell.eIDLabel.text= empDetail.eID;
cell.phoneNumberlabel.text=empDetail.empPhoneNum;
cell.placeLabel.text=empDetail.empPlace;
    
return cell;
}


- (IBAction)AddButton:(id)sender {

    
   NSLog(@"inside Add Button");

    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Employee Details"
                                          message:nil
                                          preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Enter EmployeeID", @"");
         
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
      
    
    textField.placeholder= NSLocalizedString(@"Enter Employee name", @"");
    
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
 
    textField.placeholder= NSLocalizedString(@"Enter EmployeePhone Num", @"");
       }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
    textField.placeholder= NSLocalizedString(@"Enter Emplaoyee place", @"");

    
      }];

UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
    handler:^(UIAlertAction * action) {
                                                              
                                                              
UITextField*login=alertController.textFields.firstObject;
 

[self.tabelView reloadData];
                                                              
}];
[alertController addAction:defaultAction];
[self presentViewController:alertController animated:YES completion:nil];
    
    
}

-(void)receiveAllDetails
{

    EmployeeDetails *details=[[EmployeeDetails alloc]init];
    
    [details initEId:self.recEid name:self.recEname phoneNum:self.recPhoneNum place:self.recplace];
}





@end

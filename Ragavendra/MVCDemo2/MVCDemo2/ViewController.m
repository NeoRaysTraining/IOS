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
@property (nonatomic,strong)NSIndexPath *path;

@end

@implementation ViewController
{
    EmployeeDetails *Alldetails;
    int count;
}
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
                                                              
        
  UITextField*empID=[alertController.textFields objectAtIndex:0];

        
  UITextField*empName=[alertController.textFields objectAtIndex:1];
     
  UITextField*empPhoneNum=[alertController.textFields objectAtIndex:2];
  
UITextField*empPlace=[alertController.textFields objectAtIndex:3];
        
        NSString *eID=empID.text;
        NSString *enam=empName.text;
        NSString *ephn=empPhoneNum.text;
        NSString *epl=empPlace.text;
        
        
        
        if([eID isEqualToString:@""])
        {
         
        
          [self showAlertEnmaeField];
         
        }
        
        if([enam isEqualToString:@""])
        {
            [self showPlaceField];
        
        }
        
        if([ephn isEqualToString:@""])
        {
            [self ShowAlertEphoneField];
        
        }
        if ([epl isEqualToString:@""]) {
            [self showPlaceField];
        }
        
        
else
 {
EmployeeDetails *details=[[EmployeeDetails alloc]initEId:empID.text name:empName.text phoneNum:empPhoneNum.text place:empPlace.text];
        
    [self. allModelObjects addObjectsFromArray:@[details]];
    [self.tabelView reloadData];
 }

    
    
    
    
    }];
[alertController addAction:defaultAction];
[self presentViewController:alertController animated:YES completion:nil];
    
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
}



/*-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  Alldetails=  self.allModelObjects[indexPath.row];


    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Employee Details Worong"
                                          message:nil
                                          preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Enter EmployeeID", @"");
         textField.text=Alldetails.eID;
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         
         
         textField.placeholder= NSLocalizedString(@"Enter Employee name", @"");
           textField.text=Alldetails.ename;
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         
         textField.placeholder= NSLocalizedString(@"Enter EmployeePhone Num", @"");
          textField.text=Alldetails.empPhoneNum;
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder= NSLocalizedString(@"Enter Emplaoyee place", @"");
           textField.text=Alldetails.empPlace;
         
     }];


    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
UITextField*empID=[alertController.textFields objectAtIndex:0];
                                                              
UITextField*empName=[alertController.textFields objectAtIndex:1];
                                                              
UITextField*empPhoneNum=[alertController.textFields objectAtIndex:2];
                                                              
UITextField*empPlace=[alertController.textFields objectAtIndex:3];

                                                              
EmployeeDetails *details=[[EmployeeDetails alloc]initEId:empID.text name:empName.text phoneNum:empPhoneNum.text place:empPlace.text];
                                                            
[self.allModelObjects removeObject:details];
[self.tabelView reloadData];

}];
    [alertController addAction:defaultAction];
    [self presentViewController:alertController animated:YES completion:nil];
                                                          
}*/



- (IBAction)editButton:(id)sender {

    NSLog(@"Inside Edit");
 Alldetails=  self.allModelObjects[self.path.row];
    
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Edit Employee Details"
                                          message:nil
                                          preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.text=Alldetails.eID;
         
         
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         
         
         textField.text=Alldetails.ename;
         
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         
         textField.text=Alldetails.empPhoneNum;
     }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.text=Alldetails.empPlace;
         
         
     }];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              
        UITextField*empID=[alertController.textFields objectAtIndex:0];
                                                              
                                                              
        UITextField*empName=[alertController.textFields objectAtIndex:1];
                                                              
        UITextField*empPhoneNum=[alertController.textFields objectAtIndex:2];
                                                              
        UITextField*empPlace=[alertController.textFields objectAtIndex:3];
                                                              
                                                              
                                                              
EmployeeDetails *details=[[EmployeeDetails alloc]initEId:empID.text name:empName.text phoneNum:empPhoneNum.text place:empPlace.text];

    
                                                              
                                                              
                                                              
                                                              
[self.allModelObjects removeObject:details];
[self.tabelView reloadData];
                                                             
    }];
    
[alertController addAction:defaultAction];
[self presentViewController:alertController animated:YES completion:nil];
}
- (IBAction)deleteButton:(id)sender {

    NSLog(@"Inside delete");

    
    //[self.allModelObjects replaceObjectAtIndex:Alldetails withObject:details];
    [self.allModelObjects removeObject:Alldetails];
    [self.tabelView reloadData];


}

- (IBAction)rightGestture:(UIGestureRecognizer*)sender {

   
    CGPoint loc=[sender locationInView:self.tabelView];
self.path=[self.tabelView indexPathForRowAtPoint:loc];
    TabelViewCell *cell=[self.tabelView cellForRowAtIndexPath:self.path];
    cell.editOutlet.hidden=YES;
    cell.deleteOutlet .hidden=YES;
    

}

- (IBAction)leftGesture:(UIGestureRecognizer *)sender {


    
    CGPoint loc=[sender locationInView:self.tabelView];
    self.path=[self.tabelView indexPathForRowAtPoint:loc];
    TabelViewCell *cell=[self.tabelView cellForRowAtIndexPath:self.path];
    cell.editOutlet.hidden=NO;
    cell.deleteOutlet .hidden=NO;
}




-(void) showAlert{

    
UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Employee Details"
        message:@"All Fields are mandatory."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:nil];


}

-(void)showAlertEnmaeField{
    
UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Employee Details"
                                                                   message:@"Enter Name"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];


}
-(void)ShowAlertEphoneField{
    
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Employee Details"
        message:@"Enter Your Phone  Number."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}
-(void)showPlaceField{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Employee Details"
        
    message:@"Enter Your  Place."
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


@end

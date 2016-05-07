//
//  ViewController.m
//  MVCEmployeeDemo
//
//  Created by test on 5/4/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "EmployeeModel.h"
#import "TableViewCell.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@property (strong,nonatomic) NSIndexPath *path;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    [self fetchingData];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)rightGesture:(UIGestureRecognizer*)sender {
    
    CGPoint loc=[sender locationInView:self.tableView];
    self.path=[self.tableView indexPathForRowAtPoint:loc];
    TableViewCell *tl=[self.tableView cellForRowAtIndexPath:self.path];
    [tl.deleteBtnOutlet setHidden:YES];
    [tl.editBtnOutlet setHidden:YES];

    
    
}
- (IBAction)left:(UIGestureRecognizer*)sender {
    
    CGPoint loc=[sender locationInView:self.tableView];
    self.path=[self.tableView indexPathForRowAtPoint:loc];
    TableViewCell *tl=[self.tableView cellForRowAtIndexPath:self.path];
    [tl.deleteBtnOutlet setHidden:NO];
    [tl.editBtnOutlet setHidden:NO];
    
    
}

- (IBAction)addAction:(id)sender {
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Employee Details" message:@"Add employee Details" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField ){
        textField.placeholder=@"Employee Name";
        [textField addTarget:self action:@selector(alertTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField ){
        textField.placeholder=@"Employee Designation";
        [textField addTarget:self action:@selector(alertTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
        
    }];
    
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"ADD" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        UITextField *nameText=[alert.textFields objectAtIndex:0];
        UITextField *designationText=[alert.textFields objectAtIndex:1];
        if ([nameText.text isEqualToString:@""]){
            
            [self alertTextFieldDidChange:[alert.textFields objectAtIndex:0]];
            NSLog(@"nil");
        }
        else if ([designationText.text isEqualToString:@""])
        {
            [self alertTextFieldDidChange:[alert.textFields objectAtIndex:1]];
        }
        else
        {
            
            NSManagedObjectContext *context=[self getContext];
            NSManagedObject *emp=[NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
            
            [emp setValue:nameText.text forKey:@"name"];
            [emp setValue:designationText.text forKey:@"designation"];
            NSError *error=nil;
            if ([context save:&error]) {
                [self fetchingData];
                NSLog(@"Data Saved Successfully");
            }
            else
            {
                NSLog(@"not Saved");
            }
            
        [self hideButtons];
        }
    }];
    
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                           {
                               [self hideButtons];
                           }];
    [alert addAction:ok];
    [alert addAction:cancel];
     ok.enabled=NO;
    [self presentViewController:alert animated:YES completion:nil];



}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.employeeDetailsArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSManagedObject *model=self.employeeDetailsArray[indexPath.row];
    cell.EmpNameLbl.text=[model valueForKey:@"name"];
    cell.empDesignationLbl.text=[model valueForKey:@"designation"];
    
    return cell;
    
}
- (IBAction)deleteAction:(UIButton*)sender {
    

    NSIndexPath *index=[self.tableView indexPathForCell:(TableViewCell *)sender.superview.superview];
   
    NSManagedObjectContext *context=[self getContext];
    [context deleteObject:[self.employeeDetailsArray objectAtIndex:index.row]];
    NSError *error=nil;
    [context save:&error];
        //[self fetchingData];
    
    
    [self.employeeDetailsArray removeObjectAtIndex:index.row];
    [self.tableView reloadData];
    [self hideButtons];
    
}

-(void)hideButtons
{
    TableViewCell *tl=[self.tableView cellForRowAtIndexPath:self.path];
    [tl.deleteBtnOutlet setHidden:YES];
    [tl.editBtnOutlet setHidden:YES];
}
- (IBAction)editAction:(id)sender {
    
    NSManagedObject *model=[self.employeeDetailsArray objectAtIndex:self.path.row];
    
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Edit Employee Details" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField ){
        textField.text=[model valueForKey:@"name"];
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField ){
        textField.text=[model valueForKey:@"designation"];
    }];
    
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        NSString *nameText=((UITextField*)[alert.textFields objectAtIndex:0]).text;
        NSString *designationText=((UITextField*)[alert.textFields objectAtIndex:1]).text;
        
        NSManagedObjectContext *context=[self getContext];
        NSManagedObject *employee=[self.employeeDetailsArray objectAtIndex:self.path.row];
        [employee setValue:nameText forKey:@"name"];
        [employee setValue:designationText forKey:@"designation"];
        NSError *error=nil;
        if ([context save:&error]) {
            [self fetchingData];
        }
        [self hideButtons];
    }];
    
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                           {
                               [self hideButtons];
                           }];
    
    [alert addAction:ok];
    [alert addAction:cancel];
   
    [self presentViewController:alert animated:YES completion:nil];

}
- (void)alertTextFieldDidChange:(UITextField *)sender
{
    UIAlertController *alert = (UIAlertController *)self.presentedViewController;
    if (alert)
    {
        if ([alert.textFields.lastObject isFirstResponder]) {
            if ([alert.textFields.firstObject.text isEqualToString:@""]) {
                UIColor *color = [UIColor redColor];
                alert.textFields.firstObject.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Please Enter Name" attributes:@{NSForegroundColorAttributeName: color}];
                    [alert reloadInputViews];
                
            }
            
            
        }

        if (alert.textFields.firstObject.text.length>0 && alert.textFields.lastObject.text.length>0) {
            
            
            UIAlertAction *ok=alert.actions.firstObject;
            ok.enabled = YES;
        
        }
        else
        {
            UIAlertAction *ok=alert.actions.firstObject;
            //alert.textFields.lastObject.placeholder=@"Plese enter Designation";
            ok.enabled = NO;
            [alert reloadInputViews];
        }
    }
}

-(NSManagedObjectContext*)getContext
{
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context=[app managedObjectContext];
    return context;
    
}

-(void)fetchingData
{
    NSManagedObjectContext *context=[self getContext];
    
    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    NSError *error=nil;
     self.employeeDetailsArray=[[NSMutableArray alloc]initWithArray:[context executeFetchRequest:request error:&error]];
    [self.tableView reloadData];
    
}
@end



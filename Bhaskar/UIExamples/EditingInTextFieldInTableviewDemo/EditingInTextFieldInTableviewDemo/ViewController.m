//
//  ViewController.m
//  EditingInTextFieldInTableviewDemo
//
//  Created by test on 5/3/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic,strong) NSMutableArray *descriptionText;

@property (nonatomic,assign) int indexPositon;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.descriptionText=[[NSMutableArray alloc]initWithCapacity:100];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    self.indexPositon=(int)textField.tag;
//    NSLog(@"%i",_indexPositon);
//    
//    
//}


//-(void)textFieldDidEndEditing:(UITextField *)textField
//{
////    [self.descriptionText insertObject:textField.text atIndex:_indexPositon];
////    NSLog(@"%@",_descriptionText);
////    [textField resignFirstResponder];
//    
//    NSString *data=textField.text;
//    NSLog(@"%@",data);
//    [self.descriptionText insertObject:data atIndex:_indexPositon];
//    [textField resignFirstResponder];
//    
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textFieldToEdit.tag=indexPath.row;
    [cell.textFieldToEdit setHidden:YES];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textFieldToEdit.tag=indexPath.row;
    NSLog(@"%ld",(long)cell.textFieldToEdit.tag);
    
    [self.descriptionText insertObject:cell.textFieldToEdit.text atIndex:cell.textFieldToEdit.tag];
    
    [cell.textFieldToEdit setHidden:NO];
    [cell.textFieldToEdit becomeFirstResponder];
}

@end

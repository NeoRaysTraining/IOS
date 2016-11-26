//
//  OtherDetailViewController.m
//  
//
//  Created by Meheboob Nadaf on 24/11/16.
//
//

#import "OtherDetailViewController.h"
#import "OtherDetailTableViewCell.h"
#import "AppDelegate.h"
#import "ModelClassForWallet.h"
#import "OtherImageViewController.h"

@interface OtherDetailViewController (){

    NSMutableArray *reciedKeyArray;
    NSMutableArray *reciedValArray;
    NSString *ReciedTitle;
    NSString *reciedImageName;
    NSMutableArray *employeeObjects;
    NSIndexPath *getIndexpath;
    
    ModelClassForWallet *manageObject;
    OtherDetailTableViewCell *cell;
    
    
}

@end

@implementation OtherDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.buttonImageView.layer.cornerRadius = 5; // this value vary as per your desire
    self.buttonImageView.clipsToBounds = YES;
    [self fetchData];
    
    manageObject = [employeeObjects objectAtIndex:getIndexpath.row];
    
    reciedImageName = manageObject.imageName;
    [self.buttonImageView setBackgroundImage:[UIImage imageNamed:reciedImageName] forState:UIControlStateNormal];
    
    self.titleTextField.text = manageObject.titleOther;
    
    reciedKeyArray = [[NSMutableArray alloc] initWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:manageObject.allKeys]];
    ;
    reciedValArray = [[NSMutableArray alloc] initWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:manageObject.allValues]];
    
    
    self.title = @"Data Table";
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style: UIBarButtonItemStylePlain target:self action:@selector(addORDeleteRows)];
    [self.navigationItem setRightBarButtonItem:addButton];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addORDeleteRows
{
    if(self.editing)
    {
        [super setEditing:NO animated:NO];
        [self.myTableView setEditing:NO animated:NO];
        [self.myTableView reloadData];
        [self.navigationItem.rightBarButtonItem setTitle:@"Edit"];
        [self.navigationItem.rightBarButtonItem setStyle:UIBarButtonItemStylePlain];
        
     // self.navigationItem.leftBarButtonItem.enabled = YES;
        self.hideAllButtona.hidden = NO;

        self.self.navigationItem.leftBarButtonItem.enabled = YES;
       
        
    }
    else
    {
        [super setEditing:YES animated:YES];
        [self.myTableView setEditing:YES animated:YES];
        [self.myTableView reloadData];
        [self.navigationItem.rightBarButtonItem setTitle:@"Done"];
        [self.navigationItem.rightBarButtonItem setStyle:UIBarButtonItemStyleDone];
        self.hideAllButtona.hidden = YES;
        self.self.navigationItem.leftBarButtonItem.enabled = NO;
        
        
       
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int count = (int)[reciedKeyArray count];
    if(self.editing) count++;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"cell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[OtherDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.editingAccessoryType = YES;
    }
    int count = 0;
    if(self.editing && indexPath.row != 0)
        count = 1;
    
    if(indexPath.row == ([reciedKeyArray count]) && self.editing){
        cell.textField1.text = @"Add new row";
        cell.textField2.text = @"";
        
        cell.label.hidden = YES;
        
        
        return cell;
    }
    cell.textField1.text = [reciedKeyArray objectAtIndex:indexPath.row];
    cell.textField2.text = [reciedValArray objectAtIndex:indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.label.hidden = NO;
    
  
    
    
    return cell;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.editing == NO || !indexPath)
        return UITableViewCellEditingStyleNone;
    
    if (self.editing && indexPath.row == ([reciedKeyArray count]))
        return UITableViewCellEditingStyleInsert;
    else
        return UITableViewCellEditingStyleDelete;
    
    return UITableViewCellEditingStyleNone;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle) editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [reciedKeyArray removeObjectAtIndex:indexPath.row];
        [reciedValArray removeObjectAtIndex:indexPath.row];
        [self.myTableView reloadData];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        [reciedKeyArray insertObject:@"New Key" atIndex:[reciedKeyArray count]];
         [reciedValArray insertObject:@"New Val" atIndex:[reciedValArray count]];
        [self.myTableView reloadData];
    }
}

-(void)receiveallDetails:(NSIndexPath *)reciedIndexPath{



    getIndexpath = reciedIndexPath;
    

}
- (IBAction)doneButton:(id)sender {
    [self editMethod];
     [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)buttonImage:(id)sender {
    
    [self performSegueWithIdentifier:@"image" sender:self];
}

-(void)fetchData{
    
    NSManagedObjectContext* context=[self getContext];
    NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"AllPasswordsDetail"];
    NSError* error=nil;
    
    
    employeeObjects=[[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
    
    
    
    [self.myTableView reloadData];
    
}


-(NSManagedObjectContext *)getContext{
    
    AppDelegate *App = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [App persistentContainer].viewContext;
    
    return context;
    
}

-(void)editMethod{

    
    NSMutableArray *editedKeyArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i < reciedKeyArray.count; i++){
        
        OtherDetailTableViewCell *theCell = (id)[self.myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        UITextField *cellTextField = [theCell textField1];
        
        NSString *textFiedlKey = [cellTextField text];
        [editedKeyArray addObject:textFiedlKey];
    }
    NSMutableArray *editedValArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i < reciedValArray.count; i++){
        
        OtherDetailTableViewCell *theCell = (id)[self.myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        UITextField *cellTextField = [theCell textField2];
        
        NSString *textFiedlVal = [cellTextField text];
        [editedValArray addObject:textFiedlVal];
    }
    
    NSManagedObject *employeeObject =[ employeeObjects objectAtIndex:getIndexpath.row];
    
    NSData *keyData = [NSKeyedArchiver archivedDataWithRootObject:editedKeyArray];
     NSData *keyVal = [NSKeyedArchiver archivedDataWithRootObject:editedValArray];
   
    ModelClassForWallet *walletObject = [[ModelClassForWallet alloc] initiWithTitle:self.titleTextField.text :reciedImageName :keyData :keyVal];
    
                
                NSManagedObjectContext* context=[self getContext];
                
                
                [employeeObject setValue:walletObject.titleOther forKey:@"titleOther"];
                
                
                [employeeObject setValue:walletObject.imageName forKey:@"imageName"];
                [employeeObject setValue:walletObject.allKeys forKey:@"allKeys"];
                [employeeObject setValue:walletObject.allValues forKey:@"allValues"];
                NSError* error=nil;
                
                if (![context save:&error
                      ]) {
                    NSLog(@"Failed to save data");
                }
                else{
                    
                    NSLog(@"Saved Data");
                }
                
                
                [self fetchData];
    
        
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

   OtherImageViewController *otherVC =  [segue destinationViewController];
    [otherVC revieweTableIndex:getIndexpath];
}
-(void)viewWillAppear:(BOOL)animated{
    
    [self fetchData];
    
    manageObject = [employeeObjects objectAtIndex:getIndexpath.row];
    
    reciedImageName = manageObject.imageName;
    [self.buttonImageView setBackgroundImage:[UIImage imageNamed:reciedImageName] forState:UIControlStateNormal];
}
- (IBAction)deleteButton:(id)sender {
    
    
    
    NSArray *title =   [employeeObjects objectAtIndex:getIndexpath.row];
    
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"Delete %@",[title valueForKey:@"titleOther"]] message:[NSString stringWithFormat:@"Are you sure you want to permanently delete %@ ?",[title valueForKey:@"titleOther"]] preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
       
        [self.myTableView reloadData];
        
    }]];
    
    
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
        NSManagedObjectContext *context = [self getContext];
        
        [context deleteObject:[employeeObjects objectAtIndex:getIndexpath.row]];
        
        NSError *error = nil;
        [context save:&error];
        [self dismissViewControllerAnimated:YES completion:nil];
        
        
    }]];
    [self presentViewController:actionSheet animated:YES completion:nil];
    
}
- (IBAction)forward:(id)sender {
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    [textField resignFirstResponder];
    return YES;
}
@end

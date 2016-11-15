//
//  AllPasswords.m
//  AllMyPasswords
//
//  Created by Mahaboobsab Nadaf on 14/10/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "AllPasswords.h"

@interface AllPasswords ()

@end

@implementation AllPasswords{

    NSMutableArray *shortResults;
    NSManagedObject *allTitles;
    NSIndexPath *indexPathForEditImage;
    
    NSIndexPath* passTableIndex;
    
    TableViewCell *viewCell;
    
    BOOL checkFlag;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    
    [self fetchData];
    
    checkFlag = YES;
    
}

-(void)viewDidAppear:(BOOL)animated{
    [self fetchData];
    checkFlag = YES;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  shortResults.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    viewCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    

   // cell.imageView.layer.borderWidth = 2.0f;
    
   // cell.imageView.layer.borderColor = [UIColor blueColor].CGColor;
    allTitles = [shortResults objectAtIndex:indexPath.row];
    
  
   
    NSMutableString *title = [allTitles valueForKey:@"title"];
    
    cell.title.text = title ;
    
   
    cell.userName.text = [NSString stringWithFormat:@"  %@",[allTitles valueForKey:@"userName"] ];
    cell.password.text = [NSString stringWithFormat:@"  %@",[allTitles valueForKey:@"password"] ];
    
    
    [cell.buttonImage setBackgroundImage:[UIImage imageWithData:[allTitles valueForKey:@"picture"]] forState:UIControlStateNormal];
    
       
    return cell;
}




- (IBAction)addButton:(id)sender{
    
   
    [self addMethod:nil :nil :nil : @"Add Details" : 1 : 0000];
}

- (IBAction)moreButton:(UIButton *)sender {



    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        [viewCell swifeLeft];
        
        [self.myTableView reloadData];
        
        
        // Cancel button tappped do nothing.
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Open Application" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        
        NSIndexPath *indexPath = [self.myTableView indexPathForCell:(TableViewCell *)sender.superview.superview];
        
        [self openApplication:(int)indexPath.row];

    }]];
    
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Delete All Passwords" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
        
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Delete All Passwords"
                                                                       message:@"Are you sure you want to permanently delete all Passwords."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                              
                                                              
                                                                  
                                                                  [shortResults removeAllObjects];
                                                                  
                                                                  
                                                                  NSManagedObjectContext *context = [self getContext];
                                                                  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"AllPasswords"];
                                                                  
                                                                  NSError *error;
                                                                  NSArray *objects = [context executeFetchRequest:request error:&error];
                                                                  
                                                                  
                                                                  
                                                                  
                                                                  if (objects == nil) {
                                                                      NSLog(@"There is no objetcs");
                                                                  } else {
                                                                      for (NSManagedObject *object in objects) {
                                                                          [context deleteObject:object];
                                                                      }
                                                                      [context save:&error];
                                                                  }
                                                                  
                                                                  [self.myTableView reloadData];
                                                              }];
        
        
        UIAlertAction *cancelAction = [UIAlertAction
                                       actionWithTitle:@"Cencel"
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction *action)
                                       {
                                           [viewCell swifeLeft];
                                           
                                           [self.myTableView reloadData];                                                                     
        
                                       }];
        
        
        
        [alert addAction:defaultAction];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
        
        
      
        
    }]];
    [self presentViewController:actionSheet animated:YES completion:nil];


}





-(void)fetchData{
    
    NSManagedObjectContext* context=[self getContext];
    NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"AllPasswords"];
    NSError* error=nil;
    
    self.employeeObjects=[[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
    
    //Taking temp var to hold values for Search
    shortResults = [[NSMutableArray alloc]initWithArray:self.employeeObjects];
    
    [self.myTableView reloadData];
    
}


-(NSManagedObjectContext *)getContext{
    
    AppDelegate *App = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [App persistentContainer].viewContext;
    
    return context;
    
}


- (IBAction)deleteButton:(UIButton*)sender {
    
    
    NSIndexPath *indexPath = [self.myTableView indexPathForCell:(TableViewCell *)sender.superview.superview];
    
  NSArray *title =   [shortResults objectAtIndex:indexPath.row];
    

      UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"Delete %@",[title valueForKey:@"title"]] message:[NSString stringWithFormat:@"Are you sure you want to permanently delete %@ ?",[title valueForKey:@"title"]] preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        [viewCell swifeLeft];
        [self.myTableView reloadData];
        
    }]];
    
 
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
       
        NSManagedObjectContext *context = [self getContext];
        
        [context deleteObject:[shortResults objectAtIndex:indexPath.row]];
        
        NSError *error = nil;
        [context save:&error];
        
        
        
        [shortResults removeObjectAtIndex:indexPath.row];
        
        
        [viewCell swifeLeft];
        [self.myTableView reloadData];
        
    }]];
    [self presentViewController:actionSheet animated:YES completion:nil];
    
    
   
    
    
    
    
    
}







- (IBAction)editButton:(UIButton *)sender {
    
    
    
     NSIndexPath *indexPath = [self.myTableView indexPathForCell:(TableViewCell *)sender.superview.superview];
    NSManagedObject *employeeObject =[ shortResults objectAtIndex:indexPath.row];
    
    
    UIAlertController* controller=[UIAlertController alertControllerWithTitle:@"Re-Enter Details" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.text=[employeeObject valueForKey:@"title"];
        textField.placeholder = @"Enter title";
        
    }];
    
  
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text=[employeeObject valueForKey:@"userName"];
        textField.placeholder = @"Enter User Name";
        
    }];
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text=[employeeObject valueForKeyPath:@"Password"];
        textField.placeholder = @"Enter Password";
    }];
    
    
    UIAlertAction* alertaction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        
        [viewCell swifeLeft];
        
        [self.myTableView reloadData];
        
        
        UITextField* title = [controller.textFields objectAtIndex:0];
        
        UITextField* userName = [controller.textFields objectAtIndex:1];
        
        UITextField* password = [controller.textFields objectAtIndex:2];
        
       
        
        if ([self validateTextfields:title :userName :password : 0 : (int)indexPath.row]) {
        
        
            if (checkFlag) {
                
        
        NSManagedObjectContext* context=[self getContext];
        
        
        [employeeObject setValue:title.text forKey:@"title"];
        
       
        [employeeObject setValue:password.text forKey:@"password"];
        [employeeObject setValue:userName.text forKey:@"userName"];
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
        }
        
       
       
    }];
    
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       [viewCell swifeLeft];
                                       
                                       [self.myTableView reloadData];
                                      
                                   }];
    
    
    [controller addAction:alertaction];
    [controller addAction:cancelAction];
    
    [self presentViewController:controller animated:YES completion:nil];
    
    
    [self fetchData];
    [self.myTableView reloadData];
    
}
-(void) searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    //This'll Show The cancelButton with Animation
    [searchBar setShowsCancelButton:YES animated:YES];
    //remaining Code'll go here
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    //This'll Hide The cancelButton with Animation
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if (searchText.length == 0) {
        
        //removes all objects of shortResults when Search text is nil and reload all Objects again
        [shortResults removeAllObjects];
        
        [shortResults addObjectsFromArray:self.employeeObjects];
    }
    
    
    else{
        
        //removes Previously Loaded Data to reload new Search
        [shortResults removeAllObjects];
        
        for (allTitles in self.employeeObjects) {
            
            //Stores the object according to searchText and artistName in artObject
            
            //NSRange is used to count number of serch results after searching
            NSRange r=[[allTitles valueForKey:
                        @"title"] rangeOfString:searchText];
            //options:NSCaseInsensitiveSearch
            
            
            //If Object Found According to Search
            if (r.location!=NSNotFound) {
                
                //Stores the Searched objects in mutableArray shortResults
                [shortResults addObject:allTitles];
            }
        }
    }
    
    //Reloads the Table View
    [self.myTableView reloadData];
}

-(void)callErrorMessage{
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                       message:@"Device has no Camara."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self.myTableView reloadData];
    
    [self openApplication:(int)indexPath.row];
    
}


-(BOOL)validateTextfields:(UITextField *)title  : (UITextField *)userName : (UITextField*)password : (int)decideEditOrAdd : (int)decideIndex{
    
    if (([[title.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]isEqualToString:@""])||([title.text isEqualToString:@""])) {
        
        
        [self showAlert:@"Please Enter Title"  :title :userName :password : decideEditOrAdd : decideIndex];
        
        return NO;
    }
   else if (([[userName.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]isEqualToString:@""])||([userName.text isEqualToString:@""])) {
       [self showAlert:@"Please Enter User Name" :title :userName :password : decideEditOrAdd : decideIndex];
        
        return NO;
    }
    
   else if (([[password.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]isEqualToString:@""])||([password.text isEqualToString:@""])) {
       [self showAlert:@"Please Enter Password" :title :userName :password : decideEditOrAdd : decideIndex];
       
       return NO;
   }
   
    return YES;

    
}

-(void)showAlert : (NSString *)myMessage : (UITextField*)title : (UITextField*)userName : (UITextField*)passoword : (int)decideEditOrAdd : (int)decideIndex{
    
    checkFlag = NO;
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:myMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self addMethod:title.text :userName.text :passoword.text : @"Re-Enter Details" : decideEditOrAdd : decideIndex];
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)addMethod : (NSString*)title : (NSString*)userName : (NSString*)password : (NSString *)alertTitle : (int)decideEditOrAdd : (int)indexPath{
    UIAlertController* controller=[UIAlertController alertControllerWithTitle:alertTitle message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"Enter Title";
        textField.text = title;
        
    }];
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"Enter User Name";
        textField.text=userName;
        
    }];
    
    [controller addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder=@"Enter Password";
        textField.text=password;
        
    }];
    
    
    
    
    UIAlertAction* alertaction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
        UITextField* title = [controller.textFields objectAtIndex:0];
        
        
        
        UITextField* userName = [controller.textFields objectAtIndex:1];
        UITextField* password = [controller.textFields objectAtIndex:2];
        
        if ([self validateTextfields:title :userName :password : decideEditOrAdd : indexPath]) {
            
            checkFlag = YES;
            if (decideEditOrAdd == 1) {
                 NSManagedObjectContext* context=[self getContext];
                
            
            NSManagedObject* emp=[NSEntityDescription insertNewObjectForEntityForName:@"AllPasswords" inManagedObjectContext:context];
            [emp setValue:title.text forKey:@"title"];
            
            
            [emp setValue:userName.text forKey:@"userName"];
            [emp setValue:password.text forKey:@"password"];
               
                
                
                UIImage *imageLogo = [UIImage imageNamed:@"web.jpg"];
                NSData *imageData = UIImagePNGRepresentation(imageLogo);
                [emp setValue:imageData forKey:@"picture"];
                
                
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
        
            
            else{
            
                [self editMethod:title.text :userName.text :password.text :indexPath];
            }
            
        }
        
    }];
    
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       
                                   }];
    
    
    [controller addAction:alertaction];
    [controller addAction:cancelAction];
    
    [self presentViewController:controller animated:YES completion:nil];
    
    
    [self fetchData];
    [self.myTableView reloadData];
    
}


-(void)editMethod : (NSString *)title : (NSString *)userName : (NSString *)password : (int)objectIndex{
    
     NSManagedObject *employeeObject =[ shortResults objectAtIndex:objectIndex];

    NSManagedObjectContext* context=[self getContext];
    
    
    [employeeObject setValue:title forKey:@"title"];
    
    
    [employeeObject setValue:password forKey:@"password"];
    [employeeObject setValue:userName forKey:@"userName"];
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


-(void)openApplication : (int)titleIndex{

    NSManagedObject *employeeObject =[ shortResults objectAtIndex:titleIndex];
    
    NSLog(@"Selected Tttle %@",[employeeObject valueForKey:@"title"]);
    // take photo button tapped.
    NSLog(@"Open Application");
    
    
    
    
    
    NSString *customURL = [[[employeeObject valueForKey:@"title"] lowercaseString] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    
    if ([customURL isEqualToString:@"facebook"]) {
        customURL = @"fb";
    }
    if ([customURL isEqualToString:@"gmail"]) {
        customURL = @"googlegmail";
    }
    if ([customURL isEqualToString:@"googlemaps"]) {
        customURL = @"comgooglemaps";
    }
    if ([customURL isEqualToString:@"google+"]) {
        customURL = @"gplus";
    }
    if ([customURL isEqualToString:@"googleplus"]) {
        customURL = @"gplus";
    }
    
    
    NSString *customUrlForApp = [NSString stringWithFormat:@"%@://",customURL];
    
    if ([[UIApplication sharedApplication]
         canOpenURL:[NSURL URLWithString:customUrlForApp]])
    {
        
        
        UIApplication *application = [UIApplication sharedApplication];
        [application openURL:[NSURL URLWithString:customUrlForApp] options:@{} completionHandler:nil];
        
        [viewCell swifeLeft];
        
        [self.myTableView reloadData];
    }
    
    
    else
    {
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"URL Error"
                                                                       message:@"No Application Found \n Are you want to open in Safari?"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Open Safari" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                                  
                                                                  [viewCell swifeLeft];
                                                                  
                                                                  [self.myTableView reloadData];
                                                                  
                                                                  UIApplication *application = [UIApplication sharedApplication];
                                                                  [application openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.%@.com",customURL]] options:@{} completionHandler:nil];
                                                              }];
        
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                                                             handler:^(UIAlertAction * action) {
                                                                 
                                                                 [viewCell swifeLeft];
                                                                 
                                                                 [self.myTableView reloadData];                                                                     }];
        [alert addAction:cancelAction];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}

- (IBAction)buttonImageAction:(UIButton *)sender {
    
    
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.myTableView];
    NSIndexPath *indexPath = [self.myTableView indexPathForRowAtPoint:buttonPosition];
    
      passTableIndex = indexPath;
    [self performSegueWithIdentifier:@"image" sender:self];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    ImageViewController *imageController = [segue destinationViewController];
    
    [imageController revieweTableIndex:passTableIndex];
}


@end

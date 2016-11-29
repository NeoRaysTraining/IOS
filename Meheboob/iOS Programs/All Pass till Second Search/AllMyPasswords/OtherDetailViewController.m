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
#import <MessageUI/MessageUI.h>
#import <Social/Social.h>

@interface OtherDetailViewController ()<MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate,UIScrollViewDelegate>{

    NSMutableArray *reciedKeyArray;
    NSMutableArray *reciedValArray;
    NSString *ReciedTitle;
    NSString *reciedImageName;
    NSMutableArray *employeeObjects;
    int getIndexpath;
    
    ModelClassForWallet *manageObject;
    OtherDetailTableViewCell *cell;
    NSMutableString *msgStringToForward;
    NSMutableString *msgStringToForwardEmail;
    NSMutableArray *titleArray;
    
    NSString *tempTextFieldText;
    
    BOOL textFieldFlag;
    
    
}

@end

@implementation OtherDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    textFieldFlag = NO;
    // Do any additional setup after loading the view, typically from a nib.
    self.buttonImageView.layer.cornerRadius = 5; // this value vary as per your desire
    self.buttonImageView.clipsToBounds = YES;
    [self fetchData];
    
    manageObject = [employeeObjects objectAtIndex:getIndexpath];
    
    reciedImageName = manageObject.imageName;
    [self.buttonImageView setBackgroundImage:[UIImage imageNamed:reciedImageName] forState:UIControlStateNormal];
    
    self.titleTextField.text = manageObject.titleOther;
    tempTextFieldText = [[NSString alloc]initWithString:self.titleTextField.text];
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

-(void)receiveallDetails:(int)reciedIndexPath{



    getIndexpath = reciedIndexPath;
    

}
- (IBAction)doneButton:(id)sender {
    [self editMethod];
    // [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)buttonImage:(id)sender {
    
    [self performSegueWithIdentifier:@"image" sender:self];
}

-(void)fetchData{
    
    NSManagedObjectContext* context=[self getContext];
    NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"AllPasswordsDetail"];
    NSError* error=nil;
    
    
    employeeObjects=[[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
    
    
 titleArray =   [employeeObjects valueForKey:@"titleOther"];
    [self.myTableView reloadData];
    
}


-(NSManagedObjectContext *)getContext{
    
    AppDelegate *App = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [App persistentContainer].viewContext;
    
    return context;
    
}

-(void)editMethod{
    
    
    if([self.titleTextField.text isEqualToString:@""]){
        
        [self CreateAlert:@"Error" :@"Pleae entere Title"];
    }
   
  else  if([self.titleTextField.text hasSuffix:@" "]){
    
        [self CreateAlert:@"Error" :@"Pleae remove blank letters"];
    }
    
    
  else  if ([self.titleTextField.text isEqualToString:tempTextFieldText]) {
        
        [self saveMethodForEdit];
        [self dismissViewControllerAnimated:YES completion:nil];

    }

   else if (![titleArray containsObject:self.titleTextField.text]) {
       
       [self saveMethodForEdit];
       [self dismissViewControllerAnimated:YES completion:nil];

       
    }

    else{
        textFieldFlag = YES;
        [self CreateAlert:@"Error" :[NSString stringWithFormat:@"%@ is alleredy present",self.titleTextField.text]];
        }
    
   //[self dismissViewControllerAnimated:YES completion:nil];
}
-(void)saveMethodForEdit{

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
    
    NSManagedObject *employeeObject =[ employeeObjects objectAtIndex:getIndexpath];
    
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
    
    manageObject = [employeeObjects objectAtIndex:getIndexpath];
    
    reciedImageName = manageObject.imageName;
    [self.buttonImageView setBackgroundImage:[UIImage imageNamed:reciedImageName] forState:UIControlStateNormal];
}
- (IBAction)deleteButton:(id)sender {
    
    
    
    NSArray *title =   [employeeObjects objectAtIndex:getIndexpath];
    
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"Delete %@",[title valueForKey:@"titleOther"]] message:[NSString stringWithFormat:@"Are you sure you want to permanently delete %@ ?",[title valueForKey:@"titleOther"]] preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
       
        [self.myTableView reloadData];
        
    }]];
    
    
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Delete" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
        NSManagedObjectContext *context = [self getContext];
        
        [context deleteObject:[employeeObjects objectAtIndex:getIndexpath]];
        
        NSError *error = nil;
        [context save:&error];
        [self dismissViewControllerAnimated:YES completion:nil];
        
        
    }]];
    [self presentViewController:actionSheet animated:YES completion:nil];
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    [textField resignFirstResponder];
    return YES;
}

- (IBAction)forward:(id)sender {
    [self createSendMessage];
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        
        
        
        // Cancel button tappped do nothing.
        
    }]];
    
//
    
   
    
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Mail" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        
        
        
        if ([MFMailComposeViewController canSendMail])
        {
            NSLog(@"It can send Mail");
            
            // Email Subject
            NSString *emailTitle = nil;
            // Email Content
            NSString *messageBody = msgStringToForwardEmail; // Change the message body to HTML
            // To address
            
            
            MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
            mc.mailComposeDelegate = self;
            [mc setSubject:emailTitle];
            [mc setMessageBody:messageBody isHTML:YES];
            
            
            // Present mail view controller on screen
            [self presentViewController:mc animated:YES completion:NULL];
            
        }
        else
        {
            [self CreateAlert:@"Error" :@"Your device will not support mail"];
            NSLog(@"It Cannot send mail");
        }
        
        
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Message" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        
        if(![MFMessageComposeViewController canSendText]) {
            
            [self CreateAlert:@"Error" :@"Your device doesn't support SMS!."];
            
            return;
        }
        
        //NSString *file = @"Check Out AllMyPasswords for your iPhone. Download from httos://www.neorays.com";
        
        NSString *message = [NSString stringWithFormat:@"%@",msgStringToForward];
        MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
        messageController.messageComposeDelegate = self;
        
        
        [messageController setBody:message];
        
        // Present message view controller on screen
        [self presentViewController:messageController animated:YES completion:nil];
        
        
        
        
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Copy All" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = [NSString stringWithString:msgStringToForward];
        
        
    }]];
    
    [self presentViewController:actionSheet animated:YES completion:nil];
    

}

-(void)createSendMessage{

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
    
    
    msgStringToForward = [[NSMutableString alloc] init];
    msgStringToForwardEmail = [[NSMutableString alloc] init];
    
   // [msgStringToForwardEmail appendString:[NSString stringWithFormat:@"%@<br><br>",self.titleTextField.text]];
    [msgStringToForward appendString:[NSString stringWithFormat:@"%@\n\n",self.titleTextField.text]];
    
    for (int i = 0; i<reciedKeyArray.count; i++) {
        [msgStringToForward appendString:[NSString stringWithFormat:@"%@ : %@\n",[reciedKeyArray objectAtIndex:i],[reciedValArray objectAtIndex:i]]];
    }
    
   
    msgStringToForwardEmail = [[NSMutableString alloc] initWithString:[msgStringToForward stringByReplacingOccurrencesOfString: @"\n" withString: @"<br>"]];

}


#pragma  - mark Alert Message

-(void)CreateAlert : (NSString *)title :(NSString *)message {
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          
                                                              if (textFieldFlag) {
                                                                  [self.titleTextField becomeFirstResponder];
                                                              }
                                                          
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)presentActivityController:(UIActivityViewController *)controller {
    
    // for iPad: make the presentation a Popover
    controller.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:controller animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [controller popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.barButtonItem = self.navigationItem.leftBarButtonItem;
    
    // access the completion handler
    controller.completionWithItemsHandler = ^(NSString *activityType,
                                              BOOL completed,
                                              NSArray *returnedItems,
                                              NSError *error){
        // react to the completion
        if (completed) {
            
            // user shared an item
            NSLog(@"We used activity type%@", activityType);
            
        } else {
            
            // user cancelled
            NSLog(@"We didn't want to share anything after all.");
        }
        
        if (error) {
            NSLog(@"An Error occured: %@, %@", error.localizedDescription, error.localizedFailureReason);
        }
    };
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(nullable NSError *)error {
    
    
    switch (result) {
        case MFMailComposeResultCancelled:
            
            
            [self CreateAlert:@"Error" :@"Message Sending Cancelled"];
            
            break;
            
        case MFMailComposeResultFailed:
            
            [self CreateAlert:@"Error" :@"Message Sending Failed"];
            
            break;
            
        case MFMailComposeResultSent:
            
            [self CreateAlert:@"Message Alert" :@"Message Sent Sucsessfully..."];
            
            
            break;
            
        case MFMailComposeResultSaved:
            
            [self CreateAlert:@"Message Alert" :@"Message Saved Sucsessfully..."];
            
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
            [self CreateAlert:@"Error" :@"Failed to send SMS!."];
            
            break;
        }
            
        case MessageComposeResultSent:
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end

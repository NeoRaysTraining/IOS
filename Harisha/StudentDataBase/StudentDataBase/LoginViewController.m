//
//  LoginViewController.m
//  StudentDataBase
//
//  Created by test on 5/12/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "LoginViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameText;
- (IBAction)LoginButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

@property(strong,nonatomic)NSMutableArray* taskList;
@property(strong,nonatomic)NSMutableArray* employeeIDs;
@property(strong,nonatomic)NSString* name;
@property(assign,nonatomic)NSString* password;
@property(strong,nonatomic)NSMutableArray* allnames;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self fetchData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fetchData
{
    
    NSManagedObjectContext* context=[self getContext];
    NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"Users"];
    NSError* error=nil;
    
    self.taskList=[[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
    
   
    
   
    
    req.resultType = NSDictionaryResultType;
    
    [req setPropertiesToFetch:[NSArray arrayWithObjects:@"name", @"password",nil]];
    
        NSArray *results    = [context executeFetchRequest:req
error:&error];
    
    self.allnames = [[NSMutableArray alloc]init];
  self.employeeIDs = [[NSMutableArray alloc]init];
    
   self.allnames = [results valueForKey:@"name"];
    self.employeeIDs = [results valueForKey:@"password"];
    
    NSLog(@"%@",_employeeIDs);
    NSLog(@"%@",self.allnames);

}
-(NSManagedObjectContext*)getContext
{
    AppDelegate* app = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext* context = [app managedObjectContext];
    
    return context;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)LoginButton:(id)sender
{
    
    [self fetchData];
    self.name = self.nameText.text;
    self.password = self.passwordText.text;
    NSLog(@"%@",[self.employeeIDs objectAtIndex:0]);
    NSLog(@"%@",[self.employeeIDs objectAtIndex:1]);
    
    if([self.name isEqualToString:[self.allnames objectAtIndex:0]] && [self.password isEqualToString:[NSString stringWithFormat:@"%@",[self.employeeIDs objectAtIndex:1]]])
       {
           [self performSegueWithIdentifier:@"displaydata" sender:self];
       }
    

    
}
@end

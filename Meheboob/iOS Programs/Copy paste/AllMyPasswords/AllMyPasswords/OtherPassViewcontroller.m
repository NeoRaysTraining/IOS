//
//  OtherPassViewcontroller.m
//  AllMyPasswords
//
//  Created by Meheboob Nadaf on 23/11/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "OtherPassViewcontroller.h"
#import "OtherViewTableViewCell.h"
#import "OtherDetailViewController.h"
#import "ModelClassForWallet.h"

@interface OtherPassViewcontroller ()

@property(strong,nonatomic)NSString *titleOther;
@property(strong,nonatomic)NSString *imageName;
@property(strong,nonatomic)NSData *allKeys;
@property(strong,nonatomic)NSData *allValues;

@end

@implementation OtherPassViewcontroller{

    int selectedIndex;
    NSMutableArray *shortResults;
    NSIndexPath *sendIndexPath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // self.nameArray = [[NSMutableArray  alloc]initWithObjects:@"Bank Account",@"Credit Card",@"ID Card",@"Driver's License",@"Car Info",@"Passport",@"Insurance Card",@"Memorship",@"Home Info", nil];
   // self.nameValues = [[NSMutableArray  alloc]initWithObjects:@"Meheboob Bank Account",@"Meheboob Credit Card",@"Meheboob ID Card",@"Meheboob Driver's License",@"Meheboob Car Info",@"Meheboob Passport",@"Meheboob Insurance Card",@"Meheboob Memorship",@"Meheboob Home Info", nil];
    
   // self.imageArray = [[NSArray alloc] initWithObjects:@"100",@"101",@"102",@"103",@"104",@"105",@"106",@"107",@"108",@"109",@"110",@"111",@"112",@"113",@"114",@"115",@"116", nil];
    self.nameArray = [[NSMutableArray alloc] init];
    self.imageArray = [[NSMutableArray alloc] init];
    
    [self fetchData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

   return self.nameArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    OtherViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.label.text =[self.nameArray objectAtIndex:indexPath.row];
    
    
    cell.image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[self.imageArray objectAtIndex:indexPath.row]]];
    
    return cell;
}
- (IBAction)addButton:(id)sender {

    NSManagedObjectContext *context = [self getContext];
    
    NSManagedObject *walletDBObject = [NSEntityDescription insertNewObjectForEntityForName:@"AllPasswordsDetail" inManagedObjectContext:context];
    
    
    self.titleOther = [[NSString alloc] initWithFormat:@"New Wallet"];
    self.imageName = [[NSString alloc] initWithFormat:@"100.jpg"];
    
    
    self.allKeys = [[NSData alloc] init];
    self.allValues = [[NSData alloc] init];
    
    ModelClassForWallet *walletClass = [[ModelClassForWallet alloc] initiWithTitle:self.titleOther :self.imageName :self.allKeys :self.allValues];
    
    [walletDBObject setValue:walletClass.titleOther forKey:@"titleOther"];
    [walletDBObject setValue:walletClass.imageName forKey:@"imageName"];
    [walletDBObject setValue:walletClass.allKeys forKey:@"allKeys"];
    [walletDBObject setValue:walletClass.allValues forKey:@"allValues"];
    
    
    
    if (![context save:nil]) {
        NSLog(@"Not Saved In Others Details");
    }
    else{
        NSLog(@"Data Saved Successfully In Others Details");
        
        
    }
    
    [self fetchData];
   // [self.myTableView reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    sendIndexPath = indexPath;
    //selectedIndex = (int) indexPath.row;
    [self performSegueWithIdentifier:@"detail" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
     if ([[segue identifier] isEqualToString:@"detail"]) {
         OtherDetailViewController *otherVC = (OtherDetailViewController*) [segue destinationViewController];
         
         
         [otherVC receiveallDetails:sendIndexPath];
     }
}
-(void)fetchData{
    
    NSManagedObjectContext* context=[self getContext];
    NSFetchRequest* req=[[NSFetchRequest alloc] initWithEntityName:@"AllPasswordsDetail"];
    NSError* error=nil;
    
    
    self.allObjects=[[NSMutableArray alloc] initWithArray:[context executeFetchRequest:req error:&error]];
    //Taking temp var to hold values for Search
    shortResults = [[NSMutableArray alloc]initWithArray:self.allObjects];
    
   
    
  self.nameArray =   [shortResults valueForKey:@"titleOther"];
     self.imageArray =   [shortResults valueForKey:@"imageName"];
    
    
   
    
    [self.myTableView reloadData];
    
}


-(NSManagedObjectContext *)getContext{
    
    AppDelegate *App = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [App persistentContainer].viewContext;
    
    return context;
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self fetchData];

    
}
@end

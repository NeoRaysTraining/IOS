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
    NSMutableArray *shortResults2;
    NSIndexPath *sendIndexPath;
    NSManagedObject *allTitles;
    int didSelect;
    NSManagedObject *didselectObject;
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

   return shortResults.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    OtherViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    allTitles = [shortResults objectAtIndex:indexPath.row];
   // allTitles = [shortResults objectAtIndex:indexPath.row];
  //  cell.label.text =[self.nameArray objectAtIndex:indexPath.row];
    cell.label.text =[allTitles valueForKey:@"titleOther"];
    
cell.image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",[allTitles valueForKey:@"imageName"]]];
    
    
    return cell;
}
- (IBAction)addButton:(id)sender {

    NSManagedObjectContext *context = [self getContext];
    
    NSManagedObject *walletDBObject = [NSEntityDescription insertNewObjectForEntityForName:@"AllPasswordsDetail" inManagedObjectContext:context];
    
    
    self.titleOther = [[NSString alloc] initWithFormat:@"New Wallet%lu",(unsigned long)self.allObjects.count];
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
    didSelect = (int) indexPath.row;

    [self performSegueWithIdentifier:@"detail" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
     if ([[segue identifier] isEqualToString:@"detail"]) {
         OtherDetailViewController *otherVC = (OtherDetailViewController*) [segue destinationViewController];
         int index = (int)[self.allObjects indexOfObject:[shortResults objectAtIndex:didSelect] ];
         
         [otherVC receiveallDetails:index];
         
        
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
        
        [shortResults addObjectsFromArray:self.allObjects];
    }
    
    
    else{
        
        //removes Previously Loaded Data to reload new Search
        [shortResults removeAllObjects];
        
        for (allTitles in self.allObjects) {
            
            //Stores the object according to searchText and artistName in artObject
            
            //NSRange is used to count number of serch results after searching
            NSRange r=[[allTitles valueForKey:
                        @"titleOther"] rangeOfString:searchText];
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


@end

//
//  ViewController.m
//  DisplayCountryInfoCoreData
//
//  Created by test on 5/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableViewOutlet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSManagedObjectContext *context = [self getContext];
    NSFetchRequest *fetch = [[NSFetchRequest alloc]initWithEntityName:@"Country"];
    
    NSError *error = nil;
    self.coreObject=[context executeFetchRequest:fetch error:&error];
}

-(void)viewWillAppear:(BOOL)animated
{
    NSManagedObjectContext *context = [self getContext];
    NSFetchRequest *fetch = [[NSFetchRequest alloc]initWithEntityName:@"Country"];
    
    NSError *error = nil;
    self.coreObject=[context executeFetchRequest:fetch error:&error];
    [self.tableViewOutlet reloadData];
}

-(NSManagedObjectContext*)getContext
{
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = app.managedObjectContext;
    return context;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.coreObject.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSManagedObject *country =[self.coreObject objectAtIndex:indexPath.row];
    
    cell.countryLbl.text=[country valueForKey:@"cname"];
    NSString* statestr = [country valueForKey:@"states"];
    cell.statesLbl.text=[NSString stringWithFormat:@"%i",[statestr intValue]];
    NSString *populationstr = [country valueForKey:@"population"];
    cell.populationLbl.text=[NSString stringWithFormat:@"%i",[populationstr intValue]];
    cell.animalLbl.text=[country valueForKey:@"animal"];
    cell.birdLbl.text=[country valueForKey:@"bird"];
    
    return cell;
}

- (IBAction)addAction:(id)sender {
    
    [self performSegueWithIdentifier:@"Segue" sender:self];
    
}

@end

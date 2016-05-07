//
//  ViewController.m
//  CoreData_using_multiple_scenes
//
//  Created by test on 06/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "TableViewCell.h"

@interface ViewController ()<UINavigationControllerDelegate>

@end

@implementation ViewController{

    ViewController2 *VC2;
    
    int btnCount;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"Inside view did load....");
      self.navigationController.delegate = self;
    
    
    
    NSManagedObjectContext *context = [self getContex];
    btnCount = 1;
    
    NSFetchRequest *fetch = [[NSFetchRequest alloc]initWithEntityName:@"Employee"];
    
    NSError *error = nil;
    
    self.coreObject = [context executeFetchRequest:fetch error:&error];
    
    [self.myTableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    
    NSManagedObjectContext *context = [self getContex];
    btnCount = 1;
    
    NSFetchRequest *fetch = [[NSFetchRequest alloc]initWithEntityName:@"Employee"];
    
    NSError *error = nil;
    
    self.coreObject = [context executeFetchRequest:fetch error:&error];
    
    [self.myTableView reloadData];
    



}

- (IBAction)addButton:(id)sender {
    
    [self performSegueWithIdentifier:@"next" sender:self];
    
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    
    
    NSLog(@"Inside call me");
    NSManagedObjectContext *context = [self getContex];
    
    
    NSFetchRequest *fetch = [[NSFetchRequest alloc]initWithEntityName:@"Employee"];
    
    NSError *error = nil;
    
    self.coreObject = [context executeFetchRequest:fetch error:&error];
    
   // [self.myTableView reloadData];
    
    
    
    return self.coreObject. count;


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSManagedObjectContext *context = [self getContex];
    
    
    NSFetchRequest *fetch = [[NSFetchRequest alloc]initWithEntityName:@"Employee"];
    
    NSError *error = nil;
    
    self.coreObject = [context executeFetchRequest:fetch error:&error];
    
    NSManagedObject *Employee = [self.coreObject objectAtIndex:indexPath.row] ;
    
    cell.nameLabel.text = [Employee valueForKey:@"name"];
    cell.genderLabel.text = [Employee valueForKey:@"gender"];
    NSString *ageStr = [Employee valueForKey:@"age"];
    cell.ageLabel.text = [NSString stringWithFormat:@"%i",[ageStr intValue]];
    cell.designationLabel.text = [Employee valueForKey:@"designation"];
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  VC2 = [segue destinationViewController];
    
       
}


-(NSManagedObjectContext *)getContex{
    
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = app.managedObjectContext;
    return context;
}


@end

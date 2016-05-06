//
//  TableViewController.m
//  CountryDetails
//
//  Created by test on 5/6/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "TableViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "TableViewCell.h"



@interface TableViewController ()
- (IBAction)showScene:(id)sender;

@property (nonatomic,strong) NSArray *detailsOfCountry;
//@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    NSManagedObjectContext *context=[self getContext];
    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"Information"];
    NSError *error=nil;
    self.detailsOfCountry=[context executeFetchRequest:request error:&error];
    //self.tableView.delegate=self;
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSManagedObjectContext*)getContext
{
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context=[app managedObjectContext];
    return context;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.detailsOfCountry count];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSManagedObjectContext *context=[self getContext];
    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:@"Information"];
    NSError *error=nil;
    self.detailsOfCountry=[context executeFetchRequest:request error:&error];
    [self.tableView reloadData]; // to reload selected cell
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSArray *singleInfo=self.detailsOfCountry[indexPath.row];
    cell.countryName.text=[singleInfo valueForKey:@"countryname"];
    cell.stateName.text=[singleInfo valueForKey:@"statename"];
    cell.placeName.text=[singleInfo valueForKey:@"placename"];
    
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)showScene:(id)sender {
    
    [self performSegueWithIdentifier:@"countryInfo" sender:self];
}
@end

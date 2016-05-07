//
//  TabelViewContrloller.m
//  CoreDatapassingValueToTabelView
//
//  Created by test on 5/6/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "TabelViewContrloller.h"
#import "TabelViewCell.h"

@interface TabelViewContrloller ()

@property (nonatomic,strong)NSArray *storeData;

@property (strong, nonatomic) IBOutlet UITableView *tabelView;

@end

@implementation TabelViewContrloller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    
    NSManagedObjectContext *context=[self getContext];
    NSFetchRequest *fetch=[[NSFetchRequest alloc]initWithEntityName:@"Person"];
    
    NSError *error=nil;
    
    self.storeData =[context executeFetchRequest:fetch error:&error];
    [self.tabelView reloadData];
   

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {


    return self.storeData.count ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    TabelViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSManagedObject *person=[self.storeData objectAtIndex:indexPath.row];
    
    
cell.textLabel.text=[person valueForKey:@"name"];
cell.detailTextLabel.text=[person valueForKey:@"designation"];
return cell;
  
}


- (IBAction)AddButton:(id)sender {


    [self performSegueWithIdentifier:@"scene2" sender:self];


}

-(NSManagedObjectContext *)getContext{
    
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context=[app managedObjectContext];
    
    
    return  context;
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

-(void)AllFetchedData{
    

    
}
@end

//
//  ViewController.m
//  ToDoLocalNotificationApp
//
//  Created by test on 5/24/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableViewOutlet;
//@property (nonatomic,strong) NSMutableArray *itemsArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _itemsArray = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[UIApplication sharedApplication] scheduledLocalNotifications] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Get list of local notifications
    NSArray *localNotifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    UILocalNotification *localNotification = [localNotifications objectAtIndex:indexPath.row];
    
    // Display notification info
    [cell.textLabel setText:localNotification.alertBody];
    [cell.detailTextLabel setText:[localNotification.fireDate description]];
    
    return cell;
}

- (IBAction)addAction:(id)sender {
    [self performSegueWithIdentifier:@"Segue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2 *VC = [segue destinationViewController];
}


@end

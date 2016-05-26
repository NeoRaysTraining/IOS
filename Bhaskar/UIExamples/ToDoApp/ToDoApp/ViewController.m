//
//  ViewController.m
//  ToDoApp
//
//  Created by test on 5/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "ToDoViewcontroller.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[UIApplication sharedApplication] scheduledLocalNotifications];
}
- (IBAction)show:(id)sender {
    
    [self performSegueWithIdentifier:@"enter" sender:nil];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [[[UIApplication sharedApplication]scheduledLocalNotifications] count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    //getting list of localNotifications
    NSArray *localNotifications=[[UIApplication sharedApplication] scheduledLocalNotifications];
    //[localNotifications removeAllObjects];
    UILocalNotification *localNotificaiton=[localNotifications objectAtIndex:indexPath.row];
    
    
    //displaying notificaiton information
    cell.textLabel.text=localNotificaiton.alertBody;
    cell.detailTextLabel.text=[localNotificaiton.fireDate description];
    return cell;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end

//
//  ViewController.m
//  ToDoApp
//
//  Created by Mahaboobsab Nadaf on 26/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
   
    
    
    
//    UILocalNotification *localnotification = [[UILocalNotification alloc]init];
//    localnotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:1];
//    localnotification.alertBody = @"Today is your Faverate Day";
//    localnotification.timeZone = [NSTimeZone defaultTimeZone];
//    [[UIApplication sharedApplication]scheduleLocalNotification:localnotification];
    
     [ [UIApplication sharedApplication] scheduledLocalNotifications];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [[[UIApplication sharedApplication]scheduledLocalNotifications]count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSArray *localnotification = [[UIApplication sharedApplication]scheduledLocalNotifications];
    
    UILocalNotification *localNotification = [localnotification objectAtIndex:indexPath.row];
    
    cell.textLabel.text = localNotification.alertBody;
    cell.detailTextLabel.text = localNotification.fireDate.description;
    return cell;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (IBAction)addList:(id)sender {
    
    [self performSegueWithIdentifier:@"setList" sender:self];
}
@end

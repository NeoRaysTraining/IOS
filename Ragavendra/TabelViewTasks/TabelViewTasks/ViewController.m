//
//  ViewController.m
//  TabelViewTasks
//
//  Created by test on 5/1/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tabelView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.listOFTasks=[[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listOFTasks.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{

UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
  
    cell.textLabel.text = [self.listOFTasks objectAtIndex:indexPath.row];
    
 
NSTimeZone *timeZone = [NSTimeZone defaultTimeZone];
NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
[dateFormatter setTimeZone:timeZone];
[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
NSDate*currentDate=[NSDate date];
NSString *localDateString = [dateFormatter stringFromDate:currentDate];
cell.detailTextLabel.text=localDateString;
    
return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{

    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (editingStyle==UITableViewCellEditingStyleDelete)
    {
        [self.listOFTasks removeObjectAtIndex:indexPath.row];
        [self.tabelView reloadData];
        
    }
    
}

- (IBAction)PlusButton:(id)sender {
    
    UIAlertController *alertController = [UIAlertController
    alertControllerWithTitle:@"Enter Task"
    message:nil
    preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Enter Task", @"");
     }];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
        handler:^(UIAlertAction * action) {
                                                          
                                                          
    UITextField*login=alertController.textFields.firstObject;
                                                          
                                                          
    [self. listOFTasks addObject:login.text];
    [self.tabelView reloadData];
                                                          
                                                          
}];
    
[alertController addAction:defaultAction];
[self presentViewController:alertController animated:YES completion:nil];

}




@end

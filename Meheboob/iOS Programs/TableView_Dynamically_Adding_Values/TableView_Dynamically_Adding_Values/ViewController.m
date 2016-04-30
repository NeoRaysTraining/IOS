//
//  ViewController.m
//  TableView_Dynamically_Adding_Values
//
//  Created by test on 30/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{

    int temp;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // UITableView *tableView;
    
    self.task = [[NSString alloc]init];
    
    self.task = @"Task ";
    self.taskArray = [[NSMutableArray alloc]initWithObjects:self.task, nil];
    
    self.generetaTask = [[NSMutableString alloc] init];
    self.generateNumber = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.taskArray.count;
    
    


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[self.taskArray objectAtIndex:indexPath.row]];
    
    cell.textLabel.textColor = [UIColor blueColor];
  
    
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    temp = (int)indexPath.row;
    
   // [self.taskArray removeObjectAtIndex:temp];
   // [self.tableView reloadData];
    
}


- (IBAction)addButton:(id)sender {
    
    self.generateNumber++;
    
    self.generetaTask = [NSString stringWithFormat:@"%@"@"%d",self.task,self.generateNumber];
    
    NSLog(@"Generetask Value is : %@",self.generetaTask);
    
    [self.taskArray addObject:self.generetaTask];
    
    NSLog(@"Task array objects : %@",self.taskArray);
    
    [self.tableView reloadData];
  
}

- (IBAction)swipeRight:(id)sender {
    
    NSLog(@"Inside swipe right ----///");
    
    [self.taskArray removeObjectAtIndex:temp];
    [self.tableView reloadData];
}


@end

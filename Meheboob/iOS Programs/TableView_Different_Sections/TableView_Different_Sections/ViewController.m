//
//  ViewController.m
//  TableView_Different_Sections
//
//  Created by test on 04/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.array1 = [[NSArray alloc]initWithObjects:@"India",@"Bangladesh",@"Sri Lanka",@"Afghanistan",@"Pakistan", nil];
    
   self.array1Captains = [[NSArray alloc]initWithObjects:@"MS Dhoni",@"Mashrafe Mortaza",@"Angelo Mathews",@"Asghar Stanikzai",@"Shahid Afridi", nil];
    
 
    
    self.array2 = [[NSArray alloc]initWithObjects:@"Australia",@"West Indies",@"South Afriaca",@"New Zealand",@"England", nil];
    
      self.array2Captains = [[NSArray alloc]initWithObjects:@"Steve Smith",@"Darren Sammy",@"AB de Villiers",@"Brendon McCullum",@"Eoin Morgan", nil];
    
    
    
    
    
    self.array3 = [[NSArray alloc]initWithObjects:@"Zimbabwe",@"Ireland",@"Barmuda", nil];
    
    self.array3Captains = [[NSArray alloc]initWithObjects:@"Brendan Taylor",@"Kevin O'Brien",@"Fiqre Crockwell", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    
    if (section == 0) {
         return self.array1.count;
    }
   else if (section == 1) {
        return self.array1.count;
    }
    else{
    
        return  self.array3.count;
    }
   
}









- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    CGFloat fontSize = 28.0 ;
    
    cell.textLabel.textColor = [UIColor blueColor];
     cell.detailTextLabel.textColor = [UIColor redColor];
    cell.textLabel.font = [UIFont systemFontOfSize:fontSize];
    
    
    CGFloat fontSize2 = 18.0 ;
    cell.detailTextLabel.font = [UIFont systemFontOfSize:fontSize2];
    
    if ([indexPath section] == 0) {
         cell.textLabel.text = [self.array1 objectAtIndex:indexPath.row];
        cell.detailTextLabel.text =[ self.array1Captains objectAtIndex:indexPath.row] ;
        
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[self.array1 objectAtIndex:indexPath.row]]];
    }
    
  else  if ([indexPath section] == 1) {
        cell.textLabel.text = [self.array2 objectAtIndex:indexPath.row];
      cell.detailTextLabel.text =[ self.array2Captains objectAtIndex:indexPath.row] ;
       cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[self.array2 objectAtIndex:indexPath.row]]];
    }
    else{
    
    cell.textLabel.text = [self.array3 objectAtIndex:indexPath.row];
        cell.detailTextLabel.text =[ self.array3Captains objectAtIndex:indexPath.row] ;
         cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[self.array3 objectAtIndex:indexPath.row]]];
    }
    
   
    
    
    
    
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;

}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        return @"GROUP A TEAMS";
    }
    
    else if (section == 1) {
        return @"GROUP B TEAMS";
    }

    else{
    return @"GROUP C TEAMS";
    
    }

}
@end

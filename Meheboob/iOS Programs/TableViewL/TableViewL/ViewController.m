//
//  ViewController.m
//  TableViewL
//
//  Created by test on 25/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
           return [self.cources count];
    }
    else{
    return [self.courcesWeb count];
    }
    
    //return [self.cources count];
}


- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        return @"Populor programming";
    }
    else{
    
    return @"Only Web courses";
    }

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    if (nil == cell) {
     cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    
    
    
    NSString *currentCourceName;
  
    //currentCourceName  = [self.courcesKey objectAtIndex:[indexPath row]];
    
    if ([indexPath section] == 0) {
        currentCourceName  = [self.courcesKey objectAtIndex:[indexPath row]];
    }
    
    else{
     currentCourceName  = [self.courcesKeyWeb objectAtIndex:[indexPath row]];
    
    }
    
    [[cell textLabel]setText:currentCourceName];
    
    
    NSString *cutrrentAuthorName;
    
    if ([indexPath section] == 0) {
        
        cutrrentAuthorName = [_cources objectForKey:[_courcesKey objectAtIndex:indexPath.row]];
    }
    
    else{
    
    cutrrentAuthorName =[_courcesWeb objectForKey:[_courcesKeyWeb objectAtIndex:indexPath.row]];
    }
    
    [[cell detailTextLabel] setText:cutrrentAuthorName];
    
    NSString *imageFile = [[NSBundle mainBundle]pathForResource:@"star" ofType:@"jpg"];
    
    UIImage *image = [[UIImage alloc]initWithContentsOfFile:imageFile];
    
    [[cell imageView]setImage:image];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *myFile = [[NSBundle mainBundle]pathForResource:@"PList" ofType:@"plist"];
    
 
    
    self.cources = [[NSDictionary alloc]initWithContentsOfFile:myFile];
    
    self.courcesKey = [self.cources allKeys];
    
    
    myFile = [[NSBundle mainBundle]pathForResource:@"WebCourses" ofType:@"plist"];
    
    
    
    self.courcesWeb = [[NSDictionary alloc]initWithContentsOfFile:myFile];
    
    self.courcesKeyWeb = [self.courcesWeb allKeys];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

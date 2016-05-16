//
//  ViewController2.m
//  COREDATAPASSINGDATA
//
//  Created by test on 5/15/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController2.h"
#import "AppDelegate.h"
@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSManagedObjectContext *context=[self getTheContext];
    
    NSFetchRequest *fetch=[[NSFetchRequest alloc ]initWithEntityName:@"Person"];
    NSError *error=nil;
    
    self.details =[context executeFetchRequest:fetch error:&error];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.details.count;

    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSManagedObject  *per=[self.details objectAtIndex:indexPath.row];

    cell.textLabel.text=[per valueForKey:@"name"];
NSString *agestr= [per valueForKey:@"age"];
    cell.detailTextLabel.text=[NSString  stringWithFormat:@"%@",agestr];
    return cell;
}


-(NSManagedObjectContext  *)getTheContext{
    
    
    AppDelegate *app=[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context=[app managedObjectContext];
    return  context;
    
}





@end

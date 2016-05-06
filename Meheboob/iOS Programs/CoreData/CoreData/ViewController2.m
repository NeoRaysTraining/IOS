//
//  ViewController2.m
//  CoreData
//
//  Created by test on 06/05/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    NSManagedObjectContext *context = [self getContex];
    
    
    NSFetchRequest *fetch = [[NSFetchRequest alloc]initWithEntityName:@"Person"];
    
    NSError *error = nil;
    
    self.coreObject = [context executeFetchRequest:fetch error:&error];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

   

}


-(NSManagedObjectContext *)getContex{
    
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = app.managedObjectContext;
    return context;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  self.coreObject.count;
    


}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSManagedObject *Person = [self.coreObject objectAtIndex:indexPath.row] ;
    
    cell.nameLabel.text = [Person valueForKey:@"name"];
    cell.genderLabel.text = [Person valueForKey:@"gender"];
     NSString *ageStr = [Person valueForKey:@"age"];
    cell.ageLabel.text = [NSString stringWithFormat:@"%i",[ageStr intValue]];
    return cell;
}









/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

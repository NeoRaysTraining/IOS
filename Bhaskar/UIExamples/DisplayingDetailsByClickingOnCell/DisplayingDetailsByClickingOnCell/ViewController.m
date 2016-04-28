//
//  ViewController.m
//  DisplayingDetailsByClickingOnCell
//
//  Created by test on 4/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "TableViewCell.h"

@interface ViewController ()

@property (strong,nonatomic) NSArray *foodNames, *foodImages;
@property (assign,nonatomic) int selectedFoodItem;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.foodNames=[[NSArray alloc]initWithObjects:@"Idly",@"Vada",@"Dosa",@"oats", nil];
    self.foodImages=[[NSArray alloc]initWithObjects:@"idly",@"vada",@"dosa",@"oats", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [_foodNames count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.foodName.text=self.foodNames[indexPath.row];
    cell.foodImage.image=[UIImage imageNamed:[_foodImages objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedFoodItem=(int)indexPath.row;
    
    [self performSegueWithIdentifier:@"descriptionOfFood" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController2 *describeItem=[segue destinationViewController];
    [describeItem receiveData:self.selectedFoodItem];
}
@end

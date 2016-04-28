//
//  ViewController.m
//  TabelViewCustomview
//
//  Created by test on 4/28/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "TableViewCell.h"

@interface ViewController ()


@property (nonatomic,strong)NSArray * foodItems;
@property  (nonatomic,strong)NSArray *foodImages;
@property (nonatomic,assign)int storeValue;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.foodItems=[[NSArray alloc]initWithObjects:@"jamoon",@"gobi",@"bun",@"piza" ,nil];

    self.foodImages=[[NSArray alloc]initWithObjects:@"jamoon",@"gobi",@"bun",@"piza",nil];



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return  self.foodItems.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{

TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.displayLabel.text=self.foodItems[indexPath.row];
    cell.imageViewDisplay.image=[UIImage imageNamed:self.foodImages[indexPath.row]];

    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.storeValue = (int)indexPath.row;
    
    [self performSegueWithIdentifier:@"scene2" sender:self];

}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    ViewController2 *vc2=[segue destinationViewController];

 
    [vc2  receiveAllFoodItems:self.storeValue];
    
    
}


@end

//
//  ViewController.m
//  Segueys_using_Table_View
//
//  Created by test on 28/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    int rowNumber;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.placeNames = [[NSArray alloc]initWithObjects:@"Ghataprabha birds sanctuary",@"Gokak Falls",@"Vijayanagar Hampi",@"Halebidu Temple",@"Badami Cave Temples",@"Kudroli Gokarnath Temple",@"Gol Gumbaz",@"Visvesvaraya Technological Museum",@"Lalbagh Botanical Garden",@"Godchinamalaki Falls", nil];
    
    self.placeImages = [[NSArray alloc]initWithObjects:@"IGhataprabha bird sanctuary",@"IGokak False",@"IVijayanagar Hampi",@"IHalebidu Temple",@"IBadami Cave Temples",@"IKudroli Gokarnath Temple",@"IGol Gumbaz",@"IVisvesvaraya Industrial and Technological Museum",@"ILalbagh Botanical Garden",@"IGodchinamalaki Falls", nil];
    

    
    











}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Called after the user changes the selection.





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return [self.placeNames count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.imageField.image = [UIImage imageNamed:[self.placeImages objectAtIndex:indexPath.row]];
    
    cell.labelField.text = [NSString stringWithFormat:@"%@",[self.placeNames objectAtIndex:indexPath.row]];

    
    return  cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //NSLog(@"Selected row is : %ld", (long)indexPath.row);
    
    
    rowNumber = (int)indexPath.row;
    
    NSLog(@"Row Number is : %d",rowNumber);
    
    
    [self performSegueWithIdentifier:@"next" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ViewController2 *Vc2 = [segue destinationViewController];
    
    [Vc2 getRowNumber:rowNumber];
}


@end

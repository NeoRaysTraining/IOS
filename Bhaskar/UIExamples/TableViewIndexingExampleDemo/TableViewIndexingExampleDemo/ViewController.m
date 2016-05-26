//
//  ViewController.m
//  TableViewIndexingExampleDemo
//
//  Created by test on 5/26/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *sectionDataArray,*tableDataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableDataArray = [[NSArray alloc]initWithObjects:
                      @"Ant",
                      @"African lion",
                      @"Bear",
                      @"Black Swan",
                      @"Buffalo",
                      @"Camel",
                      @"Cockatoo",
                      @"Dog",
                      @"Donkey",
                      @"Emu",
                      @"Giraffe",
                      @"Greater Rhea",
                      @"Hippopotamus",
                      @"Horse",
                      @"Koala",
                      @"Lion",
                      @"Llama",
                      @"Manatus",
                      @"Meerkat",
                      @"Panda",
                      @"Peacock",
                      @"Pig",
                      @"Platypus",
                      @"Polar Bear",
                      @"Rhinoceros",
                      @"Seagull",
                      @"Tasmania Devil",
                      @"Whale",
                      @"Whale Shark",
                      @"Wombat",
                      nil];
    
    self.sectionDataArray=[[NSArray alloc] initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"K",@"L",@"M",@"P",@"R",@"S",@"T",@"W", nil];
    
    self.indexedTableView.delegate=self;
    self.indexedTableView.dataSource=self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  [self.sectionDataArray count];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"SELF beginswith[c] %@",[_sectionDataArray objectAtIndex:section]];
    
    NSArray *tempArry=[self.tableDataArray filteredArrayUsingPredicate:predicate];
    return [tempArry count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifer=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"SELF beginswith[c] %@",[_sectionDataArray objectAtIndex:indexPath.section]];
    
    NSArray *tempArry=[self.tableDataArray filteredArrayUsingPredicate:predicate];
    cell.textLabel.text=[tempArry objectAtIndex:indexPath.row];
    return cell;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.sectionDataArray objectAtIndex:section];
}

-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.sectionDataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

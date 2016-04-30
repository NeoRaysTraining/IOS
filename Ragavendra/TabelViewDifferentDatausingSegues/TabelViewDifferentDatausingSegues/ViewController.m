//
//  ViewController.m
//  TabelViewDifferentDatausingSegues
//
//  Created by test on 4/28/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *differentPlaces;
@property (nonatomic,strong) NSArray *PlacesImages;
@property (nonatomic,strong) NSArray *textDisplay;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

self.differentPlaces=[[NSArray alloc]initWithObjects:@"Dubai",@"London",@"Paris",@"USA",nil];

self.PlacesImages=[[NSArray alloc]initWithObjects:@"dubai",@"london",@"paris",@"usa", nil];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return  self.differentPlaces.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    
  cell.textLabel.text= self.differentPlaces[indexPath.row];
    
  cell.imageView.image = [UIImage imageNamed:[self.PlacesImages objectAtIndex:indexPath.row]];
   
    return cell;


}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    
    [self performSegueWithIdentifier:@"next" sender:self];



}
    

    
    
    
    
@end

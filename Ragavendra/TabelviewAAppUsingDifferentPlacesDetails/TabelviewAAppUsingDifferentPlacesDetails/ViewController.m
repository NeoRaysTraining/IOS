//
//  ViewController.m
//  TabelviewAAppUsingDifferentPlacesDetails
//
//  Created by test on 4/28/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "TabelViewCell.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.differentPlaces=[[NSArray alloc ]initWithObjects:@"London",@"Duabi",@"Paris",@"U.S.A", nil];
    
    
    self.differentImages=[[NSArray alloc]initWithObjects:@"london",@"dubai",@"paris",@"usa",nil];



  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
  
    return self.differentPlaces.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    TabelViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    cell.imageViewDisplay.image=[UIImage imageNamed:self.differentImages[indexPath.row]];
    
    cell.textLabel.text=self.differentPlaces[indexPath.row];
    

    return cell;


    }


@end

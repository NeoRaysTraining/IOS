//
//  SellViewController.m
//  StockTracker
//
<<<<<<< Updated upstream
//  Created by test on 20/07/16.
=======
//  Created by Meheboob Nadaf on 20/07/16.
>>>>>>> Stashed changes
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "SellViewController.h"

@interface SellViewController ()

@end

@implementation SellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.sellArray = [[NSArray alloc] initWithObjects:@"Fidelity",@"Etrade",@"TD",@"TradeKing",@"Tradier",@"Scottrade",@"Schwab",@"TradeStation",@"TradeMonster",@"Robinhood", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return self.sellArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [self.sellArray objectAtIndex:indexPath.row];
    
    return cell;
}

@end

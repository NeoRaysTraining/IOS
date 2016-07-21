//
//  TableViewCell.h
//  StockExchangeApplicationDemo
//
//  Created by test on 7/19/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *graphImg;
@property (strong, nonatomic) IBOutlet UILabel *exchangeDet;
@property (strong, nonatomic) IBOutlet UILabel *compName;
@property (strong, nonatomic) IBOutlet UILabel *currentPrice;
@property (strong, nonatomic) IBOutlet UILabel *changeInrate;
@property (strong, nonatomic) IBOutlet UILabel *exchangeDetails;


@end

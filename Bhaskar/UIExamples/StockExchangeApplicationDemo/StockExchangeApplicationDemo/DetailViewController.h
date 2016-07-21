//
//  DetailViewController.h
//  StockExchangeApplicationDemo
//
//  Created by test on 7/20/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "ViewController.h"

@interface DetailViewController : ViewController
@property (strong, nonatomic) IBOutlet UILabel *symbolOutlet;
@property (strong, nonatomic) IBOutlet UILabel *companyNameOutlet;
@property (strong, nonatomic) IBOutlet UILabel *priceOutlet;
@property (strong, nonatomic) IBOutlet UILabel *previousClose;
@property (strong, nonatomic) IBOutlet UILabel *preMarketOutlet;
@property (strong, nonatomic) IBOutlet UILabel *prevLblCloseOutlet;
@property (strong, nonatomic) IBOutlet UILabel *openPriceLbl;
@property (strong, nonatomic) IBOutlet UILabel *exchangeLbl;
@property (strong, nonatomic) IBOutlet UILabel *percentChangeLbl;
@property (strong, nonatomic) IBOutlet UILabel *netChange;
@property (strong, nonatomic) IBOutlet UILabel *lastPrice;
@property (strong, nonatomic) IBOutlet UILabel *high;
@property (strong, nonatomic) IBOutlet UILabel *volume;

-(void)receiveData:(NSDictionary *)dictValues;

@end

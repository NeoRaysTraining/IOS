//
//  DetailViewController.h
//  StockTracker
//
//  Created by Mahaboobsab Nadaf on 19/07/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
-(void)receiveArrray : (NSArray *)selectedArray;
@property(strong,nonatomic)NSArray *receivedArray;

@property (weak, nonatomic) IBOutlet UILabel *openLbl;
@property (weak, nonatomic) IBOutlet UILabel *lowLbl;

@property (weak, nonatomic) IBOutlet UILabel *highLbl;
@property (weak, nonatomic) IBOutlet UILabel *echangeLbl;
@property (weak, nonatomic) IBOutlet UILabel *preCloseLbl;
@property (weak, nonatomic) IBOutlet UILabel *modeLbl;
@property (weak, nonatomic) IBOutlet UILabel *flagLbl;

@property (weak, nonatomic) IBOutlet UILabel *HighLblFifty;
@property (weak, nonatomic) IBOutlet UILabel *volumeLbl;
@property (weak, nonatomic) IBOutlet UILabel *lowFiftyLbl;
@property (weak, nonatomic) IBOutlet UILabel *topCloseLbl;
@property (weak, nonatomic) IBOutlet UILabel *netChangePercLbl;





@end

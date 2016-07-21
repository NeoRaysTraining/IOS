//
//  DetailViewController.m
//  StockExchangeApplicationDemo
//
//  Created by test on 7/20/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property(strong,nonatomic)NSDictionary *requiredValues;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",self.requiredValues);
    
    [self settingValues];
}

-(void)settingValues
{
    //dispatch_async(dispatch_get_main_queue(), ^{
        [self.companyNameOutlet setText:[NSString stringWithFormat:@"%@",[self.requiredValues valueForKey:@"name"]]];
        [self.symbolOutlet setText:[NSString stringWithFormat:@"%@",[self.requiredValues valueForKey:@"symbol"]]];
        [self.prevLblCloseOutlet setText:[NSString stringWithFormat:@"%@",[self.requiredValues valueForKey:@"close"] ]];
        [self.exchangeLbl setText:[NSString stringWithFormat:@"%@",[self.requiredValues valueForKey:@"exchange"]]];
        [self.netChange setText:[NSString stringWithFormat:@"%@",[self.requiredValues valueForKey:@"netChange"]]];
        [self.openPriceLbl setText:[NSString stringWithFormat:@"%@",[self.requiredValues valueForKey:@"open"]]];
        [self.lastPrice setText:[NSString stringWithFormat:@"%@",[self.requiredValues valueForKey:@"lastPrice"] ]];
        [self.high setText:[NSString stringWithFormat:@"%@",[self.requiredValues valueForKey:@"high"]]];
    [self.percentChangeLbl setText:[NSString stringWithFormat:@"%@",[self.requiredValues valueForKey:@"percentChange"] ]];
    [self.percentChangeLbl setText:[NSString stringWithFormat:@"%@",[self.requiredValues valueForKey:@"percentChange"] ]];
    [self.priceOutlet setText:[NSString stringWithFormat:@"%@",[self.requiredValues valueForKey:@"lastPrice"] ]];
    [self.volume setText:[NSString stringWithFormat:@"%@",[self.requiredValues valueForKey:@"volume"]]];
    //});
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)receiveData:(NSDictionary *)dictValues
{
    
    self.requiredValues=dictValues;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

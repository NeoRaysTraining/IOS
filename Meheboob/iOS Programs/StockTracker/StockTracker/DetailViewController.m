//
//  DetailViewController.m
//  StockTracker
//
//  Created by Mahaboobsab Nadaf on 19/07/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)receiveArrray : (NSArray *)selectedArray{


    self.receivedArray = selectedArray;
    
    NSLog(@"Received Array is : %@",self.receivedArray);
}
-(void)updateLabels{


    self.openLbl.text = [NSString stringWithFormat:@"%@",[self.receivedArray valueForKey:@"open"]];
    self.highLbl.text = [NSString stringWithFormat:@"%@",[self.receivedArray valueForKey:@"high"]];
    self.HighLblFifty.text = [NSString stringWithFormat:@"%@",[self.receivedArray valueForKey:@"lastPrice"]];
    self.volumeLbl.text = [NSString stringWithFormat:@"%@",[self.receivedArray valueForKey:@"volume"]];
    self.echangeLbl.text = [NSString stringWithFormat:@"%@",[self.receivedArray valueForKey:@"exchange"]];
    self.preCloseLbl.text = [NSString stringWithFormat:@"%@",[self.receivedArray valueForKey:@"close"]];
     self.lowLbl.text = [NSString stringWithFormat:@"%@",[self.receivedArray valueForKey:@"low"]];
    self.lowFiftyLbl.text = [NSString stringWithFormat:@"%@",[self.receivedArray valueForKey:@"low"]];
    self.modeLbl.text = [NSString stringWithFormat:@"%@",[self.receivedArray valueForKey:@"mode"]];
    
    
    self.flagLbl.text = [NSString stringWithFormat:@"%@",[self.receivedArray valueForKey:@"flag"]];
    
    self.topCloseLbl.text = [NSString stringWithFormat:@"%@",[self.receivedArray valueForKey:@"close"]];
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@ - %@",[self.receivedArray valueForKey:@"symbol"],[self.receivedArray valueForKey:@"name"]];
   
    NSString *tmp = @"%";
   self.netChangePercLbl.text =[NSString stringWithFormat:@"%@ ( %@%@)",[self.receivedArray valueForKey:@"netChange"],[self.receivedArray valueForKey:@"percentChange"],tmp];
    
    
    
    NSString *searchtext = @"-";
    NSRange range2 = [self.netChangePercLbl.text rangeOfString:searchtext];
    if (range2.location != NSNotFound)
    {
        self.netChangePercLbl.textColor = [UIColor redColor];
        
    }

}
@end

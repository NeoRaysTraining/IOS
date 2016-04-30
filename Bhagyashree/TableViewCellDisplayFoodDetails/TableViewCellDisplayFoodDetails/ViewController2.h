//
//  ViewController2.h
//  TableViewCellDisplayFoodDetails
//
//  Created by test on 4/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface ViewController2 : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLbl2;
@property (weak, nonatomic) IBOutlet UIImageView *imgOutlet2;
@property (weak, nonatomic) IBOutlet UILabel *descLbl2;

-(void)receiveData:(NSArray*)foodItem:(NSArray*)imgNames:(NSString*)desc:(long)rowNum;
@property (nonatomic,strong) NSArray* rcvFood;
@property (nonatomic,strong) NSArray* rcvImg;
@property (nonatomic,strong) NSString* rcvDesc;

@end

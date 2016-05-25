//
//  ViewController2.h
//  SearchIFoodItemsByusingSearchBar
//
//  Created by test on 5/24/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController2 : UIViewController

@property (nonatomic,strong)NSArray *foodDescription;


@property (nonatomic,strong)NSMutableArray *receivedFoodImages;
-(void)receivedData :(int)receiveValue;



@end

//
//  ViewController2ViewController.h
//  TabelViewMultipleScene
//
//  Created by test on 4/27/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

#import "TableViewCell.h"
@interface ViewController2ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
-(void)getImage :(NSString*)receiveImage;

-(void)receiveAllDetails:(NSArray*)list1 :(NSMutableArray *)list2;

@property (strong,nonatomic)NSString *thisClassImage;

@property(strong,nonatomic)NSArray *thisClassArray;

@property (nonatomic,strong)NSMutableArray *receivedNames;

@end

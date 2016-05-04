//
//  ViewController.h
//  UICollerctionViewDemo3
//
//  Created by test on 5/4/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)NSArray *differentCricketTeams;
@property (nonatomic,strong)NSArray *differentCricketTeamImages;
@property (nonatomic,assign)int storingValue;


@end


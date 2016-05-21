//
//  ViewController.h
//  PickerViewDemo
//
//  Created by test on 5/15/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *displaylabel;
@property (nonatomic,strong)NSArray *IPlTeams;
@end


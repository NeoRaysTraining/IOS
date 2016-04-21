//
//  ViewController.h
//  ModalSegue
//
//  Created by test on 4/20/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController2.h"

@interface ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@property (nonatomic,strong) NSArray *fruits;


@end


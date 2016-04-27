//
//  ViewController.h
//  TabelViewMultipleScene
//
//  Created by test on 4/27/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageViewDisplay;
@property (weak, nonatomic) IBOutlet UITextField *firstName;


@property (weak, nonatomic) IBOutlet UITextField *lastName;



@property (weak, nonatomic) IBOutlet UITextField *phoneNUm;

@property (weak, nonatomic) IBOutlet UITextField *Addiress;

@property (nonatomic ,strong)NSArray *fieldNames;
@property (nonatomic,strong )NSMutableArray *fieldValues;

@property (nonatomic,strong)NSString *imageValue;

@end


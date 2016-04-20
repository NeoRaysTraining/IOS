//
//  ViewController.h
//  CalculatorApp
//
//  Created by test on 4/16/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

//#define PLUS
//#define MINUS
//#define MULTIPLY
//#define DIVIDE

@interface ViewController : UIViewController


@property (nonatomic,strong) NSString *theNumber;

@property  (nonatomic,strong)NSNumber *num1,*num2;

@property NSInteger answer;

@property (nonatomic,strong) NSString *operand;


@end


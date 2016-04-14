//
//  ViewController.m
//  NSMutableArrayTask
//
//  Created by test on 4/13/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *enterTextField;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (nonatomic,strong) NSMutableArray *names;
@property (nonatomic,strong) NSString *values;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _names = [NSMutableArray arrayWithObjects:@"Bhagya",@"Bhaskar",@"Nadaf",@"Raghu", nil];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

static int count=0;
- (IBAction)addButton:(id)sender {
    _values = self.enterTextField.text;

    if(count<4)
    {
    [_names replaceObjectAtIndex:count withObject:_values];
        self.displayLabel.text= [NSString stringWithFormat:@"new value is added at index %d new array is : %@",count,_names];
        count++;
    }
    else{
        [_names addObject:_values];
        self.displayLabel.text = [NSString stringWithFormat:@"new array is :%@",_names];
    }
}

@end

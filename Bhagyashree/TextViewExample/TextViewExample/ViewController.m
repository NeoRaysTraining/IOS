//
//  ViewController.m
//  TextViewExample
//
//  Created by test on 4/13/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *enterTextField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic,strong) NSMutableArray *names;
@property NSString *name;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _names=[NSMutableArray arrayWithObjects:@"bhagya",@"bhaskar",@"mahima",@"raghu",nil];
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

static int count=0;
- (IBAction)addButton:(id)sender {
    _name = self.enterTextField.text;
    if(count<4)
    {
        [_names replaceObjectAtIndex:count withObject:_name];
        self.textView.text= [NSString stringWithFormat:@"new value is added at index %d new array is : %@",count,_names];
        count++;
    }
    else
    {
        [_names addObject:_name];
        self.textView.text= [NSString stringWithFormat:@"new value is added at index %d new array is : %@",count,_names];
    }
    [self displayArrayInTextView:_names];
    
}

-(void) displayArrayInTextView:(NSArray*)array
{
    [self.names componentsJoinedByString:@"\n"];
}
@end

//
//  ViewController3.m
//  SegueImageDisplayEx
//
//  Created by test on 4/20/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()
@property (nonatomic,strong) NSArray *rcvArray;
@property (nonatomic,strong) NSString *name4;
@property (weak, nonatomic) IBOutlet UILabel *displayLbl;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.displayLbl.text= _name4;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) recieveDataFrom2 :(NSArray *) wonders:(NSString*) name3
{
    self.name4 = name3;
    self.rcvArray = wonders;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

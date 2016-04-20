//
//  ViewController2.m
//  PushSegue
//
//  Created by test on 4/19/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (nonatomic,strong) NSString* nameRcv;
@property (nonatomic,strong) NSString* passRcv;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"name:%@",_nameRcv);
    NSLog(@"pass:%@",_passRcv);
    self.name.text = _nameRcv;
    self.pass.text = _passRcv;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void) receiveData:(NSString*)nameStr password:(NSString*)passStr
{
    self.nameRcv=nameStr;
    self.passRcv=passStr;
}

@end

//
//  ViewController2.m
//  TableViewCellDisplayFoodDetails
//
//  Created by test on 4/28/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property long rcvRowNum;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLbl2.text=_rcvFood[_rcvRowNum];
    self.imgOutlet2.image=[UIImage imageNamed:_rcvImg[_rcvRowNum]];
    self.descLbl2.text=_rcvDesc;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)receiveData:(NSArray*)foodItem:(NSArray*)imgNames:(NSString*)desc:(long)rowNum
{
    _rcvRowNum=rowNum;
    _rcvFood=foodItem;
    _rcvImg=imgNames;
    _rcvDesc=desc;
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

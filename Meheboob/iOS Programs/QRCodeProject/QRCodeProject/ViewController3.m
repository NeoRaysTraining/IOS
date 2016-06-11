//
//  ViewController3.m
//  QRCodeProject
//
//  Created by test on 10/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [ self.imageView setImage:[UIImage imageWithData:_QrStr]];
    
    
    
        
}

-(void)recieveDetails:(NSData *)allDetails{
    
    self.QrStr = allDetails;
    
}
@end

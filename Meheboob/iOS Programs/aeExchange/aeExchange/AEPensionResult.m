//
//  AEPensionResult.m
//  aeExchange
//
//  Created by Mahaboobsab Nadaf on 18/06/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "AEPensionResult.h"

@interface AEPensionResult ()

@end

@implementation AEPensionResult

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)printEmailCommLetter:(id)sender {
    
    [self performSegueWithIdentifier:@"aeExchangeAppReleaseShedule" sender:self];
}
@end

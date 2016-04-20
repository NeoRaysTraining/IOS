//
//  ViewController2.m
//  ModalSegue
//
//  Created by test on 4/20/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (nonatomic,strong) NSString * string;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,strong) NSString* itemName;
@property (weak, nonatomic) IBOutlet UITextField *enterFiled;

@end
NSMutableString *entredStr;

@implementation ViewController2


- (void)viewDidLoad {
    [super viewDidLoad];
    if([_itemName isEqualToString:@"Apple"])
    {
        self.imageView.image = [UIImage imageNamed:@"apple"];
    }
    else if([_itemName isEqualToString:@"Orange"])
    {
        self.imageView.image = [UIImage imageNamed:@"orange"];
    }
    else if ([_itemName isEqualToString:@"Grapes"])
    {
        self.imageView.image = [UIImage imageNamed:@"grapes"];
    }
    else if([_itemName isEqualToString:@"Mango"])
    {
        self.imageView.image = [UIImage imageNamed:@"mango"];
    }
    entredStr = [NSMutableString stringWithFormat:@"%@",self.enterFiled.text];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) receiveData:(NSArray*) fruits:(NSString*)item
{
    self.rcvArray= fruits;
    self.itemName=item;
}

- (IBAction)doneAction:(id)sender {
  //  [self performSegueWithIdentifier: sender:<#(nullable id)#>]
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController *VC = [segue destinationViewController];
    [VC afterDone:entredStr];
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

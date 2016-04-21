//
//  ViewController2.m
//  SegueImageDisplayEx
//
//  Created by test on 4/19/16.o
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController3.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (nonatomic,strong) NSString *name2;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    _wonders = @[@"Taj mahal",@"Ghiza pyramid",@"Colosseum theater",@"Statue of liberty",@"China wall",@"Golden gate bridge",@"Eiffel tower"];
    
    if([_name2 isEqualToString:_wonders[0]])
    {
        self.imageView.image = [UIImage imageNamed:@"taj"];
    }
    else if ([_name2 isEqualToString:_wonders[1]])
    {
        self.imageView.image = [UIImage imageNamed:@"pyramid"];
    }
    else if ([_name2 isEqualToString:_wonders[2]])
    {
        self.imageView.image = [UIImage imageNamed:@"colosseum"];
    }
    else if ([_name2 isEqualToString:_wonders[3]])
    {
        self.imageView.image = [UIImage imageNamed:@"liberty"];
    }
    else if ([_name2 isEqualToString:_wonders[4]])
    {
        self.imageView.image = [UIImage imageNamed:@"chainawall"];
    }
    else if ([_name2 isEqualToString:_wonders[5]])
    {
        self.imageView.image = [UIImage imageNamed:@"goldengate"];
    }
    else if ([_name2 isEqualToString:_wonders[6]])
    {
        self.imageView.image = [UIImage imageNamed:@"eiffel"];
    }
    self.displayLabel.text= self.name2;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) recieveData :(NSString *) enteredName
{
    self.name2= enteredName;
}
- (IBAction)nextButton:(id)sender {
    
    [self performSegueWithIdentifier:@"Scene3Seg" sender:self];

}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController3 *VC3 = [segue destinationViewController];
    [VC3 recieveDataFrom2 :self.wonders :_name2];

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

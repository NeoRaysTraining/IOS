//
//  ViewController2.m
//  DisplayInfoModalSegue
//
//  Created by test on 4/21/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (nonatomic,strong) NSString* rcvdStr;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    if([_rcvdStr isEqualToString:@"sirmv"])
    {
        self.displayLabel.text = @"M. Visvesvaraya, KCIE (popularly known as Sir MV; 15 September 1861-12 April 1962)was an Indian engineer, scholar, statesman and the Diwan of Mysore from 1912 to 1918. He is a recipient of the Indian Republic's highest honour, the Bharat Ratna, in 1955. He was knighted as a Knight Commander of the British Indian Empire (KCIE) by King George V for his contributions to the public good. Every year, on his birthday, 15 September is celebrated as Engineer's Day in India in his memory. He is held in high regard as a pre-eminent engineer of India.";
        self.imageView.image =[UIImage imageNamed:@"sirmv"];
    }
    else if ([_rcvdStr isEqualToString:@"sonu"])
    {
        self.displayLabel.text = @"Sonu Nigam (30 July 1973) is an Indian playback singer whose songs have been featured mainly in Hindi and Kannada. He has also sung in Tamil, Telugu, Marathi and various Indian languages. He has also released Indian pop albums and acted in a number of movies. He has been one of the highest paid Indian singers. His singing style is considered similar to the legendary Mohd. Rafi whom he also considers his motivation.";
        self.imageView.image = [UIImage imageNamed:@"sonunigam"];
    }
    else if ([_rcvdStr isEqualToString:@"abdul"])
    {
        self.displayLabel.text = @"Avul Pakir Jainulabdeen A. P. J. Abdul Kalam (15 October 1931 – 27 July 2015) was the 11th President of India from 2002 to 2007. A career scientist turned politician, Kalam was born and raised in Rameswaram, Tamil Nadu, and studied physics and aerospace engineering. He spent the next four decades as a scientist and science administrator, mainly at the Defence Research and Development Organisation (DRDO) and Indian Space Research Organisation (ISRO) and was intimately involved in India's civilian space program and military missile development efforts.";
        self.imageView.image = [UIImage imageNamed:@"abdulkalam"];
    }
    else if ([_rcvdStr isEqualToString:@"steve"])
    {
        self.displayLabel.text = @"Steven Paul Steve Jobs (February 24, 1955-October 5, 2011) was an American information technology entrepreneur and inventor. He was the co-founder, chairman, and chief executive officer (CEO) of Apple Inc.; CEO and largest shareholder of Pixar Animation Studios; a member of The Walt Disney Company's board of directors following its acquisition of Pixar; and founder, chairman, and CEO of NeXT Inc. Jobs is widely recognized as a pioneer of the microcomputer revolution of the 1970s, along with Apple co-founder Steve Wozniak.";
        self.imageView.image = [UIImage imageNamed:@"stevejobs"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)receiveInfo:(NSString*)name
{
    self.rcvdStr = name;
}


- (IBAction)doneAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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

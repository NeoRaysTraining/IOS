//
//  ViewController2.m
//  SegueApllication
//
//  Created by test on 4/20/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UIImageView *displayImage;
@property (weak, nonatomic) IBOutlet UITextView *displayText;

@property (strong,nonatomic)NSString* data;

@property (strong,nonatomic)UIImage* img;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.displayText.text= self.data;
    self.displayImage.image = self.img;
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
- (IBAction)Done:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
-(void)steve
{
    self.img = [UIImage imageNamed:@"stevejobs"];
    
    self.data= @"Steven Paul Steve Jobs (/ˈdʒɒbz/; February 24, 1955 – October 5, 2011) was an American information technology entrepreneur and inventor. He was the co-founder, chairman, and chief executive officer (CEO) of Apple Inc.; CEO and largest shareholder of Pixar Animation Studios;[3] a member of The Walt Disney Company's board of directors following its acquisition of Pixar; and founder, chairman, and CEO of NeXT Inc. Jobs is widely recognized as a pioneer of the microcomputer revolution of the 1970s, along with Apple co-founder Steve Wozniak. Shortly after his death, Jobs's official biographer, Walter Isaacson, described him as a creative entrepreneur whose passion for perfection and ferocious drive revolutionized six industries: personal computers, animated movies, music, phones, tablet computing, and digital publishing.";
}

-(void)satya
{
    self.img = [UIImage imageNamed:@"SatyaNadella"];
    
    self.data = @"Satya Narayana Nadella (born August 19, 1967) is an India-born American business executive. He is the current chief executive officer (CEO) of Microsoft.[7][8] He was appointed as CEO on 4 February 2014, succeeding Steve Ballmer. Before becoming CEO of Microsoft, he was Executive Vice President of Microsoft's Cloud and Enterprise group, responsible for building and running the company's Computing Platforms, Developer Tools and Cloud Computing Services.";
}
-(void)sundar
{
    self.img = [UIImage imageNamed:@"sundarPichai"];
    
    self.data = @"Pichai Sundararajan (Tamil: பிச்சை சுந்தரராஜன்; born 12 July 1972), better known as Sundar Pichai, is an Indian American business executive. He is currently the Chief Executive Officer of Google Inc.[4][5][6] Formerly Product Chief at Google, Pichai's current role was announced on August 10, 2015, as part of the restructuring process which made Alphabet Inc. into Google's parent company.[7] He assumed the position upon the completion of the process on October 2, 2015.[8]";
}
-(void)mark
{
    self.img = [UIImage imageNamed:@"mark"];
    
    self.data = @"Mark Elliot Zuckerberg (born May 14, 1984) is an American computer programmer, Internet entrepreneur, and philanthropist. He is the chairman, chief executive, and co-founder of the social networking website Facebook.[4][5] His net worth is estimated to be $48.2 billion as of 2016.Together with his college roommates and fellow Harvard University students Eduardo Saverin, Andrew McCollum, Dustin Moskovitz, and Chris Hughes, he launched Facebook from Harvard's dormitory rooms";
}


@end

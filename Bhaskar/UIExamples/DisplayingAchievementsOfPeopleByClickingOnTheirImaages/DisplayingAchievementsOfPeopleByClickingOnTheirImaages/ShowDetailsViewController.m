//
//  ShowDetailsViewController.m
//  DisplayingAchievementsOfPeopleByClickingOnTheirImaages
//
//  Created by test on 4/20/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ShowDetailsViewController.h"

@interface ShowDetailsViewController()

@property (strong,nonatomic) UIImage *img;

@property (strong,nonatomic) NSString *details;

@end

@implementation ShowDetailsViewController

-(void)viewDidLoad
{
    self.fullImgView.image=self.img;
    self.textDetailsView.text=self.details;
}

-(void)displayPersonDetails:(int)person
{
    if(person==11)
    {
        self.img=[UIImage imageNamed:@"sachin"];
        
        self.details=@"Sachin Ramesh Tendulkar ( born 24 April 1973) is a former Indian cricketer and captain, widely regarded as one of the greatest batsmen of all time. He took up cricket at the age of eleven, made his Test debut on 15 November 1989 against Pakistan in Karachi at the age of sixteen, and went on to represent Mumbai domestically and India internationally for close to twenty-four years. He is the only player to have scored one hundred international centuries, the first batsman to score a double century in a One Day International, the holder of the record for the number of runs in both ODI and Test cricket, and the only player to complete more than 30,000 runs in international cricket";
    }
    else if (person==22)
    {
        self.img=[UIImage imageNamed:@"apj"];
        self.details=@"Avul Pakir Jainulabdeen A. P. J. Abdul Kalam  was the 11th President of India from 2002 to 2007. A career scientist turned politician, Kalam was born and raised in Rameswaram, Tamil Nadu, and studied physics and aerospace engineering. He spent the next four decades as a scientist and science administrator, mainly at the Defence Research and Development Organisation (DRDO) and Indian Space Research Organisation (ISRO) and was intimately involved in India's civilian space program and military missile development efforts.[1] He thus came to be known as the Missile Man of India for his work on the development of ballistic missile and launch vehicle technology.[2][3][4] He also played a pivotal organizational, technical, and political role in India's Pokhran-II nuclear tests in 1998, the first since the original nuclear test by India in 1974.[5]";
    }
    else if(person==33)
    {
        self.img=[UIImage imageNamed:@"sirmv"];
        self.details=@"M. Visvesvaraya, KCIE (popularly known as Sir MV; 15 September 1861 – 12 April 1962)[1] was an Indian engineer, scholar, statesman and the Diwan of Mysore from 1912 to 1918. He is a recipient of the Indian Republic's highest honour, the Bharat Ratna, in 1955. He was knighted as a Knight Commander of the British Indian Empire (KCIE) by King George V for his contributions to the public good. Every year, on his birthday, 15 September is celebrated as Engineer's Day in India in his memory. He is held in high regard as a pre-eminent engineer of India. He was the chief engineer responsible for the construction of the Krishna Raja Sagara dam in Mysore as well as the chief designer of the flood protection system for the city of Hyderabad.";
    }
    else if(person==44)
    {
        self.img=[UIImage imageNamed:@"swami"];
        self.details=@"Swami Vivekananda Bengali: [ʃami bibekanɒnɖo] ( listen), Shāmi Bibekānondo; 12 January 1863 – 4 July 1902), born Narendranath Datta (Bengali: [nɔrend̪ro nat̪ʰ d̪ɔt̪t̪o]), was an Indian Hindu monk, a chief disciple of the 19th-century Indian mystic Ramakrishna. He was a key figure in the introduction of the Indian philosophies of Vedanta and Yoga to the Western world[4] and is credited with raising interfaith awareness, bringing Hinduism to the status of a major world religion during the late 19th century.[5] He was a major force in the revival of Hinduism in India, and contributed to the concept of nationalism in colonial India.[6] Vivekananda founded the Ramakrishna Math and the Ramakrishna Mission.[4] He is perhaps best known for his speech which began, Sisters and brothers of America ...,[7] in which he introduced Hinduism at the Parliament of the World's Religions in Chicago in 1893";
    }
}

@end

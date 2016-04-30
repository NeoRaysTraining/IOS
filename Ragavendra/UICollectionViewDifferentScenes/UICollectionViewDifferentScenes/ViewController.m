//
//  ViewController.m
//  UICollectionViewDifferentScenes
//
//  Created by test on 4/29/16.
//  Copyright © 2016 NeoRays. All rights reserved.
//

#import "ViewController.h"
#include "CollectionCell.h"
@interface ViewController ()

@property (nonatomic,strong)NSArray *differentFilms;

@property (nonatomic,strong)NSArray *differentFilmImages;

@property (nonatomic,strong)NSArray *filmDescription;


@property (nonatomic,assign)int filmCount;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.differentFilms=[[NSArray alloc]initWithObjects:@"BAHUBALI",@"FAN",@"HAPPY NEW YEAR",@"JAB TAK HAI JAAN",@"KAL HO NA HO",@"KICK",@"OM SHANTI OM",@"p.K", nil];

self.differentFilmImages=[[NSArray  alloc]initWithObjects:@"bahubali",@"fan",@"HNY",@"Jaan",@"kalnaho",@"kick", @"OM",@"P.K",nil];
 
    self.filmDescription=[[NSArray alloc]initWithObjects:@"The Beginning is a 2015 Indian epic historical fiction film directed by S. S. Rajamouli. Produced by Shobu Yarlagadda and Prasad Devineni, it is the first of two cinematic parts. The film was simultaneously made in Telugu and Tamil and dubbed into Hindi, Malayalam and French. The film stars Prabhas, Rana Daggubati, Tamannaah and Anushka Shetty in lead roles. Sathyaraj, Ramya Krishnan, Nassar, Adivi Sesh, Tanikella Bharani and Sudeep appear in supporting roles. The soundtrack and background score were composed by M. M. Keeravani while the cinematography, editing, art direction and visual effects supervision were done by K. K. Senthil Kumar, Kotagiri Venkateswara Rao, Sabu Cyril and V. Srinivas Mohan respectively.",
    @"Fan is a 2016 Indian thriller film directed by Maneesh Sharma and featuring Shah Rukh Khan in the lead role.[5][6] The film is produced by Aditya Chopra under the banner of Yash Raj Films, and tells the story of an obsessive fan of a star who looks just like the star.[7] The soundtrack album and original score are composed by Vishal–Shekhar and Andrea Guerra respectively.[8] The film was released on 15 April 2016.",
      @"Happy New Year, sometimes abbreviated as HNY is a 2014 Indian action drama film directed by Farah Khan and produced by Gauri Khan under the banner of Red Chillies Entertainment. The film has an ensemble cast, which includes Shah Rukh Khan, Deepika Padukone, Abhishek Bachchan, Boman Irani, Sonu Sood, Vivaan Shah and Jackie Shroff. The film was distributed worldwide by Yash Raj Films.[6] The film marked a third collaboration of Khan with the director; they previously worked on Main Hoon Na (2004) and Om Shanti Om (2007), the latter of which also featured Padukone as the female lead.",
       @"Jab Tak Hai Jaan (English: As Long as I Live, literally  is a 2012 Indian romantic drama film directed by Yash Chopra and written and produced by Aditya Chopra under their production banner, Yash Raj Films. It features Shah Rukh Khan, Katrina Kaif and Anushka Sharma in lead roles. The movie is the first collaboration between Khan and Kaif, and the second between Khan and Sharma (they previously featured in the 2008 film Rab Ne Bana Di Jodi).",
         @"Kal Ho Naa Ho (English: There May or May Not Be a Tomorrow), abbreviated as KHNH, is a 2003 Indian romantic drama, directed by debutante director Nikhil Advani. The film was written by Niranjan Iyengar and Karan Johar and produced by Yash Johar and Karan Johar under the Dharma Productions banner. The music of the film was composed by Shankar-Ehsaan-Loy, with lyrics written by Javed",
        @"Kick is a 2014 Indian action film produced and directed by Sajid Nadiadwala under his Nadiadwala Grandson Entertainment banner. It is an official remake of a Telugu movie Kick which was released in 2009. The film features Salman Khan, Jacqueline Fernandez and Randeep Hooda in the lead roles and Nawazuddin Siddiqui , portraying the main antagonist of the film.",
            @"Om Shanti Om is a 2007 Indian thriller romantic film co written, choreographed and directed by Farah Khan. It stars Shah Rukh Khan and debutant Deepika Padukone in the lead roles while Arjun Rampal, Shreyas Talpade, and Kirron Kher feature in supporting roles. More than forty-two well-known Hindi movie stars appear in the course of the film, including thirty of them (not including the stars of the film) in one song alone",
        @"PK is a 2014 Indian satirical science fiction comedy film.[4][5][6] The film was directed by Rajkumar Hirani, produced by Hirani and Vidhu Vinod Chopra, and written by Hirani and Abhijat Joshi.[7] The film stars Aamir Khan in the title role with Anushka Sharma, Sushant Singh Rajput, Boman Irani, Saurabh Shukla, and Sanjay Dutt in supporting roles",nil];

self.messageLabel.text=[self.differentFilms objectAtIndex:0];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.


}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.differentFilms.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
   
CollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];


cell.imagviewDisplay.image=[UIImage imageNamed:self.differentFilmImages[indexPath.row]];
    
    cell.imagviewDisplay.layer.cornerRadius=57.5;
    cell.imagviewDisplay.layer.masksToBounds=true;

    
   
self.textView.text=[self.filmDescription objectAtIndex:indexPath.row];
   
    
self.messageLabel.text=[self.differentFilms objectAtIndex:indexPath.row];
  
    

    return cell;




}






@end

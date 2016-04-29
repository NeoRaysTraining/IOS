//
//  ViewController.m
//  UICollectionView_DeviceInfo_App
//
//  Created by test on 29/04/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
@interface ViewController ()

@property (assign,nonatomic)int selectedRow;
@end

@implementation ViewController{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageName = [[NSArray alloc]initWithObjects:@"Charger",@"IcardReader",@"IComputer",@"iCPU",@"IhardDisk",@"Ikeyboard",@"Imobile",@"Imouse",@"IPenDrive",@"ISound system", nil];
    
    
    self.labelName = [[NSArray alloc]initWithObjects:@"Computer Charger",@"Card Reader",@"Computer",@"CPU",@"HardDisk",@"Key Board",@"Mobile Phone",@"Computer Mouse",@"Pen Drive",@"Sound system", nil];
    
    
    self.textValues = [[NSArray alloc]initWithObjects:@"Computer Charger : A battery charger, or recharger, is a device used to put energy into a secondary cell or rechargeable battery by forcing an electric current through it.The charging protocol depends on the size and type of the battery being charged. Some battery types have high tolerance for overcharging and can be recharged by connection to a constant voltage source or a constant current source; simple chargers of this type require manual disconnection at the end of the charge cycle, or may have a timer to cut off charging current at a fixed time. Other battery types cannot withstand long high-rate over-charging; the charger may have temperature or voltage sensing circuits and a microprocessor controller to adjust the charging current, determine the state of charge, and cut off at the end of charge.A trickle charger provides a relatively small amount of current, only enough to counteract self-discharge of a battery that is idle for a long time. Slow battery chargers may take several hours to complete a charge; high-rate chargers may restore most capacity within minutes or less than an hour, but generally require monitoring of the battery to protect it from overcharge. Electric vehicles need high-rate chargers for public access; installation of such chargers and the distribution support for them is an issue in the proposed adoption of electric cars",
                       
                       
                       @"Card Reader :  A card reader is a data input device that reads data from a card-shaped storage medium. The first were punched card readers, which read the paper or cardboard punched cards that were used during the first several decades of the computer industry to store information and programs for computer systems. Modern card readers are electronic devices that can read plastic cards embedded with either a barcode, magnetic strip, computer chip or another storage medium.A memory card reader is a device used for communication with a smart card or a memory card. A magnetic card reader is a device used to read magnetic stripe cards, such as credit cards. A business card reader is a device used to scan and electronically save printed business cards."
                       
                       
                       
                       
                       ,@"Computer : A computer is a general purpose device that can be programmed to carry out a set of arithmetic or logical operations automatically. Since a sequence of operations can be readily changed, the computer can solve more than one kind of problem.Conventionally, a computer consists of at least one processing element, typically a central processing unit (CPU), and some form of memory. The processing element carries out arithmetic and logic operations, and a sequencing and control unit can change the order of operations in response to stored information. Peripheral devices allow information to be retrieved from an external source, and the result of operations saved and retrieved.Mechanical analog computers started appearing in the first century and were later used in the medieval era for astronomical calculations. In World War II, mechanical analog computers were used for specialized military applications such as calculating torpedo aiming. During this time the first electronic digital computers were developed. Originally they were the size of a large room, consuming as much power as several hundred modern personal computers (PCs)",
                       
                       
                       @"CPU :  A central processing unit (CPU) is the electronic circuitry within a computer that carries out the instructions of a computer program by performing the basic arithmetic, logical, control and input/output (I/O) operations specified by the instructions. The term has been used in the computer industry at least since the early 1960s. Traditionally, the term CPU refers to a processor, more specifically to its processing unit and control unit (CU), distinguishing these core elements of a computer from external components such as main memory and I/O circuitry.The form, design and implementation of CPUs have changed over the course of their history, but their fundamental operation remains almost unchanged. Principal components of a CPU include the arithmetic logic unit (ALU) that performs arithmetic and logic operations, processor registers that supply operands to the ALU and store the results of ALU operations, and a control unit that fetches instructions from memory and executes them by directing the coordinated operations of the ALU, registers and other components.Most modern CPUs are microprocessors, meaning they are contained on a single integrated circuit (IC) chip. An IC that contains a CPU may also contain memory, peripheral interfaces, and other components of a computer; such integrated devices are variously called microcontrollers or systems on a chip (SoC). Some computers employ a multi-core processor, which is a single chip containing two or more CPUs called cores in that context, single chips are sometimes referred to as sockets. Array processors or vector processors have multiple processors that operate in parallel, with no unit considered central."
                       
                       
                       ,@"HardDisk  : A hard disk drive (HDD), hard disk, hard drive or fixed disk is a data storage device used for storing and retrieving digital information using one or more rigid (hard) rapidly rotating disks (platters) coated with magnetic material. The platters are paired with magnetic heads arranged on a moving actuator arm, which read and write data to the platter surfaces. Data is accessed in a random-access manner, meaning that individual blocks of data can be stored or retrieved in any order and not only sequentially. HDDs are a type of non-volatile memory, retaining stored data even when powered off.Introduced by IBM in 1956,HDDs became the dominant secondary storage device for general-purpose computers by the early 1960s. Continuously improved, HDDs have maintained this position into the modern era of servers and personal computers. More than 200 companies have produced HDD units, though most current units are manufactured by Seagate, Toshiba and Western Digital. As of 2015, HDD production (exabytes per year) and areal density are growing, although unit shipments are declining. ",
                       
                       
                       
                       
                       @"Key Board  :  In computing, a computer keyboard is a typewriter-style device which uses an arrangement of buttons or keys to act as a mechanical lever or electronic switch. Following the decline of punch cards and paper tape, interaction via teleprinter-style keyboards became the main input device for computers. A keyboard typically has characters engraved or printed on the keys and each press of a key typically corresponds to a single written symbol. However, to produce some symbols requires pressing and holding several keys simultaneously or in sequence. While most keyboard keys produce letters, numbers or signs (characters), other keys or simultaneous key presses can produce actions or execute computer commands.Despite the development of alternative input devices, such as the mouse, touchscreen, pen devices, character recognition and voice recognition, the keyboard remains the most commonly used device for direct (human) input of alphanumeric data into computers.",
                       
                       
                       @"Mobile Phone  :  A mobile phone is a telephone that can make and receive calls over a radio frequency carrier while the user is moving within a telephone service area. The radio frequency link establishes a connection to the switching systems of a mobile phone operator, which provides access to the public switched telephone network (PSTN). Most modern mobile telephone services use a cellular network architecture, and therefore mobile telephones are often also called cellular telephones or cell phones. In addition to telephony, modern mobile phones support a variety of other services, such as text messaging, MMS, email, Internet access, short-range wireless communications (infrared, Bluetooth), business applications, gaming, and photography. Mobile phones which offer these and more general computing capabilities are referred to as smartphones.",
                       
                       @"Computer Mouse  :  A computer mouse is a pointing device (hand control) that detects two-dimensional motion relative to a surface. This motion is typically translated into the motion of a pointer on a display, which allows a smooth control of the graphical user interface.Physically, a mouse consists of an object held in one's hand, with one or more buttons. Mice often also feature other elements, such as touch surfaces and wheels, which enable additional control and dimensional input.",
                       
                       
                       @"Pen Drive  :  A USB flash drive, also commonly known as a usb drive, usb stick and a variety of other names a data storage device that includes flash memory with an integrated USB interface. USB flash drives are typically removable and rewritable, and physically much smaller than an optical disc. Most weigh less than 30 grams (1.1 oz).As of January 2013, drives of up to 512 gigabytes (GB) were available. A one-terabyte (TB) drive was unveiled at the 2013 Consumer Electronics Show and became available later that year.Storage capacities as large as 2 TB are planned, with steady improvements in size and price per capacity expected. Some allow up to 100,000 write/erase cycles, depending on the exact type of memory chip used, and have a 10-year shelf storage time.USB flash drives are often used for the same purposes for which floppy disks or CDs were once used, i.e., for storage, data back-up and transfer of computer files. They are smaller, faster, have thousands of times more capacity, and are more durable and reliable because they have no moving parts. Additionally, they are immune to electromagnetic interference (unlike floppy disks), and are unharmed by surface scratches (unlike CDs). Until about 2005, most desktop and laptop computers were supplied with floppy disk drives in addition to USB ports, but floppy disk drives have become obsolete after widespread adoption of USB ports and the larger USB drive capacity compared to the 1.44 MB 3.5-inch floppy disk.",
                       
                       @"Sound system  :  Computer music is the application of computing technology in music composition, to help human composers create new music or to have computers independently create music, such as with algorithmic composition programs. It includes the theory and application of new and existing computer software technologies and basic aspects of music, such as sound synthesis, digital signal processing, sound design, sonic diffusion, acoustics, and psychoacoustics. The field of computer music can trace its roots back to the origins of electronic music, and the very first experiments and innovations with electronic instruments at the turn of the 20th century.In the 2000s, with the widespread availability of relatively affordable home computers that have a fast processing speed, and the growth of home recording using digital audio recording systems ranging from Garageband to Protools, the term is sometimes used to describe music that has been created using digital technology.", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.imageName.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    self.selectedRow = (int)indexPath.row;
    
    cell.imageView.layer.cornerRadius = 20.0;
    
    cell.imageView.layer.masksToBounds = YES;
    
         self.labelField.text = [NSString stringWithFormat:@"%@",[self.labelName objectAtIndex:self.selectedRow]];
    
    
    cell.imageView.image = [UIImage imageNamed:self.imageName[indexPath.row]];
    

    
   
      self.textField.text = [self.textValues objectAtIndex:indexPath.row];
    
    
    

    
    NSLog(@"selected row : %d",self.selectedRow);
    
    
    return cell;

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
   self.selectedRow = (int)indexPath.row;
    
    
    self.labelField.text = [NSString stringWithFormat:@"%@",[self.labelName objectAtIndex:self.selectedRow]];
    
    
    self.textField.text = [self.textValues objectAtIndex:indexPath.row];
    


}

@end

//
//  ViewController.m
//  Address Book
//
//  Created by Mahaboobsab Nadaf on 28/09/16.
//  Copyright © 2016 com.NeoRays. All rights reserved.
//

#import "ViewController.h"
@import AddressBook;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)contactTapped:(UIButton *)sender {
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusDenied ||
        ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusRestricted){
        //1
        NSLog(@"Denied");
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Cannot Add Contact"
                                                                       message:@"You must give the app permission to add the contact first."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized){
        //2
        NSLog(@"Authorized");
        [self addPetToContacts:sender];
    } else{ //ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined
        //3
        NSLog(@"Not determined");
        ABAddressBookRequestAccessWithCompletion(ABAddressBookCreateWithOptions(NULL, nil), ^(bool granted, CFErrorRef error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (!granted){
                    //4
                   
                    
                    
                    
                    
                    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Cannot Add Contact"
                                                                                   message:@"You must give the app permission to add the contact first."
                                                                            preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                          handler:^(UIAlertAction * action) {}];
                    
                    [alert addAction:defaultAction];
                    [self presentViewController:alert animated:YES completion:nil];
                    return;
                }
                //5
                [self addPetToContacts:sender];
            });
        });
    }
}



- (void)addPetToContacts: (UIButton *) petButton{
    NSString *personFirstName;
    NSString *personLastName;
    NSString *personPhoneNumber;
    NSData *petImageData;
    if (petButton.tag == 1){
        personFirstName = @"Sachin";
        personLastName = @"Tendulkar";
        personPhoneNumber = @"8792269791";
        petImageData = UIImageJPEGRepresentation([UIImage imageNamed:@"sachin.jpg"], 0.7f);
    } else if (petButton.tag == 2){
        personFirstName = @"Rahul";
        personLastName = @"Dravid";
        personPhoneNumber = @"9916559563";
        petImageData = UIImageJPEGRepresentation([UIImage imageNamed:@"rahul.jpg"], 0.7f);
    } else if (petButton.tag == 3){
        personFirstName = @"Virender";
        personLastName = @"Sehwag";
        personPhoneNumber = @"5438880123";
        petImageData = UIImageJPEGRepresentation([UIImage imageNamed:@"sehwag.jpg"], 0.7f);
    } else if (petButton.tag == 4){
        personFirstName = @"Mahendrasingh";
        personLastName = @"Dhoni";
        personPhoneNumber = @"7124779070";
        petImageData = UIImageJPEGRepresentation([UIImage imageNamed:@"dhoni.jpg"], 0.7f);
    }
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, nil);
    ABRecordRef person = ABPersonCreate();
    ABRecordSetValue(person, kABPersonFirstNameProperty, (__bridge CFStringRef)personFirstName, nil);
    ABRecordSetValue(person, kABPersonLastNameProperty, (__bridge CFStringRef)personLastName, nil);
    
    ABMutableMultiValueRef phoneNumbers = ABMultiValueCreateMutable(kABMultiStringPropertyType);
    ABMultiValueAddValueAndLabel(phoneNumbers, (__bridge CFStringRef)personPhoneNumber, kABPersonPhoneMainLabel, NULL);
    ABRecordSetValue(person, kABPersonPhoneProperty, phoneNumbers, nil);
    
    ABPersonSetImageData(person, (__bridge CFDataRef)petImageData, nil);
    ABAddressBookAddRecord(addressBookRef, person, nil);
    
    NSArray *allContacts = (__bridge NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBookRef);
    for (id record in allContacts){
        ABRecordRef thisContact = (__bridge ABRecordRef)record;
        if (CFStringCompare(ABRecordCopyCompositeName(thisContact),
                            ABRecordCopyCompositeName(person), 0) == kCFCompareEqualTo){
            //The contact already exists!
           
            
                UIAlertController* alert = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"There can only be one %@", personFirstName]
                                                                               message:nil
                                                                        preferredStyle:UIAlertControllerStyleAlert];
            
                UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                      handler:^(UIAlertAction * action) {}];
            
                [alert addAction:defaultAction];
                [self presentViewController:alert animated:YES completion:nil];
            return;
        }
    }
    
    ABAddressBookSave(addressBookRef, nil);

//    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Contact Added"
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}
@end

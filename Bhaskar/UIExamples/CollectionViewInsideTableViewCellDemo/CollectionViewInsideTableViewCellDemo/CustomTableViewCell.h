//
//  CustomTableViewCell.h
//  CollectionViewInsideTableViewCellDemo
//
//  Created by test on 12/5/16.
//  Copyright © 2016 neorays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCollectionViewCell.h"


@interface AFIndexedCollectionView : UICollectionView

@property (nonatomic, strong) NSIndexPath *indexPath;

@end
static NSString *CollectionViewCellIdentifier = @"collectionCell";

@interface CustomTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet AFIndexedCollectionView *collectionViewOutlet;


@property (strong,nonatomic) NSArray *itemArray;

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;

@end

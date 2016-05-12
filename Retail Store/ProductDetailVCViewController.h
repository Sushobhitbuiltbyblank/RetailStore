//
//  ProductDetailVCViewController.h
//  Retail Store
//
//  Created by Sushobhit_BuiltByBlank on 3/1/16.
//  Copyright © 2016 Sushobhit Jain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
@interface ProductDetailVCViewController : UIViewController
@property (strong, nonatomic) Product *product;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (assign) bool isCart;
@property (weak, nonatomic) IBOutlet UIButton *addToCardBtn;
- (IBAction)addToCard:(id)sender;

@end

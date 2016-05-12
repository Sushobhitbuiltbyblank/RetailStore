//
//  ProductDetailVCViewController.m
//  Retail Store
//
//  Created by Sushobhit_BuiltByBlank on 3/1/16.
//  Copyright © 2016 Sushobhit Jain. All rights reserved.
//

#import "ProductDetailVCViewController.h"
#import "CartController.h"
@interface ProductDetailVCViewController ()

@end

@implementation ProductDetailVCViewController
@synthesize product,priceLable,productImageView;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Product Detail";
    self.productImageView.image = [UIImage imageNamed: product.imageString];
    self.nameLable.text = product.name;
    self.priceLable.text = [NSString stringWithFormat:@"%.2f rs", product.price];
    if (self.isCart) {
        self.addToCardBtn.hidden = YES;
    }
    // Do any additional setup after loading the view.
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

- (IBAction)addToCard:(id)sender {
    [CartController saveToCart:self.product];
}
@end

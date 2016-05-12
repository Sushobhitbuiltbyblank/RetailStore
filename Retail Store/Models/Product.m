//
//  Product.m
//  Retail Store
//
//  Created by Sushobhit_BuiltByBlank on 3/1/16.
//  Copyright © 2016 Sushobhit Jain. All rights reserved.
//

#import "Product.h"

@implementation Product

-(Product *)initWith:(NSString*)name withPrice:(float)price withImageString:(NSString*)imageData withCategory:(NSString*)category{
    Product *aProduct = [[Product alloc]init];
    aProduct.name = name;
    aProduct.price = price;
    aProduct.imageString = imageData;
    aProduct.category = category;
    return aProduct;
}

@end

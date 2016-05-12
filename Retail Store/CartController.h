//
//  CartController.h
//  Retail Store
//
//  Created by Sushobhit_BuiltByBlank on 3/1/16.
//  Copyright © 2016 Sushobhit Jain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import <Realm/Realm.h>
@interface CartController : NSObject

+(void)saveToCart:(Product *)product;
+(void)deleteTocart:(Product *)product;
+(RLMResults *)getProductList;
@end

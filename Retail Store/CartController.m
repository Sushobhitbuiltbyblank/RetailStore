//
//  CartController.m
//  Retail Store
//
//  Created by Sushobhit_BuiltByBlank on 3/1/16.
//  Copyright © 2016 Sushobhit Jain. All rights reserved.
//

#import "CartController.h"
#import "PersistantDataController.h"
#import <Realm/Realm.h>
@implementation CartController

+(void)saveToCart:(Product *)product{
    
    [[PersistantDataController sharedInstance] save:product forkey:@"cardList"];
}
+(RLMResults *)getProductList
{
    RLMResults *array = [[PersistantDataController sharedInstance] getData];
    
    return array;
    
}
+(void)deleteTocart:(Product *)product
{
    [[PersistantDataController sharedInstance] delete:product];
}
@end

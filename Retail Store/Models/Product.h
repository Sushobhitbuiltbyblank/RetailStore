//
//  Product.h
//  Retail Store
//
//  Created by Sushobhit_BuiltByBlank on 3/1/16.
//  Copyright © 2016 Sushobhit Jain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
@interface Product : RLMObject
@property (nonatomic, strong) NSString *name;
@property (assign) float price;
@property (nonatomic, strong) NSString *imageString;
@property (nonatomic, strong) NSString *category;

-(Product *)initWith:(NSString*)name withPrice:(float)price withImageString:(NSString*)imageData withCategory:(NSString*)category;
@end

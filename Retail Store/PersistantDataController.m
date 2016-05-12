//
//  PersistantDataController.m
//  Retail Store
//
//  Created by Sushobhit_BuiltByBlank on 3/1/16.
//  Copyright © 2016 Sushobhit Jain. All rights reserved.
//

#import "PersistantDataController.h"
#import <Realm/Realm.h>
#import "Product.h"
@implementation PersistantDataController

+ (id)sharedInstance {
    static PersistantDataController *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(void)save:(RLMObject*)list forkey:(NSString*)key
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    // You only need to do this once (per thread)
    
    // Add to Realm with transaction
    [realm beginWriteTransaction];
    [realm addObject:list];
    [realm commitWriteTransaction];
}

-(NSArray *)getData:(NSString *)key
{
    NSArray *data = (NSArray *)[[NSUserDefaults standardUserDefaults] valueForKey:key];
    return data;
}

-(RLMResults *)getData
{
    RLMResults<Product *> *products = [Product allObjects];
    return products;
}

-(void)delete:(RLMObject *)data
{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm deleteObject:data];
    [realm commitWriteTransaction];
}
@end

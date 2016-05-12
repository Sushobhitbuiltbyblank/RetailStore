//
//  PersistantDataController.h
//  Retail Store
//
//  Created by Sushobhit_BuiltByBlank on 3/1/16.
//  Copyright © 2016 Sushobhit Jain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
@interface PersistantDataController : NSObject
+ (id)sharedInstance;
-(void)save:(RLMObject*)list forkey:(NSString*)key;
-(NSArray *)getData:(NSString *)key;
-(RLMResults *)getData;
-(void)delete:(RLMObject *)data;
@end

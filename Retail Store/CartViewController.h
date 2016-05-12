//
//  CartViewController.h
//  Retail Store
//
//  Created by Sushobhit_BuiltByBlank on 3/1/16.
//  Copyright © 2016 Sushobhit Jain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
@interface CartViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *cartListTV;
@property (weak, nonatomic) IBOutlet UILabel *totalPrice;
-(float)getTotal:(NSMutableArray *)data;
-(void)addData:(RLMResults *)data;
@end

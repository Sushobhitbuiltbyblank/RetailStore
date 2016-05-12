//
//  CartViewController.m
//  Retail Store
//
//  Created by Sushobhit_BuiltByBlank on 3/1/16.
//  Copyright © 2016 Sushobhit Jain. All rights reserved.
//

#import "CartViewController.h"
#import "Product.h"
#import "CartController.h"
#import "ProductDetailVCViewController.h"

@interface CartViewController () <UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray *productList;
}
@end

@implementation CartViewController
@synthesize cartListTV;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Cart";
    RLMResults *products = [CartController getProductList];
    [self addData:products];
    self.totalPrice.text = [NSString stringWithFormat:@"total = %.2f",[self getTotal:productList]];
    // Do any additional setup after loading the view.
}
-(void)addData:(RLMResults *)data
{
    productList = [[NSMutableArray alloc]init];
    for (int i=0; i<data.count; i++) {
        Product *product = [data objectAtIndex:i];
        [productList addObject:product];
    }
}
-(float)getTotal:(NSMutableArray *)data
{
    float total = 0;
    for (int i=0; i<data.count; i++) {
        Product *product = [data objectAtIndex:i];
        total += product.price;
    }
    return total;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - TableView Data Source method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [productList count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"productCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    Product *product  = (Product *)[productList objectAtIndex:indexPath.row];
    cell.textLabel.text = product.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f rs", product.price];
    return cell;
}

#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //     Get the new view controller using [segue destinationViewController].
    //     Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.cartListTV indexPathForCell:sender];
        ProductDetailVCViewController *destViewController = segue.destinationViewController;
        destViewController.isCart = YES;
        destViewController.product = (Product *)[productList objectAtIndex:indexPath.row];
    }
}

#pragma mark - delete from cart
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //remove the deleted object from your data source.
        //If your data source is an NSMutableArray, do this
        [CartController deleteTocart:[productList objectAtIndex:indexPath.row]];
        [productList removeObjectAtIndex:indexPath.row];
        self.totalPrice.text = [NSString stringWithFormat:@"total = %.2f",[self getTotal:productList]];
        [tableView reloadData]; // tell table to refresh now
    }
}
@end

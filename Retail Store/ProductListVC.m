//
//  ProductListVC.m
//  Retail Store
//
//  Created by Sushobhit_BuiltByBlank on 3/1/16.
//  Copyright © 2016 Sushobhit Jain. All rights reserved.
//

#import "ProductListVC.h"
#import "Product.h"
#import "ProductDetailVCViewController.h"
#import "ProductTableViewCell.h"
@interface ProductListVC() <UITableViewDataSource,UITableViewDelegate>
{
    
    NSArray *categories;
    NSArray *products;
}
@end

@implementation ProductListVC

@synthesize productListTV;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Products";
    //hard coded value of list of product.
    Product *microwaveOven = [[Product alloc]initWith:@"Microwave oven" withPrice:2000.0 withImageString:@"microwave.jpg" withCategory:@"Electronics"];
    Product *television = [[Product alloc]initWith:@"Television" withPrice:5000.0 withImageString:@"television.png" withCategory:@"Electronics"];
    Product *vacuumCleaner = [[Product alloc]initWith:@"Vacuum Cleaner" withPrice:4000.0 withImageString:@"Vacuum.jpg" withCategory:@"Electronics"];
    Product *table = [[Product alloc]initWith:@"Table" withPrice:1000.0 withImageString:@"table.JPG" withCategory:@"Furniture"];
    Product *chair = [[Product alloc]initWith:@"Chair" withPrice:500.0 withImageString:@"chair.JPG" withCategory:@"Furniture"];
    Product *almirah = [[Product alloc]initWith:@"Almirah" withPrice:1500.0 withImageString:@"almirah.jpg" withCategory:@"Furniture"];
    categories = @[@"Electronics",@"Furniture"];
    products = @[@[microwaveOven,television,vacuumCleaner],@[table,chair,almirah]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView Data Source method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [categories count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [[products objectAtIndex:section] count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"productCell";
    
   ProductTableViewCell *cell = (ProductTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[ProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    Product *product  = (Product *)[[products objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.nameLable.text = product.name;
    cell.productImageView.image = [UIImage imageNamed:product.imageString];
    cell.priceLable.text = [NSString stringWithFormat:@"%.2f rs", product.price];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    // The header for the section is the region name -- get this from the region at the section index.
    
//    Region *region = [regions objectAtIndex:section];
//    
//    return [region name];
    return [categories objectAtIndex:section];
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
        NSIndexPath *indexPath = [self.productListTV indexPathForCell:sender];
        ProductDetailVCViewController *destViewController = segue.destinationViewController;
        destViewController.isCart = NO;
        destViewController.product = (Product *)[[products objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
}

@end

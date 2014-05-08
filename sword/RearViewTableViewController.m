//
//  RearViewController.m
//  sword
//
//  Created by Verdi Ergun on 5/6/14.
//  Copyright (c) 2014 Verdi Ergun. All rights reserved.
//

#import "RearViewTableViewController.h"
#import "SWRevealViewController.h"
#import "RearViewDetailTableViewController.h"

@interface RearViewTableViewController () <SWRevealViewControllerDelegate>

@end



@implementation RearViewTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [self.tableView setSeparatorInset:UIEdgeInsetsZero];
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// tableview
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [self.cells count];
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"didClickActionItem" object:nil];
        
    }
    if (indexPath.row == 5) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"didClickActionGo" object:nil];
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int num = indexPath.row;
    UITableViewCell *cell = [UITableViewCell new];
    UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(15,15, 24, 24)];
    cell.indentationLevel = 6;
    
    
    switch (num) {
        case 0:
            cell.textLabel.text = @"Attack";
            cell.backgroundColor = [UIColor orangeColor];
            imv.image=[UIImage imageNamed:@"actionAttack"];
            break;
        case 1:
            cell.textLabel.text = @"Defend";
            cell.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:.7f];

            imv.image=[UIImage imageNamed:@"actionDefend"];
            break;
        case 2:
            cell.textLabel.text = @"Magic";
            cell.backgroundColor = [UIColor colorWithRed:.5 green:.5 blue:1 alpha:.6f];
            imv.image=[UIImage imageNamed:@"actionMagic"];
            break;
        case 3:
            cell.textLabel.text = @"Inventory";
            cell.backgroundColor = [UIColor colorWithRed:1 green:.5 blue:.7 alpha:.8f];
            imv.image=[UIImage imageNamed:@"actionInventory"];
            break;
        case 4:
            cell.textLabel.text = @"Try to run";
            cell.backgroundColor = [UIColor colorWithRed:.5 green:.5 blue:.3 alpha:1.0f];
            imv.image=[UIImage imageNamed:@"actionRun"];
            break;
        case 5:
            cell.textLabel.text = @"Go";
            break;
    }
    [cell.contentView addSubview:imv];
    return cell;
}

@end

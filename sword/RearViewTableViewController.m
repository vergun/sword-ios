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
    
    // Listen for click event
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didClickActionItem:) name:@"didClickActionItem" object:nil];
    // addNotification to pop to root view controller
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didWantToPopToRootViewControllerAfterDelay) name:@"didWantToPopToRootViewControllerAfterDelay" object:nil];
}

- (void) didWantToPopToRootViewController
{
    
    [self.navigationController popToRootViewControllerAnimated:NO];
}


- (void) didWantToPopToRootViewControllerAfterDelay
{
    // TODO: Change to animate back first, then slide over
    [NSTimer scheduledTimerWithTimeInterval:.08 target:self selector:@selector(didWantToPopToRootViewController) userInfo:nil repeats:NO];
}

- (void) didClickActionItem:(NSNotification *)notification {
    NSLog(@"%@", notification.userInfo);
    NSDictionary* userInfo = notification.userInfo;
    RearViewDetailTableViewController *detailTableViewController = [[RearViewDetailTableViewController alloc] initWithStyle:UITableViewStylePlain];
    detailTableViewController.tappedParentRowIndex =
    
//    TODO stopped here, listen for userInfo and pass indexPathRow from parent table view to child table view
//        then use that indexpath row to select the correct element from the actionmenu array
//        then use that element to select the right submenu from the submenu dictionary
//    int messageTotal = [[userInfo objectForKey:@"total"] intValue];
//    NSLog (@"Successfully received test notification! %i", messageTotal);
//}

    [self.navigationController pushViewController:detailTableViewController  animated:YES];
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
        NSMutableDictionary* userInfo = [NSMutableDictionary dictionary];
        [userInfo setObject:[NSNumber numberWithInt:indexPath.row] forKey:@"indexPath"];X
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"didClickActionItem" object:nil userInfo:userInfo];
        
    }
    if (indexPath.row == 5) {
        [self.navigationController popToRootViewControllerAnimated:YES];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"didClickActionGo" object:nil];
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int num = indexPath.row;
    UITableViewCell *cell = [UITableViewCell new];
    UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(15,15, 24, 24)];
    cell.indentationLevel = 6;
    NSArray *actionMenu = [[SwordAPI sharedInstance ] getActionMenu];
    NSMutableArray *actionMenuArray = [[NSMutableArray alloc] initWithArray:actionMenu];
    
    switch (num) {
        case 0:
            cell.textLabel.text = [actionMenuArray objectAtIndex:0];
            cell.backgroundColor = [UIColor orangeColor];
            imv.image=[UIImage imageNamed:@"actionAttack"];
            break;
        case 1:
            cell.textLabel.text = [actionMenuArray objectAtIndex:1];
            cell.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:.7f];

            imv.image=[UIImage imageNamed:@"actionDefend"];
            break;
        case 2:
            cell.textLabel.text = [actionMenuArray objectAtIndex:2];
            cell.backgroundColor = [UIColor colorWithRed:.5 green:.5 blue:1 alpha:.6f];
            imv.image=[UIImage imageNamed:@"actionMagic"];
            break;
        case 3:
            cell.textLabel.text = [actionMenuArray objectAtIndex:3];
            cell.backgroundColor = [UIColor colorWithRed:1 green:.5 blue:.7 alpha:.8f];
            imv.image=[UIImage imageNamed:@"actionInventory"];
            break;
        case 4:
            cell.textLabel.text = [actionMenuArray objectAtIndex:4];
            cell.backgroundColor = [UIColor colorWithRed:.5 green:.5 blue:.3 alpha:1.0f];
            imv.image=[UIImage imageNamed:@"actionRun"];
            break;
        case 5:
            cell.textLabel.text = [actionMenuArray objectAtIndex:5];
            break;
    }
    [cell.contentView addSubview:imv];
    return cell;
}

@end

//
//  RootViewController.m
//  LOL
//
//  Created by MagicStudio on 12-9-15.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "HeroDetailViewController.h"

@implementation RootViewController

- (void)createHeroData
{
    NSMutableArray *demaxiyaHeros;
    NSMutableArray *nuokesasiHeros;
    
    heroSections = [[NSMutableArray alloc] initWithObjects:@"德 玛 西 亚",@"诺 克 萨 斯", nil];
    demaxiyaHeros = [[NSMutableArray alloc] init];
    nuokesasiHeros = [[NSMutableArray alloc] init];
    
    [demaxiyaHeros addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"盖伦",@"name",@"gailun.jpg",@"picture",@"http://games.qq.com/zt2011/lolchampions/garen.htm",@"url", nil]];
    [demaxiyaHeros addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"蛮王",@"name",@"manwang.jpg",@"picture",@"http://games.qq.com/zt2011/lolchampions/tryndamere.htm",@"url", nil]];
    [demaxiyaHeros addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"易大师",@"name",@"jiansheng.jpg",@"picture",@"http://games.qq.com/zt2011/lolchampions/yi.htm",@"url", nil]];
    [demaxiyaHeros addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"赵信",@"name",@"debang.jpg",@"picture",@"http://games.qq.com/zt2011/lolchampions/xinzhao.htm",@"url", nil]];
    
    [nuokesasiHeros addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"卡特琳娜",@"name",@"kate.jpg",@"picture",@"http://games.qq.com/zt2011/lolchampions/katarina.htm",@"url", nil]];
    [nuokesasiHeros addObject:[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"鬼术妖姬",@"name",@"guishu.jpg",@"picture",@"http://games.qq.com/zt2011/lolchampions/leblanc.htm",@"url", nil]];
    
    heroData = [[NSMutableArray alloc] initWithObjects:demaxiyaHeros,nuokesasiHeros, nil];
    
    [demaxiyaHeros release];
    [nuokesasiHeros release];
}

- (void)viewDidLoad
{
    [self createHeroData];
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [heroSections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[heroData objectAtIndex:section] count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    // Configure the cell.
    [[cell textLabel] setText:[[[heroData objectAtIndex:indexPath.section] objectAtIndex: indexPath.row] objectForKey:@"name"]];
    [[cell imageView] setImage:[UIImage imageNamed:[[[heroData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]objectForKey:@"picture"]]];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [heroSections objectAtIndex:section];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HeroDetailViewController *heroDetail = [[HeroDetailViewController alloc] initWithNibName:@"HeroDetailViewController" bundle:nil];
    
    heroDetail.detailURL = [[NSURL alloc] initWithString:[[[heroData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"url"]];
    heroDetail.title = [[[heroData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"name"];
    [self.navigationController pushViewController:heroDetail animated:YES];
    [heroDetail release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [heroData release];
    [heroSections release];
    [super dealloc];
}

@end

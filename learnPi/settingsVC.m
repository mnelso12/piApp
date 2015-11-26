//
//  settingsVC.m
//  learnPi
//
//  Created by MadelynNelson on 11/4/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import "settingsVC.h"
#import "colors.h"

@implementation settingsVC

CGFloat screenWidth3;
CGFloat screenHeight3;
NSArray *arr;
NSMutableArray *colorArr;

UITableView *tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth3 = screenRect.size.width;
    screenHeight3 = screenRect.size.height;
    
    colors *colorInst = [[colors alloc] init];
    
    arr = [[NSArray alloc] initWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @".", nil];
    colorArr = [[NSMutableArray alloc] initWithObjects:colorInst.zeroColor, colorInst.oneColor, colorInst.twoColor, colorInst.threeColor, colorInst.fourColor, colorInst.fiveColor, colorInst.sixColor, colorInst.sevenColor, colorInst.eightColor, colorInst.nineColor, colorInst.dotColor, nil];

    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(screenWidth3*2/3, 0, screenWidth3/3, screenHeight3)];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    
    [self.view addSubview:tableView];
    //self.view.backgroundColor = [UIColor blackColor];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    colors *colorInst = [[colors alloc] init];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell == nil) {
        
        /*
         *   Actually create a new cell (with an identifier so that it can be dequeued).
         */
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        
    }
    cell.textLabel.text = [arr objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Verdana" size:40];
    cell.textLabel.textColor = [colorArr objectAtIndex:indexPath.row];
    cell.backgroundColor = colorInst.playBackgroundColor;
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    
    cell.textLabel.highlightedTextColor = colorInst.playBackgroundColor;
    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [colorArr objectAtIndex:indexPath.row];
    cell.selectedBackgroundView = backgroundView;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end

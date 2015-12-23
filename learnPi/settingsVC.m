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

    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(screenWidth3*4/5, 0, screenWidth3/5, screenHeight3)];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:tableView];
    self.view.backgroundColor = [UIColor blackColor];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self colorPicker];
}

- (void)colorPicker
{
    int num = 100;
    for (int count=0; count<(num); count++)
    {
        
        UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(count*(200/num), 0, (200)/num, 200)];
        
        // color picker stuff
        UITapGestureRecognizer *singleFingerTap =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(handleSingleTap:)];
        [temp addGestureRecognizer:singleFingerTap];
        
        temp.tag = count;
        NSLog(@"temp tag = %i", temp.tag);
        UIColor *thisColor = [[UIColor alloc] initWithRed:120/255.0f green:((255/num)*count)/255.0f blue:0/255.0f alpha:1.0f];
        temp.backgroundColor = thisColor;
        
        [self.view addSubview:temp];
    }
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    int onePressed = recognizer.view.tag;
    NSLog(@"one pressed = %i", onePressed);
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
    cell.textLabel.font = [UIFont fontWithName:@"Verdana" size:60];
    cell.textLabel.textColor = [colorArr objectAtIndex:indexPath.row];
    cell.backgroundColor = colorInst.playBackgroundColor;
    cell.textLabel.textAlignment = NSTextAlignmentCenter; // why doesn't this work????
    
    cell.textLabel.highlightedTextColor = colorInst.playBackgroundColor;
    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [colorArr objectAtIndex:indexPath.row];
    cell.selectedBackgroundView = backgroundView;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end

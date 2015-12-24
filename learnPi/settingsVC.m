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
UIView *selectedColorView;
int num = 40; // for color picker, the bigger the slower/smoother the color picker boxes
int width = 250; // height and width of the rainbow square for color picker
CGFloat hue, brightness, saturation;



UITableView *tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth3 = screenRect.size.width;
    screenHeight3 = screenRect.size.height;
    
    selectedColorView = [[UIView alloc] initWithFrame:CGRectMake(250,50,30,30)]; // going to get rid of this entire view soon
    
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
    int tag = 0;
    for (int count=0; count<num; count++)
    {
        for (int j=0; j<num; j++)
        {
            UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(200+count*(width/num), 30+(j*(width/num)), width/num, width/num)];
            
            UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                              action:@selector(handleSingleTap:)];
            [temp addGestureRecognizer:singleFingerTap];
            temp.tag = tag;
            
            UIColor *thisColor = [[UIColor alloc] initWithHue:((360/num)*count)/360.0f saturation:1. brightness:(.01*(100/num)*j) alpha:1];
            temp.backgroundColor = thisColor;
        
            [self.view addSubview:temp];
            tag++;
        }
    }
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    int tag = recognizer.view.tag;
    
    brightness = tag%num;
    hue = tag/num;
    
    selectedColorView.backgroundColor = [UIColor colorWithHue:((360/num)*hue)/360.0f saturation:1. brightness:(.01*(100/num)*brightness) alpha:1.];
    [self.view addSubview:selectedColorView];
    [self grayScale];
}

- (void)grayScale
{
    for (int i=0; i<num; i++)
    {
        NSLog(@"%f", 1./num);
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(200+i*(width/num), 280, width/num, width/num+25)];
        UIColor *thisColor = [UIColor colorWithHue:((360/num)*hue)/360.0f saturation:(1./num*i) brightness:(.01*(100/num)*brightness) alpha:1.];
        v.backgroundColor = thisColor;
        [self.view addSubview:v];
    }
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

//
//  settingsVC.m
//  learnPi
//
//  Created by MadelynNelson on 11/4/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "settingsVC.h"
#import "colors.h"

@implementation settingsVC

NSMutableDictionary *colorsDict;
CGFloat screenWidth3;
CGFloat screenHeight3;
NSArray *arr; // array of numbers
NSMutableArray *colorArr; // colors of each number
UIView *selectedColorView;
UILabel *selectedNumLabel;
NSString *selectedNum;

int num = 27; // for color picker, the bigger the slower/smoother the color picker boxes
int width = 250; // height and width of the rainbow square for color picker
CGFloat hue, brightness, saturation;

UITableView *tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
     NSLog(@"in settings VC");
    
    // if colorsDict is in user defaults then use that copy
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"ColorsDict"])
    {
        NSDictionary *tempColorsDict2 = [[NSDictionary alloc] init];
        tempColorsDict2 = [[NSUserDefaults standardUserDefaults] objectForKey:@"ColorsDict"];
        colorsDict = [tempColorsDict2 mutableCopy];
    }
    else // if colorsDict isn't in defaults (first time in app), then use this one instead
    {
        // colorsDict can ONLY take decimal values for the objects, not "140.0f/255.0f" form because that cannot be typedefed into a float
        colorsDict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                  @".1234", @"zeroR", @".213", @"zeroB", @".982", @"zeroG",
                  @".14", @"oneR", @".99", @"oneB", @".6", @"oneG",
                  @".5", @"twoR", @".2", @"twoB", @".4", @"twoG",
                  @"0.", @"threeR", @".1", @"threeB", @".4", @"threeG",
                  @"0.", @"fourR", @".9", @"fourB", @".312", @"fourG",
                  @".12", @"fiveR", @".9", @"fiveB", @".23", @"fiveG",
                  @".2", @"sixR", @".4", @"sixB", @".1", @"sixG",
                  @".1", @"sevenR", @".1", @"sevenB", @".4", @"sevenG",
                  @".8", @"eightR", @".1", @"eightB", @".4", @"eightG",
                  @".2917", @"nineR", @".123", @"nineB", @".13", @"nineG",
                  @".324", @"dotR", @".2398", @"dotB", @".13", @"dotG",
                  nil];
    }
    
    
    
    saturation = 26; // so selected num label color isnt gray to begin with
    
    
    // colors update button stuff, doesnt work yet
    //self.updateColorsButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 250, 100, 100)];
    
    self.saveColorButton.titleLabel.textColor = [UIColor whiteColor];
    self.saveColorButton.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.saveColorButton];
    
    
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth3 = screenRect.size.width;
    screenHeight3 = screenRect.size.height;
    
    selectedColorView = [[UIView alloc] initWithFrame:CGRectMake(250,50,30,30)]; // going to get rid of this entire view soon
    
    
    // initiate number label
    selectedNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 100, 100)]; // find better UI spot for this label
    selectedNumLabel.text = @"";
    selectedNumLabel.textColor = [UIColor whiteColor];
    selectedNumLabel.font = [UIFont fontWithName:@"Verdana" size:120];
    [self.view addSubview:selectedNumLabel];
    
    arr = [[NSArray alloc] initWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @".", nil];

    colorArr = [[NSMutableArray alloc] initWithObjects:
                [UIColor colorWithRed:[[colorsDict objectForKey:@"zeroR"] floatValue] green:[[colorsDict objectForKey:@"zeroG"] floatValue] blue:[[colorsDict objectForKey:@"zeroB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict objectForKey:@"oneR"] floatValue] green:[[colorsDict objectForKey:@"oneG"] floatValue] blue:[[colorsDict objectForKey:@"oneB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict objectForKey:@"twoR"] floatValue] green:[[colorsDict objectForKey:@"twoG"] floatValue] blue:[[colorsDict objectForKey:@"twoB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict objectForKey:@"threeR"] floatValue] green:[[colorsDict objectForKey:@"threeG"] floatValue] blue:[[colorsDict objectForKey:@"threeB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict objectForKey:@"fourR"] floatValue] green:[[colorsDict objectForKey:@"fourG"] floatValue] blue:[[colorsDict objectForKey:@"fourB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict objectForKey:@"fiveR"] floatValue] green:[[colorsDict objectForKey:@"fiveG"] floatValue] blue:[[colorsDict objectForKey:@"fiveB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict objectForKey:@"sixR"] floatValue] green:[[colorsDict objectForKey:@"sixG"] floatValue] blue:[[colorsDict objectForKey:@"sixB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict objectForKey:@"sevenR"] floatValue] green:[[colorsDict objectForKey:@"sevenG"] floatValue] blue:[[colorsDict objectForKey:@"sevenB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict objectForKey:@"eightR"] floatValue] green:[[colorsDict objectForKey:@"eightG"] floatValue] blue:[[colorsDict objectForKey:@"eightB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict objectForKey:@"nineR"] floatValue] green:[[colorsDict objectForKey:@"nineG"] floatValue] blue:[[colorsDict objectForKey:@"nineB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict objectForKey:@"dotR"] floatValue] green:[[colorsDict objectForKey:@"dotG"] floatValue] blue:[[colorsDict objectForKey:@"dotB"] floatValue] alpha:1.0f],
                nil];
        
    //NSLog(@"printing colors arr: %@", [colorArr description]);
    //NSLog(@"colors dict: %@", [colorsDict description]);

    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(screenWidth3*4/5, 0, screenWidth3/5, screenHeight3)];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:tableView];
    self.view.backgroundColor = [UIColor blackColor];
    // Do any additional setup after loading the view, typically from a nib.
    
    // these are here so the grayscale starts out as red
    hue = 39.;
    brightness = 39.;
    [self colorPicker];
    [self grayScale];
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
    //UIView *view = recognizer.view;
    
    //NSLog(@"tag: %lu", view.tag);
    
    int tag = recognizer.view.tag;
    
    if (tag < num*num) // selected a color in the rainbow square
    {
        brightness = tag%num;
        hue = tag/num;
        
        saturation = 26; // resets selected saturation to that pictured in the rainbow square
        //NSLog(@"brightness: %f, hue: %f", brightness, hue);
    
        //selectedColorView.backgroundColor = [UIColor colorWithHue:(1./num)*hue saturation:1. brightness:(1./num)*brightness alpha:1.];
        //[self.view addSubview:selectedColorView];
        
        // now do the gray scale accordingly
        [self grayScale];
    }
    else if (tag < (num*num)+num) // selected a color in the saturation line
    {
        saturation = (tag-num*num);
        //selectedColorView.backgroundColor = [UIColor colorWithHue:(1./num)*hue saturation:(1./num)*saturation brightness:(1./num)*brightness alpha:1.];
        //[self.view addSubview:selectedColorView];
    }
    
    [self updateSelectedNumLabel];
}

- (void)updateSelectedNumLabel
{
    //NSLog(@"brightness: %f, hue: %f, saturation: %f", brightness, hue, saturation);
    selectedNumLabel.text = selectedNum;
    selectedNumLabel.textColor = [UIColor colorWithHue:(1./num)*hue saturation:(1./num)*saturation brightness:(1./num)*brightness alpha:1.];
    [self.view addSubview:selectedNumLabel];
}

- (void)grayScale
{
    int tag = num*num; // start where the rainbow box left off
    for (int i=0; i<num; i++)
    {
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(200+i*(width/num), 280, width/num, width/num+25)];
        UIColor *thisColor = [UIColor colorWithHue:(1./num)*hue saturation:(1./num)*i brightness:(1./num)*brightness alpha:1.];
        v.backgroundColor = thisColor;
        
        UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                
                                                                                          action:@selector(handleSingleTap:)];
        [v addGestureRecognizer:singleFingerTap];
        v.tag = tag;
        
        [self.view addSubview:v];
        tag++;
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
    //selectedNum = [NSString stringWithFormat:@"%li", (long)indexPath.row];
    selectedNum = [NSString stringWithFormat:@"%@", [arr objectAtIndex:indexPath.row]];
    [self updateSelectedNumLabel];
    
    //UIColor *selectedColor = [[UIColor alloc] initWithHue:(1./num)*hue saturation:(1./num)*saturation brightness:(1./num)*brightness alpha:1.];
    
}


- (IBAction)saveColorButtonPress:(id)sender // for updating that one specific number/color in the table
{
    // update color array
    [colorArr replaceObjectAtIndex:[arr indexOfObject:selectedNum] withObject:[UIColor colorWithHue:(1./num)*hue saturation:(1./num)*saturation brightness:(1./num)*brightness alpha:1.]];

    // update color dict
    UIColor *colorToChange = [UIColor colorWithHue:(1./num)*hue saturation:(1./num)*saturation brightness:(1./num)*brightness alpha:1.];
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha =0.0;
    [colorToChange getRed:&red green:&green blue:&blue alpha:&alpha];
    NSString *colorR = [NSString stringWithFormat:@"%f",red];
    NSString *colorG = [NSString stringWithFormat:@"%f",green];
    NSString *colorB = [NSString stringWithFormat:@"%f",blue];
    
    // find key in colorsDictfor this selectednum
    //NSLog(@"selected num = %@", selectedNum);
    NSString *wordVersionOfSelectedNum;
    if ([selectedNum isEqualToString:@"0"])
    {
        wordVersionOfSelectedNum = @"zero";
    }
    else if ([selectedNum isEqualToString:@"1"])
    {
        wordVersionOfSelectedNum = @"one";
    }
    else if ([selectedNum isEqualToString:@"2"])
    {
        wordVersionOfSelectedNum = @"two";
    }
    else if ([selectedNum isEqualToString:@"3"])
    {
        wordVersionOfSelectedNum = @"three";
    }
    else if ([selectedNum isEqualToString:@"4"])
    {
        wordVersionOfSelectedNum = @"four";
    }
    else if ([selectedNum isEqualToString:@"5"])
    {
        wordVersionOfSelectedNum = @"five";
    }
    else if ([selectedNum isEqualToString:@"6"])
    {
        wordVersionOfSelectedNum = @"six";
    }
    else if ([selectedNum isEqualToString:@"7"])
    {
        wordVersionOfSelectedNum = @"seven";
    }
    else if ([selectedNum isEqualToString:@"8"])
    {
        wordVersionOfSelectedNum = @"eight";
    }
    else if ([selectedNum isEqualToString:@"9"])
    {
        wordVersionOfSelectedNum = @"nine";
    }
    else if ([selectedNum isEqualToString:@"."])
    {
        wordVersionOfSelectedNum = @"dot";
    }
    else
    {
        NSLog(@"error here!");
    }

    
    [colorsDict setObject:colorR forKey:[NSString stringWithFormat:@"%@%@",wordVersionOfSelectedNum, @"R"]];
    [colorsDict setObject:colorG forKey:[NSString stringWithFormat:@"%@%@",wordVersionOfSelectedNum, @"G"]];
    [colorsDict setObject:colorB forKey:[NSString stringWithFormat:@"%@%@",wordVersionOfSelectedNum, @"B"]];
    
    // because defaults can only store non-mutable types
    NSDictionary *tempColorsDict = [NSDictionary dictionaryWithDictionary:colorsDict];
    
    [[NSUserDefaults standardUserDefaults] setObject:tempColorsDict forKey:@"ColorsDict"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    // reload table with new colors
    [tableView reloadData];
}
@end
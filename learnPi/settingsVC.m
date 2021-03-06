//
//  settingsVC.m
//  learnPi
//
//  Created by MadelynNelson on 11/4/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "settingsVC.h"

@implementation settingsVC

NSMutableDictionary *colorsDict;
CGFloat screenWidth3;
CGFloat screenHeight3;
NSArray *arr; // array of numbers
NSMutableArray *colorArr; // colors of each number
UIView *selectedColorView;
UILabel *selectedNumLabel;
NSString *selectedNum;

UIColor *back1C;
UIColor *back2C;
UIColor *back3C;

//CGFloat sw;
//CGFloat sh;
int num = 27; // for color picker, the bigger the slower/smoother the color picker boxes
int width = 250; // height and width of the rainbow square for color picker
CGFloat hue, brightness, saturation;

UITableView *tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth3 = screenRect.size.width;
    screenHeight3 = screenRect.size.height;
    
    if (screenWidth3 < 568.0) // is iPhone 4 or less
    {
        width = 170;
        selectedNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 37, 100, 100)]; // find better UI spot for this label
        self.saveColorButton = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth3*.5-13, screenHeight3-55, width, 40)];
        self.learnInGroupsLabel = [[UILabel alloc] initWithFrame:CGRectMake(15,-10,130,200)];
        self.groupsTextField = [[UITextField alloc] initWithFrame:CGRectMake(64, 112, 50, 30)];
        self.backgroundLabel = [[UILabel alloc] initWithFrame:CGRectMake(15,screenHeight3*.35,170,200)];
        self.back1Button = [[UIButton alloc] initWithFrame:CGRectMake(20, screenHeight3*.35+160, 38, 30)];
        self.back2Button = [[UIButton alloc] initWithFrame:CGRectMake(20+38, screenHeight3*.35+160, 38, 30)];
        self.back3Button = [[UIButton alloc] initWithFrame:CGRectMake(20+38*2, screenHeight3*.35+160, 38, 30)];

    }
    else if (screenWidth3 == 568.0) // is iPhone 5
    {
        width = 200;
        selectedNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(185, 55, 100, 100)]; // find better UI spot for this label
        self.saveColorButton = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth3*.5-120, screenHeight3*.6+25, 100, 90)];
        self.learnInGroupsLabel = [[UILabel alloc] initWithFrame:CGRectMake(15,-10,130,200)];
        self.groupsTextField = [[UITextField alloc] initWithFrame:CGRectMake(64, 112, 53, 30)];
        self.backgroundLabel = [[UILabel alloc] initWithFrame:CGRectMake(15,screenHeight3*.35,170,200)];
        self.back1Button = [[UIButton alloc] initWithFrame:CGRectMake(20, screenHeight3*.35+160, 38, 30)];
        self.back2Button = [[UIButton alloc] initWithFrame:CGRectMake(20+38, screenHeight3*.35+160, 38, 30)];
         self.back3Button = [[UIButton alloc] initWithFrame:CGRectMake(20+38*2, screenHeight3*.35+160, 38, 30)];

    }
    else if (screenWidth3 == 667.0) // is iPhone 6
    {
       width = 250;
        selectedNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 90, 100, 100)]; // find better UI spot for this label
        self.saveColorButton = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth3*.5-140, screenHeight3*.6+20, 110, 95)];
        self.learnInGroupsLabel = [[UILabel alloc] initWithFrame:CGRectMake(15,0,130,200)];
        self.groupsTextField = [[UITextField alloc] initWithFrame:CGRectMake(64, 122, 53, 30)];
        self.backgroundLabel = [[UILabel alloc] initWithFrame:CGRectMake(15,screenHeight3*.4,170,200)];
        self.back1Button = [[UIButton alloc] initWithFrame:CGRectMake(20, screenHeight3*.4+160, 38, 30)];
        self.back2Button = [[UIButton alloc] initWithFrame:CGRectMake(20+38, screenHeight3*.4+160, 38, 30)];
        self.back3Button = [[UIButton alloc] initWithFrame:CGRectMake(20+38*2, screenHeight3*.4+160, 38, 30)];
    }
    else if (screenWidth3 == 736.0) // is iPhone 6+, WHAT ABOUT IPHONE 7??!???!
    {
        width = 270;
        selectedNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth3*.5-170+40, 90, 100, 100)]; // find better UI spot for this label
        self.saveColorButton = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth3*.5-170, screenHeight3*.6, 138, 114)];
        self.learnInGroupsLabel = [[UILabel alloc] initWithFrame:CGRectMake(15,0,130,200)];
        self.groupsTextField = [[UITextField alloc] initWithFrame:CGRectMake(64, 122, 48, 30)];
        self.backgroundLabel = [[UILabel alloc] initWithFrame:CGRectMake(15,screenHeight3*.4,170,200)];
        self.back1Button = [[UIButton alloc] initWithFrame:CGRectMake(20, screenHeight3*.4+160, 38, 30)];
        self.back2Button = [[UIButton alloc] initWithFrame:CGRectMake(20+38, screenHeight3*.4+160, 38, 30)];
        self.back3Button = [[UIButton alloc] initWithFrame:CGRectMake(20+38*2, screenHeight3*.4+160, 38, 30)];
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) // is iPad
    {
        width = 270;
       selectedNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 90, 100, 100)]; // find better UI spot for this label
        self.saveColorButton = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth3*.5-170, screenHeight3*.6, 138, 114)];
        self.learnInGroupsLabel = [[UILabel alloc] initWithFrame:CGRectMake(15,0,130,200)];
        self.groupsTextField = [[UITextField alloc] initWithFrame:CGRectMake(64, 122, 48, 30)];
        self.backgroundLabel = [[UILabel alloc] initWithFrame:CGRectMake(15,screenHeight3*.4,170,200)];
        self.back1Button = [[UIButton alloc] initWithFrame:CGRectMake(20, screenHeight3*.4+160, 38, 30)];
        self.back2Button = [[UIButton alloc] initWithFrame:CGRectMake(20+38, screenHeight3*.4+160, 38, 30)];
        self.back3Button = [[UIButton alloc] initWithFrame:CGRectMake(20+38*2, screenHeight3*.4+160, 38, 30)];
    }
    else if ([[UIScreen mainScreen] scale] >= 2.0) // is retina
    {
        width = 270;
        selectedNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 90, 100, 100)]; // find better UI spot for this label
        self.saveColorButton = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth3*.5-170, screenHeight3*.6, 138, 114)];
        self.learnInGroupsLabel = [[UILabel alloc] initWithFrame:CGRectMake(15,0,130,200)];
        self.groupsTextField = [[UITextField alloc] initWithFrame:CGRectMake(64, 122, 48, 30)];
        self.backgroundLabel = [[UILabel alloc] initWithFrame:CGRectMake(15,screenHeight3*.4,170,200)];
        self.back1Button = [[UIButton alloc] initWithFrame:CGRectMake(20, screenHeight3*.4+160, 38, 30)];
        self.back2Button = [[UIButton alloc] initWithFrame:CGRectMake(20+38, screenHeight3*.4+160, 38, 30)];
        self.back3Button = [[UIButton alloc] initWithFrame:CGRectMake(20+38*2, screenHeight3*.4+160, 38, 30)];
    }

    
    // make background scheme buttons
    
    [self.back1Button setTitle:@"1" forState:UIControlStateNormal];
    self.back1Button.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.back1Button.titleLabel.textColor = back3C;
    [self.back1Button.titleLabel setFont:[UIFont fontWithName:@"Verdana" size:28]];
    [self.back1Button addTarget:self action:@selector(back1Pressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.back2Button setTitle:@"2" forState:UIControlStateNormal];
    self.back2Button.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.back2Button.titleLabel.textColor = back3C;
    [self.back2Button.titleLabel setFont:[UIFont fontWithName:@"Verdana" size:28]];
    [self.back2Button addTarget:self action:@selector(back2Pressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.back3Button setTitle:@"3" forState:UIControlStateNormal];
    self.back3Button.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.back3Button.titleLabel.textColor = back3C;
    [self.back3Button.titleLabel setFont:[UIFont fontWithName:@"Verdana" size:28]];
    [self.back3Button addTarget:self action:@selector(back3Pressed:) forControlEvents:UIControlEventTouchUpInside];
   
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);
    back1C = [[UIColor alloc] init];
    back2C = [[UIColor alloc] init];
    back3C = [[UIColor alloc] init];
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"BackgroundColor1"])
    {
        NSLog(@"something wrong with background color in user defaults!!!!!!!!!!!!!");
    }
    else
    {
        NSData *colorData = [[NSUserDefaults standardUserDefaults] objectForKey:@"BackgroundColor1"];
        back1C = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
        colorData = [[NSUserDefaults standardUserDefaults] objectForKey:@"BackgroundColor2"];
        back2C = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
        colorData = [[NSUserDefaults standardUserDefaults] objectForKey:@"BackgroundColor3"];
        back3C = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    }

    if ([back2C isEqual:[UIColor blackColor]])
    {
        NSLog(@"back2 is black in defaults");
        // is background button 1
        self.back1Button.backgroundColor = [UIColor darkGrayColor];
        self.back2Button.backgroundColor = [UIColor grayColor];
        self.back3Button.backgroundColor = [UIColor grayColor];
    }
    else if ([back2C isEqual:[UIColor darkGrayColor]])
    {
         NSLog(@"back2 is dark gray in defaults");
        // is background button 2
        self.back2Button.backgroundColor = [UIColor grayColor];
        self.back1Button.backgroundColor = [UIColor lightGrayColor];
        self.back3Button.backgroundColor = [UIColor lightGrayColor];
    }
    else if ([back2C isEqual:[UIColor grayColor]])
    {
         NSLog(@"back2 is gray in defaults");
        // is background button 3
        self.back3Button.backgroundColor = [UIColor blackColor];
        self.back2Button.backgroundColor = [UIColor darkGrayColor];
        self.back1Button.backgroundColor = [UIColor darkGrayColor];
    }
    else
    {
        NSLog(@"error, couldnt figure out current background color scheme to set button to");
    }
    [self.view addSubview:self.back1Button];
    [self.view addSubview:self.back2Button];
    [self.view addSubview:self.back3Button];
    
    
    
    
    
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
                      @"0.", @"zeroR", @".2", @"zeroB", @"0.", @"zeroG",
                      @".99", @"oneR", @".99", @"oneB", @".99", @"oneG",
                      @"0.", @"twoR", @"0.99", @"twoB", @"0.", @"twoG",
                      @".99", @"threeR", @"0.", @"threeB", @"0.99", @"threeG",
                      @".99", @"fourR", @".0", @"fourB", @".0", @"fourG",
                      @"0.", @"fiveR", @"0.", @"fiveB", @".3", @"fiveG",
                      @".0", @"sixR", @".0", @"sixB", @".99", @"sixG",
                      @".99", @"sevenR", @".6", @"sevenB", @".2", @"sevenG",
                      @"0.", @"eightR", @".3", @"eightB", @"0.", @"eightG",
                      @".2", @"nineR", @"0.", @"nineB", @".2", @"nineG",
                      @".2", @"dotR", @".99", @"dotB", @".2", @"dotG",
                      nil];

    }
    
    
    
    saturation = 26; // so selected num label color isnt gray to begin with
    
    
    // colors update button stuff, doesnt work yet
    //self.updateColorsButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 250, 100, 100)];
    
    
    // make update color button
    [self.saveColorButton setTitle:@"Save Color" forState:UIControlStateNormal];
    self.saveColorButton.titleLabel.textColor = [UIColor whiteColor];
    [self.saveColorButton.titleLabel setFont:[UIFont fontWithName:@"Verdana" size:28]];
    self.saveColorButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.saveColorButton addTarget:self action:@selector(saveColorButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    self.saveColorButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.saveColorButton.titleLabel.numberOfLines = 0;
    
    self.saveColorButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.8f];
    self.saveColorButton.layer.borderColor = [[UIColor darkGrayColor] colorWithAlphaComponent:.8f].CGColor;
    self.saveColorButton.layer.cornerRadius = 8.f;
    self.saveColorButton.layer.borderWidth = 1;
    self.saveColorButton.layer.masksToBounds = YES;
    self.saveColorButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:self.saveColorButton];
    
    // initiate number label
    //selectedNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 90, 100, 100)]; // find better UI spot for this label
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

    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(screenWidth3-80, 0, 80, screenHeight3)];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:tableView];
    
    self.view.backgroundColor = back2C;
    // Do any additional setup after loading the view, typically from a nib.
    
    // these are here so the grayscale starts out as red
    hue = 39.;
    brightness = 39.;
    [self colorPicker];
    [self grayScale];
    
    
    UIToolbar *keyboardDoneButtonView = [[UIToolbar alloc] init];
    [keyboardDoneButtonView sizeToFit];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Enter"
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                  action:@selector(doneClicked:)];
    [keyboardDoneButtonView setItems:[NSArray arrayWithObjects:doneButton, nil]];
    self.groupsTextField.inputAccessoryView = keyboardDoneButtonView;
    self.groupsTextField.backgroundColor = back1C;
    self.groupsTextField.textColor = back3C;
    self.groupsTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.groupsTextField setKeyboardType:UIKeyboardTypeNumberPad];
    self.groupsTextField.textAlignment = NSTextAlignmentCenter;
    [self.groupsTextField setFont:[UIFont fontWithName:@"Verdana" size:28]];
    
    // assuming its not null because it was set in home VC
    self.groupsTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"LearningGroups"];
    

    [self.view addSubview:self.groupsTextField];
    
    
    // make left labels
    self.learnInGroupsLabel.text = @"Learn in Groups of:";
    [self.learnInGroupsLabel setFont:[UIFont fontWithName:@"Verdana" size:28]];
    self.learnInGroupsLabel.textAlignment = NSTextAlignmentLeft;
    self.learnInGroupsLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.learnInGroupsLabel.numberOfLines = 0;
    
    
    self.backgroundLabel.text = @"Background Color Scheme:";
    [self.backgroundLabel setFont:[UIFont fontWithName:@"Verdana" size:28]];
    self.backgroundLabel.textAlignment = NSTextAlignmentLeft;
    self.backgroundLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.backgroundLabel.numberOfLines = 0;
    
    self.learnInGroupsLabel.textColor = back3C;
    self.backgroundLabel.textColor = back3C;
    [self.view addSubview:self.learnInGroupsLabel];
    [self.view addSubview:self.backgroundLabel];
    
}

- (void)colorPicker
{
    int offset = 0;
    int offset2 = 0;
    if (screenWidth3< 568.0) // is iPhone 4 or less
    {
        offset = 10;
        offset2 = 14;
    }
    int tag = 0;
    for (int count=0; count<num; count++)
    {
        for (int j=0; j<num; j++)
        {
            //UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(335+count*(width/num), 60+(j*(width/num)), width/num, width/num)];
            UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(screenWidth3*.5+count*(width/num)-offset, 60+(j*(width/num))-offset2, width/num, width/num)];
    
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
    int offset = 0;
    int offset2 = 0;
    if (screenWidth3 < 568.0) // is iPhone 4 or less
    {
        offset = 10;
        offset2 = 14;
    }
    int tag = num*num; // start where the rainbow box left off
    for (int i=0; i<num; i++)
    {
        //UIView *v = [[UIView alloc] initWithFrame:CGRectMake(335+i*(width/num), 310, width/num, width/num+25)];
        UIView *v = [[UIView alloc] initWithFrame:CGRectMake(screenWidth3*.5+i*(width/num)-offset, width+5+60-offset2, width/num, width/num+25)];
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
    cell.backgroundColor = back2C;
    cell.textLabel.textAlignment = NSTextAlignmentCenter; // why doesn't this work????
    
    cell.textLabel.highlightedTextColor = back2C;
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

- (void)recolorNewBackground
{
    self.groupsTextField.backgroundColor = back1C;
    self.groupsTextField.textColor = back3C;
    
    // make words back3
    self.learnInGroupsLabel.textColor = back3C;
    self.backgroundLabel.textColor = back3C;
    
    self.view.backgroundColor = back2C;
    [tableView reloadData]; // to reset colors
}

- (IBAction)saveColorButtonPress:(id)sender // for updating that one specific number/color in the table
{
    // update color array
    NSLog(@"no number selected yet");
    if (selectedNum == nil)
    {
        return;
    }
    
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

- (IBAction)digitTextFieldEdited:(id)sender
{ // do i need this?
    self.groupsTextField = (UITextField*)sender;
}

- (IBAction)editingDidEndOnExit:(id)sender
{
    // NSLog(@"user going to digit %i", [self.digitTextField.text intValue]);
    [sender resignFirstResponder];
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    NSLog(@"called should end editing");
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)doneClicked:(id)sender
{
    NSLog(@"Done Clicked.");
    
    //NSLog(@"user going to digit %i", [self.digitTextField.text intValue]);
    
    if ([self isGotoDigitPossible:self.groupsTextField.text])
    {
        NSLog(@"can do this learning group");
        [[NSUserDefaults standardUserDefaults] setObject:self.groupsTextField.text forKey:@"LearningGroups"];
    }
    else
    {
        NSLog(@"cant goto that ridiculous number");
        // put text field text back to original
        self.groupsTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"LearningGroups"];
    }
    
    [self.view endEditing:YES];
}

- (BOOL)isGotoDigitPossible:(NSString *)gotoDigit
{
    if ([gotoDigit isEqualToString:@""])
    {
        return false;
    }
    if (([gotoDigit intValue] >= 2) && ([gotoDigit intValue] < 30))
    {
        
        return true;
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops, sorry!"
                                                        message:@"You can only learn in groups of 2 to 30 digits. For more group sizes, upgrade to premium (coming soon)."
                                                       delegate:self
                                              cancelButtonTitle:@"Okay"
                                              otherButtonTitles:nil];
        [alert show];
        return false;
    }
    return false;
}



- (IBAction)back1Pressed:(id)sender {
    self.back1Button.backgroundColor = [UIColor darkGrayColor];
    self.back2Button.backgroundColor = [UIColor grayColor];
    self.back3Button.backgroundColor = [UIColor grayColor];
    
    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor darkGrayColor]]; // back color 1 is pi entry color
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"BackgroundColor1"];
    colorData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor blackColor]]; // back color 2 is play background color
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"BackgroundColor2"];
    colorData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor whiteColor]]; // back color 3 is words color
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"BackgroundColor3"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    back1C = [UIColor darkGrayColor];
    back2C = [UIColor blackColor];
    back3C = [UIColor whiteColor];
    [self recolorNewBackground];
}

- (IBAction)back2Pressed:(id)sender {
    self.back1Button.backgroundColor = [UIColor lightGrayColor];
    self.back2Button.backgroundColor = [UIColor grayColor];
    self.back3Button.backgroundColor = [UIColor lightGrayColor];
    
    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor lightGrayColor]]; // back color 1 is pi entry color
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"BackgroundColor1"];
    colorData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor darkGrayColor]]; // back color 2 is play background color
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"BackgroundColor2"];
    colorData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor whiteColor]]; // back color 3 is words color
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"BackgroundColor3"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    back1C = [UIColor lightGrayColor];
    back2C = [UIColor darkGrayColor];
    back3C = [UIColor whiteColor];
    [self recolorNewBackground];
}

- (IBAction)back3Pressed:(id)sender {
    
    self.back3Button.backgroundColor = [UIColor blackColor];
    self.back2Button.backgroundColor = [UIColor darkGrayColor];
    self.back1Button.backgroundColor = [UIColor darkGrayColor];

    
    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor whiteColor]]; // back color 1 is pi entry color
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"BackgroundColor1"];
    colorData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor grayColor]]; // back color 2 is play background color
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"BackgroundColor2"];
    colorData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor blackColor]]; // back color 3 is words color
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"BackgroundColor3"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    back1C = [UIColor whiteColor];
    back2C = [UIColor grayColor];
    back3C = [UIColor blackColor];
    [self recolorNewBackground];
}
@end
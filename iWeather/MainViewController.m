//
//  MainViewController.m
//  iWeather
//
//  Created by 开发者 on 12-12-6.
//  Copyright (c) 2012年 开发者. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"

@interface MainViewController ()

@end

@implementation MainViewController

//@synthesize weatherOfToday = _weatherOfToday;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *userData = [NSUserDefaults standardUserDefaults];
    NSString *citySaved = [userData objectForKey:@"citySaved"];
    if (citySaved)
    {
        MainView *main = [[MainView alloc] initWithFrame:CGRectMake(0, 0, 320, 460) AndCity:citySaved];
        [self.view addSubview:main];

    }else
    {
        MainView *main = [[MainView alloc] init];
        [self.view addSubview:main];

    }
}

- (void)viewWillUnload
{
    NSUserDefaults *userData = [NSUserDefaults standardUserDefaults];
    [userData setObject:_city forKey:@"citySaved"];
    [userData synchronize];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)dealloc
{
    [_city release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

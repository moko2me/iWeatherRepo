//
//  mainView.h
//  iWeather
//
//  Created by 开发者 on 12-12-6.
//  Copyright (c) 2012年 开发者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherDetailModal.h"
#import "ASIHTTPRequst/ASIHTTPRequest.h"
#import "SBJson/SBJson.h"

@interface MainView : UIView
{
    WeatherDetailModal *_weatherOfToday;
    UILabel *_label;
}

@property (nonatomic, retain) UILabel *label;

- (id)initWithFrame:(CGRect)frame AndCity:(NSString *)aCity;

@end

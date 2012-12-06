//
//  mainView.m
//  iWeather
//
//  Created by 开发者 on 12-12-6.
//  Copyright (c) 2012年 开发者. All rights reserved.
//

#import "MainView.h"

@implementation MainView

@synthesize label = _label;

- (id)initWithFrame:(CGRect)frame AndCity:(NSString *)aCity
{
    self = [super initWithFrame:frame];
    if (self) {
        _weatherOfToday = [[WeatherDetailModal alloc] init];
        [self getWeatherDetailOfCity:aCity];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [self initWithFrame:frame AndCity:@"NYC"];
    if (self)
        return self;
    return nil;
}

- (id)init
{
    self = [self initWithFrame:CGRectMake(0, 0, 320, 460) AndCity:@"NYC"];
    if (self)
        return self;
    return nil;
}

#pragma mark Setter & Getter of _weatherOfToday
- (WeatherDetailModal *)weatherOfToday
{
    return _weatherOfToday;
}

- (void)setWeatherOfToday:(NSDictionary *)dict
{
    NSDictionary *currentObservation = [dict objectForKey:@"current_observation"];
    NSDictionary *locationInfo = [currentObservation objectForKey:@"display_location"];
    _weatherOfToday.cityFullName = [locationInfo objectForKey:@"full"];
    _weatherOfToday.cityName     = [locationInfo objectForKey:@"city"];
    _weatherOfToday.stateName    = [locationInfo objectForKey:@"state"];
    _weatherOfToday.countryName  = [locationInfo objectForKey:@"country"];
    _weatherOfToday.latitude     = [locationInfo objectForKey:@"latitude"];
    _weatherOfToday.longitude    = [locationInfo objectForKey:@"longitude"];
    
    _weatherOfToday.weather          = [currentObservation objectForKey:@"weather"];
    _weatherOfToday.temp_f           = [[currentObservation objectForKey:@"temp_f"] floatValue];
    _weatherOfToday.temp_c           = [[currentObservation objectForKey:@"temp_c"] floatValue];
    _weatherOfToday.temp_f_feelslike = [[currentObservation objectForKey:@"feelslike_f"] floatValue];
    _weatherOfToday.temp_c_feelslike = [[currentObservation objectForKey:@"feelslike_c"] floatValue];
    _weatherOfToday.humidity         = [currentObservation objectForKey:@"relative_humidity"];
    _weatherOfToday.windDescription  = [currentObservation objectForKey:@"wind_string"];
    _weatherOfToday.windDir          = [currentObservation objectForKey:@"wind_dir"];
    _weatherOfToday.visibility_mi    = [[currentObservation objectForKey:@"visibility_mi"] floatValue];
    _weatherOfToday.visibility_km    = [[currentObservation objectForKey:@"visibility_km"] floatValue];
}

- (void)getWeatherDetailOfCity:(NSString *)aCity
{
    NSString *urlStr = [NSString stringWithFormat:@"http://api.wunderground.com/api/8114536921ad78c7/conditions/q/%@.json", aCity];
    NSURL *url = [NSURL URLWithString:urlStr];
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
    request.delegate = self;
    [request startAsynchronous];
}

-(void)requestFinished:(ASIHTTPRequest *)request{
    NSString *str = [[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding];
    NSDictionary *dict = [str JSONValue];
    [self setWeatherOfToday:dict];
    [self layoutViews];
}

- (void)layoutViews
{
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 300, 50)];
    self.label.text = self.weatherOfToday.cityFullName;
    [self addSubview:self.label];
}

@end

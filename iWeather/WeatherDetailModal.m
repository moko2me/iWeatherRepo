//
//  WeatherDetailModal.m
//  iWeather
//
//  Created by 开发者 on 12-12-6.
//  Copyright (c) 2012年 开发者. All rights reserved.
//

#import "WeatherDetailModal.h"

@implementation WeatherDetailModal
@synthesize cityFullName = _cityFullName;
@synthesize cityName = _cityName;
@synthesize stateName = _stateName;
@synthesize countryName = _countryName;
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;
@synthesize weather = _weather;
@synthesize temp_f = _temp_f;
@synthesize temp_c = _temp_c;
@synthesize temp_f_feelslike = _temp_f_feelslike;
@synthesize temp_c_feelslike = _temp_c_feelslike;
@synthesize humidity = _humidity;
@synthesize windDescription = _windDescription;
@synthesize windDir = _windDir;
@synthesize visibility_mi = _visibility_mi;
@synthesize visibility_km = _visibility_km;

- (void)dealloc
{
    [_cityFullName release];
    [_cityName release];
    [_stateName release];
    [_countryName release];
    [_latitude release];
    [_longitude release];
    [_weather release];
    [_humidity release];
    [_windDescription release];
    [_windDir release];
    
    [super dealloc];
}
@end

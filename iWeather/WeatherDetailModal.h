//
//  WeatherDetailModal.h
//  iWeather
//
//  Created by 开发者 on 12-12-6.
//  Copyright (c) 2012年 开发者. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherDetailModal : NSObject
{
    NSString *_cityFullName;
    NSString *_cityName;
    NSString *_stateName;
    NSString *_countryName;
    NSString *_latitude;
    NSString *_longitude;
    
    NSString *_weather;
    float _temp_f;
    float _temp_c;
    float _temp_f_feelslike;
    float _temp_c_feelslike;
    NSString *_humidity;
    NSString *_windDescription;
    NSString *_windDir;
    float _visibility_mi;
    float _visibility_km;
}

@property (nonatomic, retain) NSString *cityFullName;
@property (nonatomic, retain) NSString *cityName;
@property (nonatomic, retain) NSString *stateName;
@property (nonatomic, retain) NSString *countryName;
@property (nonatomic, retain) NSString *latitude;
@property (nonatomic, retain) NSString *longitude;
@property (nonatomic, retain) NSString *weather;
@property float temp_f;
@property float temp_c;
@property float temp_f_feelslike;
@property float temp_c_feelslike;
@property (nonatomic, retain) NSString *humidity;
@property (nonatomic, retain) NSString *windDescription;
@property (nonatomic, retain) NSString *windDir;
@property float visibility_mi;
@property float visibility_km;

@end

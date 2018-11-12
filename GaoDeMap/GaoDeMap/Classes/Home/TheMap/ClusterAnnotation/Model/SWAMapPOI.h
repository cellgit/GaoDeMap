//
//  SWAMapPOI.h
//  HouseRent
//
//  Created by liuhongli on 2018/11/1.
//  Copyright © 2018年 HouseRent. All rights reserved.
//

//#import "SWAMapPOI.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchKit.h>

#import "ClusterAnnotation.h"
//#import "MAAnnotation.h"
#import <AMapLocationKit/AMapLocationKit.h>
#import "ClusterAnnotation.h"

@interface SWAMapPOI : NSObject
///经纬度
//@property (nonatomic, copy)   AMapGeoPoint *location;
@property (nonatomic, assign)   double lat;
@property (nonatomic, assign)   double lon;
@property (nonatomic, copy) NSString <MAAnnotation>* title;
@property (nonatomic, copy) NSString <MAAnnotation>* subtitle;

@end

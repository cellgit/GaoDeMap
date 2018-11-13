//
//  ClusterAnnotation.h
//  officialDemo2D
//
//  Created by yi chen on 14-5-15.
//  Copyright (c) 2014年 AutoNavi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapCommonObj.h>

@interface ClusterAnnotation : NSObject<MAAnnotation>

@property (assign, nonatomic) CLLocationCoordinate2D coordinate; //poi的平均位置
@property (assign, nonatomic) NSInteger count;
@property (nonatomic, strong) NSMutableArray *pois;
//@property (nonatomic, strong) NSString *title;
//@property (nonatomic, strong) NSString *subtitle;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;



/// 如果需要传递m swift 项目的 model 则需要桥接
/// extension : 根据项目需要扩展属性, 如果需要其它属性,自行添加后再创建 annotation 时赋值即可
/// 房源封面图片的 url 地址
@property (nonatomic, copy) NSString *imgUrl;
/// 房源价格
@property (nonatomic, copy) NSString *price;
/// 房源地址
@property (nonatomic, copy) NSString *address;
/// 房源楼层
@property (nonatomic, copy) NSString *floor;


- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate count:(NSInteger)count;

@end

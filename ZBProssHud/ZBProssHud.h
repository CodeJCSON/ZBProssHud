//
//  ZBProssHud.h
//  meituan
//
//  Created by apple on 16/5/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBProssHud : UIView
//正在加载（网络请求方法之前）str可以不传
+(void)showFrom:(UIView *)view withtetxt:(NSString *)str;
//加载成功删除（网络请求方法中间）
+(void)removeFrom:(UIView *)view ;
//加载出错返回出错信息
+(void)showerrorFrom:(UIView *)view with:(NSString *)str;
//加载成功
+(void)showsuccessFrom:(UIView *)view with:(NSString *)str;
@end

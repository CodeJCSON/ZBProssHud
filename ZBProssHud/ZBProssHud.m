//
//  ZBProssHud.m
//  meituan
//
//  Created by apple on 16/5/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZBProssHud.h"
@interface ZBProssHud()
@property(nonatomic,strong)UIView *bgview;
@property(nonatomic,strong)UIImageView *imageview;
@property(nonatomic,strong)UILabel *lable;
@property(nonatomic,strong)NSArray *array;
@end
@implementation ZBProssHud
-(NSArray *)array
{
    if (!_array) {
        _array = [NSArray arrayWithObjects:[UIImage imageNamed:@"jiazai1.png"],[UIImage imageNamed:@"jiazai2.png"], nil];
    }
    return _array;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self  =[ super initWithFrame:frame]) {
        
        [self setUpUI];
    }
    return self;

}
-(void)setUpUI
{
    self.backgroundColor = kcolor(1, 1, 1, 0.1);
    
    self.bgview = [[UIView alloc]init];
    self.bgview.backgroundColor = [UIColor whiteColor];
    self.bgview.layer.masksToBounds = YES;
    self.bgview.layer.cornerRadius = 10*Kscr;
    [self addSubview:self.bgview];
    
    self.imageview = [[UIImageView alloc]init];
    [self.bgview  addSubview:self.imageview];
    
    self.lable = [[UILabel alloc]init];
    self.lable.textAlignment =NSTextAlignmentCenter;
    self.lable.font = [UIFont systemFontOfSize:13*Kscr];
    self.lable.numberOfLines = 0;
//    self.lable.textColor = kPHTColor;
    self.lable.text = @"正在拼命加载中...";
    [self.bgview addSubview:self.lable];

    
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
}
+(void)showFrom:(UIView *)view withtetxt:(NSString *)str;
{
    
    
    ZBProssHud *hud = [[ZBProssHud alloc]initWithFrame:view.bounds];
    hud.lable.text = str;
    CGFloat bgW = 180*Kscr;
    CGFloat bgX =( KscrW-bgW)/2;
    CGFloat bgY = (hud.height-bgW)/2;
    hud.bgview.frame = CGRectMake(bgX, bgY-64*Kscr, bgW, bgW);
    
    hud.imageview.frame = CGRectMake(40*Kscr, 10*Kscr,105*Kscr , 125*Kscr);
    
    hud.lable.frame = CGRectMake(0, hud.imageview.bottom+10*Kscr, hud.bgview.width, 25*Kscr);

    [hud imagebeaginAnimation];
    [view addSubview:hud];

}
-(void)imagebeaginAnimation
{
    [self.imageview setAnimationImages:self.array];
    [self.imageview setAnimationDuration:0.15];
    [self.imageview setAnimationRepeatCount:0];
    [self.imageview startAnimating];
    
    

}
+(void)removeFrom:(UIView *)view
{
    
    for (UIView *subview in view.subviews) {
        if ([subview isKindOfClass:[ZBProssHud class]]) {
            [subview removeFromSuperview];
        }
    }

}
+(void)showerrorFrom:(UIView *)view with:(NSString *)str
{
    [ZBProssHud removeFrom:view];
    ZBProssHud *hud = [[ZBProssHud alloc]initWithFrame:view.bounds];
    hud.lable.text = str;
    hud.imageview.image = [UIImage imageNamed:@"wrong.png"];
    CGFloat bgW = 180*Kscr;
    CGFloat bgX =( KscrW-bgW)/2;
    CGFloat bgY = (hud.height-bgW)/2;
    hud.bgview.frame = CGRectMake(bgX, bgY-64*Kscr, bgW, bgW+15*Kscr);
    
    NSLog(@"%f%f",hud.height,bgY);
    
    hud.imageview.frame = CGRectMake(22*Kscr, 10*Kscr,136*Kscr , 128*Kscr);
    
    hud.lable.frame = CGRectMake(0, hud.imageview.bottom+5*Kscr, hud.bgview.width, 50*Kscr);

    [view addSubview:hud];
    
    [hud performSelector:@selector(yichu) withObject:nil afterDelay:2];


}
-(void)yichu
{
    [self removeFromSuperview];
}
+(void)showsuccessFrom:(UIView *)view with:(NSString *)str
{
    [ZBProssHud removeFrom:view];
    ZBProssHud *hud = [[ZBProssHud alloc]initWithFrame:view.bounds];
    hud.lable.text = str;
    hud.imageview.image = [UIImage imageNamed:@"successs.png"];
    CGFloat bgW = 180*Kscr;
    CGFloat bgX =( KscrW-bgW)/2;
    CGFloat bgY = (hud.height-bgW)/2;
    hud.bgview.frame = CGRectMake(bgX, bgY-64*Kscr, bgW, bgW+15*Kscr);
    
    NSLog(@"%f%f",hud.height,bgY);
    
    hud.imageview.frame = CGRectMake(51*Kscr, 10*Kscr,82*Kscr , 128*Kscr);
    
    hud.lable.frame = CGRectMake(0, hud.imageview.bottom+5*Kscr, hud.bgview.width, 50*Kscr);
    
    [view addSubview:hud];
    
    [hud performSelector:@selector(yichu) withObject:nil afterDelay:2];


}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

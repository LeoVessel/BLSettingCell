//
//  BLSettingStyle.h
//  BLSettingController
//
//  Created by Jack on 2018/8/2.
//  Copyright © 2018年 bianla. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BLSettingStyle;
typedef BLSettingStyle *(^IconSize)(CGSize size);
typedef BLSettingStyle *(^AddRadius)(CGFloat radius);
typedef BLSettingStyle *(^TextFont)(UIFont * font);
typedef BLSettingStyle *(^TextFontSize)(CGFloat size);
typedef BLSettingStyle *(^PresentColor)(UIColor* color);
typedef BLSettingStyle *(^Height)(CGFloat height);
typedef BLSettingStyle *(^SpaceToSuperViewLRMargin)(UIEdgeInsets insets);
typedef BLSettingStyle *(^ViewTextStyleDictionary)(NSDictionary * attributedDict);

@interface BLSettingStyle : NSObject

///====外部设置属性值=====
/**左侧图标尺寸*/
@property (nonatomic,copy, readonly) IconSize leftImageSize;
/**右侧图标尺寸*/
@property (nonatomic,copy, readonly) IconSize rightImageSize;
/**左侧图标是否需要圆角效果*/
@property (nonatomic,copy, readonly) AddRadius addLeftIconRadius;
/**右侧图标是否需要圆角效果*/
@property (nonatomic,copy, readonly) AddRadius addRightIconRadius;
/**标题文字大小*/
@property (nonatomic,copy, readonly) TextFont leftTitleFont;
@property (nonatomic,copy, readonly) TextFontSize leftTitleFontSize;
/**标题颜色*/
@property (nonatomic,copy, readonly) PresentColor leftTitleColor;
/**描述文字大小*/
@property (nonatomic,copy, readonly) TextFont descTitleFont;
@property (nonatomic,copy, readonly) TextFontSize descTitleFontSize;
/**描述文字颜色*/
@property (nonatomic,copy, readonly) PresentColor descTitleColor;
/**下划线颜色*/
@property (nonatomic,copy, readonly) PresentColor bottomLineColor;
/**下划线高度*/
@property (nonatomic,copy, readonly) Height bottomLineHeight ;
/**小红点颜色*/
@property (nonatomic,copy, readonly) PresentColor redPointColor;
/**小红点高度*/
@property (nonatomic,copy, readonly) Height redPointHeight;
/**箭头图标尺寸*/
@property (nonatomic,copy, readonly) IconSize arrowIconSize;
/**设置下划线左右间距 上下值设置无效*/
@property (nonatomic,copy, readonly) SpaceToSuperViewLRMargin bottomLineEdgeInsets;
///====开关类型样式======
/**开关开启的颜色*/
@property (nonatomic,copy, readonly) PresentColor switchOnColor;
///====segument类型样式======
/**segument的渲染颜色*/
@property (nonatomic,copy, readonly) PresentColor segumentDrawingColor;
/**segument的默认状态文字展示样式 对应的key 请移步NSAttributedString.h 查看.*/
@property (nonatomic,copy, readonly) ViewTextStyleDictionary segumentNormalTextStyle;
/**segument的选中状态文字展示样式 对应的key 请移步NSAttributedString.h 查看.*/
@property (nonatomic,copy, readonly) ViewTextStyleDictionary segumentSelectedTextStyle;

///====外部获取属性值======
/**左侧图标尺寸*/
@property(nonatomic,assign, readonly)CGSize leftIconSize;
/**左侧图标是否需要圆角效果*/
@property(nonatomic,assign, readonly)CGFloat leftIconRadius;
/**右侧图标尺寸*/
@property(nonatomic,assign, readonly)CGSize rightIconSize;
/**右侧图标是否需要圆角效果*/
@property(nonatomic,assign, readonly)CGFloat rightIconRadius;
/**标题文字大小*/
@property(nonatomic,strong, readonly)UIFont *titleFont;
@property(nonatomic,assign, readonly)CGFloat titleFontSize;
/**标题颜色*/
@property(nonatomic,strong, readonly)UIColor *titleColor;
/**描述文字大小*/
@property(nonatomic,strong, readonly)UIFont *descFont;
@property(nonatomic,assign, readonly)CGFloat descFontSize;
/**描述文字颜色*/
@property(nonatomic,strong, readonly)UIColor *descColor;
/**下划线颜色*/
@property(nonatomic,strong, readonly)UIColor *underlineColor;
/**下划线高度*/
@property(nonatomic,assign, readonly)CGFloat underlineHeight;
/**小红点颜色*/
@property(nonatomic,strong, readonly)UIColor *redDotColor;
/**小红点高度*/
@property(nonatomic,assign, readonly)CGFloat redDotSize;
/**箭头图标尺寸*/
@property(nonatomic,assign, readonly)CGSize arrowSize;
/**设置下划线左右间距 上下值设置无效*/
@property(nonatomic,assign, readonly)UIEdgeInsets cellLineEdgeInsets;
///====开关类型样式======
/**开关开启的颜色*/
@property(nonatomic,strong, readonly)UIColor *switchOnTintColor;
///====segument类型样式======
/**segument的渲染颜色*/
@property(nonatomic,strong, readonly)UIColor *segumentTintColor;
/**segument的默认状态文字展示样式 对应的key 请移步NSAttributedString.h 查看.*/
@property(nonatomic,strong, readonly)NSDictionary *segNormalTextStyle;
/**segument的选中状态文字展示样式 对应的key 请移步NSAttributedString.h 查看.*/
@property(nonatomic,strong, readonly)NSDictionary *segSelectedTextStyle;

+ (BLSettingStyle*)style;

/**
 快速初始化默认样式
 @param titleFont 标题文字大小
 @param titleColor 标题颜色
 @param descFont 描述文字大小
 @param descColor 描述文字大小
 @return BLSettingStyle
 */
+ (instancetype)settingStyleWithTitleFont:(UIFont*)titleFont titleColor:(UIColor*)titleColor descFont:(UIFont*)descFont descColor:(UIColor*)descColor;

/**
 快速初始化开关样式
 @param titleFont 标题文字大小
 @param titleColor 标题颜色
 @param descFont 描述文字大小
 @param descColor 描述文字大小
 @return BLSettingStyle
 */
+ (instancetype)settingStyleWithTitleFont:(UIFont*)titleFont titleColor:(UIColor*)titleColor descFont:(UIFont*)descFont descColor:(UIColor*)descColor switchOnTintColor:(UIColor*)switchOnTintColor;

/**
 快速初始化segument样式
 @param titleFont 标题文字大小
 @param titleColor 标题颜色
 @param descFont 描述文字大小
 @param descColor 描述文字大小
 @return BLSettingStyle
 */
+ (instancetype)settingStyleWithTitleFont:(UIFont*)titleFont titleColor:(UIColor*)titleColor descFont:(UIFont*)descFont descColor:(UIColor*)descColor segumentTintColor:(UIColor*)segumentTintColor;

@end

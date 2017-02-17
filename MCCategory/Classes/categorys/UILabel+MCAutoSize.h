//
//  UILabel+MCAutoSize.h
//  MCCategory
//
//  Created by mcc on 2017/2/17.
//  Copyright © 2017年 mcc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (MCAutoSize)
/**
 *         垂直方向固定获取动态宽度的UILabel的方法
 * @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (UILabel *)resizeLabelHorizontal;

/**
 *           水平方向固定获取动态宽度的UILabel的方法
  *  @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (UILabel *)resizeLabelVertical;

/**
 *          垂直方向固定获取动态宽度的UILabel的方法
 *  @param minimumWidth minimum width
 *  @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (UILabel *)resizeLabelHorizontal:(CGFloat)minimumWidth;

/**
 *         水平方向固定获取动态宽度的UILabel的方法
 *  @param minimumHeigh minimum height
 *  @return 原始UILabel修改过的Rect的UILabel(起始位置相同)
 */
- (UILabel *)resizeLabelVertical:(CGFloat)minimumHeigh;
@end

//
//  TestVeiw.m
//  TestYINDAO
//
//  Created by mac on 2019/8/16.
//  Copyright © 2019 coderzhong. All rights reserved.
//

#import "TestVeiw.h"

@implementation TestVeiw

-(void)drawCircleTipWithRects:(NSArray *)rects{
    //画虚线
    NSMutableArray *patharray = [NSMutableArray array];
    for (NSValue *value in rects) {
        CGRect temRect =[value CGRectValue];
        [self setRect:temRect];
         UIBezierPath *tempPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(temRect.origin.x+7, temRect.origin.y+7, temRect.size.width-14, temRect.size.height-14)];
        [patharray addObject:tempPath];
        
    }
    //画空心圆
    self.layer.mask = [self addTransparencyViewWith:patharray];
}

-(void)setRect:(CGRect)rect{
    //画虚线
    CAShapeLayer *dotteLine =  [CAShapeLayer layer];
    CGMutablePathRef dottePath =  CGPathCreateMutable();
    dotteLine.lineWidth = 4.0f ;
    dotteLine.strokeColor = [UIColor whiteColor].CGColor;
    dotteLine.fillColor = [UIColor clearColor].CGColor;
    CGPathAddEllipseInRect(dottePath, nil, rect);
    dotteLine.path = dottePath;
    NSArray *arr = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:12],[NSNumber numberWithInt:6], nil];
    dotteLine.lineDashPhase = 1.0;
    dotteLine.lineDashPattern = arr;
    CGPathRelease(dottePath);
    [self.layer addSublayer:dotteLine];
}
//画空心圆
- (CAShapeLayer *)addTransparencyViewWith:(NSArray *)tempPaths{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:[UIScreen mainScreen].bounds];
    for (UIBezierPath *tempath in tempPaths) {
        [path appendPath:tempath];
    }
    path.usesEvenOddFillRule = YES;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor= [UIColor blackColor].CGColor;  //其他颜色都可以，只要不是透明的
    shapeLayer.fillRule=kCAFillRuleEvenOdd;
    return shapeLayer;
}


@end

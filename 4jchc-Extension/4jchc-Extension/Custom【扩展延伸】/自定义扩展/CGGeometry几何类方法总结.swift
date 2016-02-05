        //
        //  CGGeometry几何类方法总结.swift
        //  4jchc-Extension
        //
        //  Created by 蒋进 on 16/1/30.
        //  Copyright © 2016年 sijichcai. All rights reserved.
        //

        import UIKit

        // 几何类方法总结
        //MARK: - CGGeometry.h文件是用C语言实现的一个封装了许多常用几何方法的文件。

        /*

        CGGeometry.h文件是用C语言实现的一个封装了许多常用几何方法的文件。
        
        
        一、几个常用结构体
        struct CGPoint {
        CGFloat x;
        CGFloat y;
        };
        定义一个点，设置x坐标和y坐标
        
        
        struct CGSize {
        CGFloat width;
        CGFloat height;
        };
        定义一个尺寸，设置宽度和高度
        
        
        struct CGVector {
        CGFloat dx;
        CGFloat dy;
        };
        定义一个二维矢量
        
        
        struct CGRect {
        CGPoint origin;
        CGSize size;
        };
        定义一个矩形
        
        
        二、几个系统定义的量
        
        const CGPoint CGPointZero
        零点，与CGPointMake(0, 0)等效
        
        const CGSize CGSizeZero
        零尺寸，与CGSizeMake(0, 0)等效
        
        const CGRect CGRectZero
        零矩形，与CGRectMake(0, 0, 0, 0)等效
        
        const CGRect CGRectNull
        空矩形，这个和零矩形并不相同，当我们返回两个不相交矩形的交集时，会返回空矩形。
        
        const CGRect CGRectInfinite
        无限的矩形
        
        
        
        三、一些常用方法
        CGPoint CGPointMake(CGFloat x, CGFloat y);
        创建一个点
        
        CGSize CGSizeMake(CGFloat width, CGFloat height);
        创建一个尺寸
        
        CGVectorMake(CGFloat dx, CGFloat dy);
        创建一个矢量
        
        CGRect CGRectMake(CGFloat x, CGFloat y, CGFloat width,
        CGFloat height);
        创建一个矩形
        
        CGFloat CGRectGetMinX(CGRect rect);
        获得矩形最左边的x值
        
        CGFloat CGRectGetMidX(CGRect rect);
        获取矩形中点的x值
        
        CGFloat CGRectGetMaxX(CGRect rect);
        获取矩形最右端的x值
        
        CGFloat CGRectGetMinY(CGRect rect);
        获取矩形最上端的y值
        
        CGFloat CGRectGetMidY(CGRect rect);
        获取矩形中心点的y值
        
        CGFloat CGRectGetMaxY(CGRect rect);
        获取矩形最下端的y值
        
        CGFloat CGRectGetWidth(CGRect rect);
        获取矩形宽度
        
        CGFloat CGRectGetHeight(CGRect rect);
        获取矩形高度
        
        
        
        bool CGPointEqualToPoint(CGPoint point1, CGPoint point2);
        判断两个点是否相等
        
        bool CGSizeEqualToSize(CGSize size1, CGSize size2);
        判断两个尺寸是否相等
        
        bool CGRectEqualToRect(CGRect rect1, CGRect rect2);
        判断两个矩形是否相等
        
        CGRect CGRectStandardize(CGRect rect);
        根据一个矩形创建一个标准的矩形
        
        bool CGRectIsEmpty(CGRect rect);
        判断是否为零矩形
        
        CGRectIsNull(CGRect rect);
        判断是否为空矩形
        
        bool CGRectIsInfinite(CGRect rect);
        判断是否为无限矩形
        
        CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy);
        创建一个内嵌的矩形，中心和rect参数的中心一样，dx，dy对应内嵌的宽度和高度
        
        比如：CGRect rect= CGRectInset(CGRectMake(0, 0, 100, 100), 10, 10);
        会创建出的rect为（10，10，80，80），dx，dy也可以为负值，则是创建出来的矩形会大于原矩形范围。
        
        CGRect CGRectIntegral(CGRect rect)
        根据一个矩形，返回四个参数都是整数的矩形
        
        CGRect CGRectUnion(CGRect r1, CGRect r2);
        返回两个矩形的并集
        
        CGRect CGRectIntersection(CGRect r1, CGRect r2);
        返回两个矩形的交集，如果没有交集，返回空矩形
        
        CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy);
        返回一个矩形，偏移量相对于rect
        
        void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder,
        
        CGFloat amount, CGRectEdge edge);
        这个函数用来分割矩形，参数rect是源矩形，slice和remainder是分割后的两部分矩形，amount是分割线，edge是分割选项。
        注意：1、edge是一个宏，定义了分割的方式如下：

        typedef CF_ENUM(uint32_t, CGRectEdge) {
            //从x的最小处进行垂直分割
            CGRectMinXEdge,
            //从y的最小处进行水平分割
            CGRectMinYEdge,
            //从x最大处进行垂直分割
            CGRectMaxXEdge,
            //从y最大处进行水平分割
            CGRectMaxYEdge
        };
        2、slice和remainder是地址。
        
        3、举例如下，将会分割出两个矩形分别为(40,0,60,100)(0,0,40,100);

        CGRect rect = CGRectMake(0, 0, 100, 100);
        CGRect slice ;
        CGRect remainder;
        CGRectDivide(rect, &slice, &remainder, 60, CGRectMaxXEdge);
        bool CGRectContainsPoint(CGRect rect, CGPoint point);
        判断点是否在矩形内
        
        bool CGRectContainsRect(CGRect rect1, CGRect rect2);
        判断矩形1是否包含矩形2
        
        bool CGRectIntersectsRect(CGRect rect1, CGRect rect2);
        判断矩形1和矩形2是否相交
        
        CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point);
        返回一个表示点的字典
        
        bool CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict,
        CGPoint *point);
        将字典转换为点
        
        CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size);
        返回一个表示尺寸的字典
        
        bool CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict,
        CGSize *size) ;
        将字典转换为尺寸
        
        CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect);
        返回一个表示矩形的字典
        
        bool CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict,
        CGRect *rect);
        将字典转化为矩形


        */
        
        
        
        
        
        /*   1 controlCharacterSet//控制符
            2 whitespaceCharacterSet
            3 whitespaceAndNewlineCharacterSet//空格换行
            4 decimalDigitCharacterSet//小数
            5 letterCharacterSet//文字
            6 lowercaseLetterCharacterSet//小写字母
            7 uppercaseLetterCharacterSet//大写字母
            8 nonBaseCharacterSet//非基础
            9 alphanumericCharacterSet//字母数字
            10 decomposableCharacterSet//可分解
            11 illegalCharacterSet//非法
            12 punctuationCharacterSet//标点
            13 capitalizedLetterCharacterSet//大写
            14 symbolCharacterSet//符号
            15 newlineCharacterSet//换行符
        */

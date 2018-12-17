//
//  PDFView.m
//  HQKit
//
//  Created by 因酷  on 2018/11/22.
//  Copyright © 2018年 LHQ. All rights reserved.
//

#import "PDFView.h"

@implementation PDFView


- (CGPDFDocumentRef)pdfRefByFilePath:(NSString *)aFilePath {
    CFStringRef path;
    CFURLRef url;
    CGPDFDocumentRef document;
    
    path = CFStringCreateWithCString(NULL, [aFilePath UTF8String], kCFStringEncodingUTF8);
    url = CFURLCreateWithFileSystemPath(NULL, path, kCFURLPOSIXPathStyle, NO);
    document = CGPDFDocumentCreateWithURL(url);
    
    CFRelease(path);
    CFRelease(url);
    
    return document;
}

- (NSString *)getPdfPathByFile:(NSString *)fileName {
    return [[NSBundle mainBundle] pathForResource:fileName ofType:@".pdf"];
}

//用于网络pdf文件
- (CGPDFDocumentRef)pdfRefByDataByUrl:(NSString *)aFileUrl {
    NSData *pdfData = [NSData dataWithContentsOfFile:aFileUrl];
    CFDataRef dataRef = (__bridge_retained CFDataRef)(pdfData);
    
    CGDataProviderRef proRef = CGDataProviderCreateWithCFData(dataRef);
    CGPDFDocumentRef pdfRef = CGPDFDocumentCreateWithProvider(proRef);
    
    CGDataProviderRelease(proRef);
    CFRelease(dataRef);
    
    return pdfRef;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGPDFPageRef pageRef = CGPDFDocumentGetPage([self createPDFFromExistFile], _pageNumber);//获取指定页的内容如_pageNumber=1，获取的是pdf第一页的内容
//    CGRect mediaRect = CGPDFPageGetBoxRect(pageRef, kCGPDFCropBox);//pdf内容的rect
//    
//    CGContextRetain(context);
//    CGContextSaveGState(context);
//    
//    [[UIColor whiteColor] set];
//    CGContextFillRect(context, rect);//填充背景色，否则为全黑色；
//    
//    CGContextTranslateCTM(context, 0, rect.size.height);//设置位移，x，y；
//    
//    CGFloat under_bar_height = 64.0f;
//    CGContextScaleCTM(context, rect.size.width / mediaRect.size.width, -(rect.size.height + under_bar_height) / mediaRect.size.height);
//    
//    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
//    CGContextSetRenderingIntent(context, kCGRenderingIntentDefault);
//    CGContextDrawPDFPage(context, pageRef);//绘制pdf
//    
//    CGContextRestoreGState(context);
//    CGContextRelease(context);
    
}


@end

//
//  QRCodeGenerator.h
//  QR_CodeDemo
//
//  Created by liqunfei on 15/10/29.
//  Copyright © 2015年 chuchengpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface QRCodeGenerator : NSObject
//for ios7+ 生成二维码
- (UIImage *)imageWithSize:(CGFloat)size andColorWithRed:(CGFloat)red Green:(CGFloat)green Blue:(CGFloat)blue andQRString:(NSString *)qrString;
@end

//
//  CIFormatCPFNumber.h
//  FormataCPF
//
//  Created by Carlos Irano on 4/6/16.
//  Copyright © 2016 Carlos Irano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CIFormatCPFNumber : NSObject

+ (void)inTextField:(UITextField *)textField usingRange:(NSRange)range withString:(NSString *)string;

@end

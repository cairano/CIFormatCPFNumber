//
//  CIFormatCPFNumber.m
//  FormataCPF
//
//  Created by Carlos Irano on 4/6/16.
//  Copyright © 2016 Carlos Irano. All rights reserved.
//

#import "CIFormatCPFNumber.h"

@implementation CIFormatCPFNumber

+ (void)inTextField:(UITextField *)textField usingRange:(NSRange)range withString:(NSString *)string {
    
    // verify here if the character is a number
    
    // field maxlength
    if (textField.text.length >= 14 && range.length == 0) {
        return;
    }
    
    // secret sauce!
    NSString *textFieldWithString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    // while deleting
    if (range.length > 0) {
        switch ([self cleanString:textFieldWithString].length) {
            case 3:
            case 6:
            case 9:
                [textField setText: [textFieldWithString substringWithRange:NSMakeRange(0, textFieldWithString.length)]];
                break;
                
            default:
                break;
        }
    }
    
    // while typing
    else {
        
        switch ([self cleanString:textFieldWithString].length) {
            // insert dot
            case 4:
            case 7:
                [textField setText: [NSString stringWithFormat:@"%@%s", [textFieldWithString substringWithRange:NSMakeRange(0, textFieldWithString.length-1)], "."]];
                break;
                
            // insert dash
            case 10:
                [textField setText: [NSString stringWithFormat:@"%@%s", [textFieldWithString substringWithRange:NSMakeRange(0, textFieldWithString.length-1)], "-"]];
                break;
                
            default:
                break;
        }
    }
}

+ (NSString *)cleanString:(NSString *)texto {
    
    NSString *newString = [[texto componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]]
                           componentsJoinedByString: @""];
    
    return newString;
}

@end

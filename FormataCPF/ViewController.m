//
//  ViewController.m
//  FormataCPF
//
//  Created by Carlos Irano on 04/08/15.
//  Copyright (c) 2015 Carlos Irano. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *fieldCPF;
@property (weak, nonatomic) IBOutlet UIButton *botao;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        
    self.fieldCPF.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length >= MAX_LENGTH && range.length == 0)
    {
        return NO;
    }
    
    // tempero secreto!
    NSString *textFieldWithString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    // apagando caracter
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
    
    // digitando caracter
    else {
        
        switch ([self cleanString:textFieldWithString].length) {
                // coloca ponto
            case 4:
            case 7:
                [textField setText: [NSString stringWithFormat:@"%@%s", [textFieldWithString substringWithRange:NSMakeRange(0, textFieldWithString.length-1)], "."]];
                break;
                
                // coloca traço
            case 10:
                [textField setText: [NSString stringWithFormat:@"%@%s", [textFieldWithString substringWithRange:NSMakeRange(0, textFieldWithString.length-1)], "-"]];
                break;
                
            default:
                break;
        }
    }
    
    return YES;
}

- (NSString *)cleanString:(NSString *)texto {
    
    NSString *newString = [[texto componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]]
                           componentsJoinedByString: @""];
    
    return newString;
}

@end

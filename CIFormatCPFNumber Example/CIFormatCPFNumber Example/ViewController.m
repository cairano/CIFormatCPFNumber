//
//  ViewController.m
//  FormataCPF
//
//  Created by Carlos Irano on 04/08/15.
//  Copyright (c) 2015 Carlos Irano. All rights reserved.
//

#import "ViewController.h"
#import "CIFormatCPFNumber.h"

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

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    [CIFormatCPFNumber inTextField:textField usingRange:range withString:string];
    
    return YES;
}

@end

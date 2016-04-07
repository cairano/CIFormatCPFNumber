# CIFormatCPFNumber
Automatically format the number typed in an UITextField to CPF (Brazilian individual taxpayer registration). 

## Usage

Import `CIFormatCPFNumber` folder files to your project and include the `h` file in view controller.

```objective-c
#import "CIFormatCPFNumber.h"
```

In your view controller, set `UITextFieldDelegate` in `h` file.

```objective-c
@interface ViewController : UIViewController <UITextFieldDelegate>
```

And set the delegate of the `UITextField` in `m` file.

```objective-c
self.fieldCPF.delegate = self;
```

Create the `shouldChangeCharactersInRange` delegate and call the formatter within the code.

```objective-c
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

[CIFormatCPFNumber inTextField:textField usingRange:range withString:string];

return YES;
}
```

It's all!

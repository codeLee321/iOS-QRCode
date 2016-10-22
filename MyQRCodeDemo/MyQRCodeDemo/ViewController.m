//
//  ViewController.m
//  MyQRCodeDemo
//
//  Created by liqunfei on 16/3/3.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "QRCodeScanViewController.h"
#import "QRCodeGenerator.h"
@interface ViewController ()
{
    QRCodeGenerator *codeGenerator;
}
@property (weak, nonatomic) IBOutlet UIImageView *qrcodeImgView;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UIImageView *smallImgV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)scanQRCode:(UIButton *)sender {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusDenied || authStatus == AVAuthorizationStatusRestricted) {
        NSBundle *bundle =[NSBundle mainBundle];
        NSDictionary *info =[bundle infoDictionary];
        NSString *prodName =[info objectForKey:@"CFBundleDisplayName"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"无法打开相机" message:[NSString stringWithFormat:@"请在用户设置->隐私->相机->%@ 开启相机使用权限",prodName] delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
    else {
        QRCodeScanViewController *qrVC = [[QRCodeScanViewController alloc]initWithNibName:@"QRCodeScanViewController" bundle:nil];
        [self.navigationController pushViewController:qrVC animated:YES];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.myTextField resignFirstResponder];
}

- (IBAction)createQRCode:(UIButton *)sender {
    self.qrcodeImgView.image = nil;
    self.smallImgV.hidden = YES;
    codeGenerator = [[QRCodeGenerator alloc] init];
    if (self.myTextField.text.length > 0) {
        UIImage *image = [codeGenerator imageWithSize:self.qrcodeImgView.bounds.size.width andColorWithRed:164.0 Green:42.0 Blue:42.0 andQRString:self.myTextField.text];
        self.qrcodeImgView.image = image;
        self.smallImgV.hidden = NO;
    }
    
}



@end

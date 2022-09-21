//
//  ViewController.m
//  OrientationTest
//
//  Created by 范祎楠 on 2022/9/20.
//

#import "ViewController.h"
#import <OpenGLES/ES3/gl.h>

@interface ViewController () <UITextFieldDelegate>
@property (nonatomic, strong) UIButton *testView;
@property (nonatomic, assign) NSUInteger orientation;
@property (nonatomic, assign) BOOL isRotate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    glGetString(0);
    _testView = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 30)];
    _testView.backgroundColor = UIColor.redColor;
    [_testView addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_testView];
    _orientation = UIInterfaceOrientationMaskPortrait;
    _isRotate = NO;
}

- (void)test
{
    //强制调一次AppDelegate supportedInterfaceOrientationsForWindow，解决调试转屏失败的bug
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        UITextField *textField = [[UITextField alloc] init];
        [UIApplication.sharedApplication.keyWindow addSubview:textField];
        [textField becomeFirstResponder];
        [textField resignFirstResponder];
        [textField removeFromSuperview];
    });
    
    //防止未锁定屏幕方向时旋转失效
    NSNumber *value=[NSNumber numberWithInt:UIInterfaceOrientationUnknown];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    
    if (_isRotate) {
        _orientation = UIInterfaceOrientationMaskPortrait;
        NSNumber *value=[NSNumber numberWithInt:UIInterfaceOrientationPortrait];
        [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    } else {
        _orientation = UIInterfaceOrientationMaskLandscapeRight;
        NSNumber *value=[NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
        [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    }
    _isRotate = !_isRotate;

    NSLog(@"touch");
}

-(NSUInteger)supportedInterfaceOrientations
{
    return _orientation;
}
//-------------------------------------------------------------------------------
- (BOOL)shouldAutorotate
{
    return YES;//支持转屏
}

- (void)textFieldDidChange:(UITextField *)textField
{


}
@end

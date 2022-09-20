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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    glGetString(0);
    _testView = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 30)];
    _testView.backgroundColor = UIColor.redColor;
    [_testView addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_testView];
}

- (void)test
{
    UITextField *textField = [[UITextField alloc] init];
    [self.view addSubview:textField];
    [textField becomeFirstResponder];
    [textField resignFirstResponder];
    [textField removeFromSuperview];
    
    NSNumber *value=[NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];

}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
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

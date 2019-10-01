//
//  ViewController.m
//  FaceTrustI
//
//  Created by agilet-ryu on 2019/09/30.
//  Copyright © 2019 Fujitsu. All rights reserved.
//

#import "ViewController.h"
#import <FaceTrust/FaceTrustSDKI.h>
#import "FinplexResultViewController.h"
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW [UIScreen mainScreen].bounds.size.width
@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) NSArray *list;
@property (nonatomic, strong) UIScrollView *sc;
@property (nonatomic, assign) CGFloat keybordHeight;
@property (nonatomic, strong) FaceTrustResult *result;
@end

@implementation ViewController


- (NSArray *)list{
    if (!_list) {
        _list = @[@"API_SECRET",
                  @"THREHOLDS（１・２・３・４）",
                  @"UUID",
                  @"IMAGE_TYPE（１・２）",
                  @"NAME_FLG（０・１）",
                  @"KANA_FLG（０・１）",
                  @"BIRTH_FLG（０・１）",
                  @"PERMANENT_ADDRESS_FLG（０・１）",
                  @"ADDRESS_FLG（０・１）",
                  @"ISSUANCE_DATE_FLG（０・１）",
                  @"BAND_COLOR_FLG（０・１）",
                  @"NUMBER_FLG（０・１）",
                  @"EXPIRATION_FLG（０・１）",
                  @"TYPE_FLG（０・１）",
                  @"COMMISSION_FLG（０・１）",
                  @"CONDITION_FLG（０・１）",
                  @"DATE_NIKOGEN_FLG（０・１）",
                  @"DATE_OTHER_FLG（０・１）",
                  @"DATE_SECOND_FLG（０・１）",
                  @"SEX_FLG（０・１）",
                  @"GEOLOCATION_FLG（０・１）",
                  @"OTHER_FLG（０・１）",
                  @"BIZ_NO"
                  ];
    }
    return _list;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAction:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAction:) name:UIKeyboardWillHideNotification object:nil];
    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
    [start setFrame:CGRectMake(0, SCREENH - 50, SCREENW, 50)];
    start.backgroundColor = [UIColor redColor];
    [start addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [start setTitle:@"スタート" forState:UIControlStateNormal];
    [start setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:start];
    [self addTable];
}
static float CELLHeight = 90;
- (void)addTable{
    UIScrollView *s = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, SCREENW, SCREENH - 70)];
    s.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag | UIScrollViewKeyboardDismissModeInteractive;
    [self.view addSubview:s];
    for (int i = 0; i < self.list.count; i++) {
        UIView * bg = [[UIView alloc] initWithFrame:CGRectMake(0, CELLHeight * i, SCREENW, 90)];
        [s addSubview:bg];
        UILabel *ltf = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, SCREENW - 40, 30)];
        ltf.text = self.list[i];
        [bg addSubview:ltf];
        UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(20, 5+30, SCREENW - 40, 50)];
        //        tf.placeholder = self.list[i];
        tf.tag = 3000 + i;
        if (i < 4) {
            UILabel *l =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 15, 50)];
            l.textColor = [UIColor redColor];
            l.text = @"*";
            l.textAlignment = NSTextAlignmentCenter;
            tf.leftView = l;
            tf.leftViewMode = UITextFieldViewModeAlways;
            tf.clearButtonMode=UITextFieldViewModeWhileEditing;
            
            if (i == 0) {
                tf.text = @"kodllcruMHoytWikUiQuKmRSkCSR6oZO";
            }else if (i == 1){
                tf.text = @"1";
            }else if (i == 2){
                tf.text = @"liuboda";
            }else if (i == 3){
                tf.text = @"1";
            }
        }
        tf.borderStyle = UITextBorderStyleRoundedRect;
        tf.keyboardAppearance = UIKeyboardAppearanceAlert;
        tf.delegate = self;
        [bg addSubview:tf];
    }
    [s setContentSize:CGSizeMake(SCREENW, self.list.count * CELLHeight)];
    self.sc = s;
}

- (void)start{
    StartConfig *param = [StartConfig new];
    
    NSMutableArray *a = [NSMutableArray array];
    for (int i = 0; i < self.list.count; i++) {
        int tag = 3000 + i;
        UITextField *t = [self.sc viewWithTag:tag];
        [a addObject:t.text];
    }
    
    param.API_SECRET = a[0];
    if ([a[1] isEqualToString:@"1"]) {
        param.THREHOLDS_LEVEL = ONE;
    }else if ([a[1] isEqualToString:@"2"]){
        param.THREHOLDS_LEVEL = TWO;
    }else if ([a[1] isEqualToString:@"3"]){
        param.THREHOLDS_LEVEL = THREE;
    }else if ([a[1] isEqualToString:@"4"]){
        param.THREHOLDS_LEVEL = FOUR;
    }
    param.UUID = a[2];
    if ([a[3] isEqualToString:@"1"]) {
        param.IMAGE_TYPE = JPEG;
    }else if ([a[3] isEqualToString:@"2"]){
        param.IMAGE_TYPE = JPEG64;
    }
    param.NAME_FLG = [a[4] isEqualToString:@"0"] ? OFF : ON;
    param.KANA_FLG = [a[5] isEqualToString:@"0"] ? OFF : ON;
    param.BIRTH_FLG = [a[6] isEqualToString:@"0"] ? OFF : ON;
    param.PERMANENT_ADDRESS_FLG = [a[7] isEqualToString:@"0"] ? OFF : ON;
    param.ADDRESS_FLG = [a[8] isEqualToString:@"0"] ? OFF : ON;
    param.ISSUANCE_DATE_FLG = [a[9] isEqualToString:@"0"] ? OFF : ON;
    param.BAND_COLOR_FLG = [a[10] isEqualToString:@"0"] ? OFF : ON;
    param.NUMBER_FLG = [a[11] isEqualToString:@"0"] ? OFF : ON;
    param.EXPIRATION_FLG = [a[12] isEqualToString:@"0"] ? OFF : ON;
    param.TYPE_FLG = [a[13] isEqualToString:@"0"] ? OFF : ON;
    param.COMMISSION_FLG = [a[14] isEqualToString:@"0"] ? OFF : ON;
    param.CONDITION_FLG = [a[15] isEqualToString:@"0"] ? OFF : ON;
    param.DATE_NIKOGEN_FLG = [a[16] isEqualToString:@"0"] ? OFF : ON;
    param.DATE_OTHER_FLG = [a[17] isEqualToString:@"0"] ? OFF : ON;
    param.DATE_SECOND_FLG = [a[18] isEqualToString:@"0"] ? OFF : ON;
    param.SEX_FLG = [a[19] isEqualToString:@"0"] ? OFF : ON;
    param.GEOLOCATION_FLG = [a[20] isEqualToString:@"0"] ? OFF : ON;
    param.OTHER_FLG = [a[21] isEqualToString:@"0"] ? OFF : ON;
    param.BIZ_NO = a[22];
    
    // FinplexSDKを起動する
    __weak typeof(self) weakSelf = self;
    [FaceTrustManager startFaceTrust:self startParam:param callback:^(FaceTrustResult * _Nonnull result) {
        NSLog(@"SDK_RESULT == %@  ERROR_CODE == %@", result.SDK_RESULT, result.ERROR);
        weakSelf.result = result;
    }];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.result) {
        FinplexResultViewController  *finplexResultViewController = [[FinplexResultViewController alloc]init];
        finplexResultViewController.finplexResult = self.result;
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:finplexResultViewController];
        [self presentViewController:navi animated:NO completion:nil];
    }
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.result = nil;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField.tag > 3006) {
        [self.sc setFrame:CGRectMake(0, 0, SCREENW, SCREENH - self.keybordHeight)];
        [self.sc reloadInputViews];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag > 3006) {
        [self.sc setFrame:CGRectMake(0, 20, SCREENW, SCREENH - 70)];
        [self.sc reloadInputViews];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)keyboardAction:(NSNotification*)sender{
    NSDictionary *useInfo = [sender userInfo];
    NSValue *value = [useInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGFloat height = [value CGRectValue].size.height;
    self.keybordHeight = height;
    if ([sender.name isEqualToString:UIKeyboardWillShowNotification]) {
    } else {
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];}

@end

//
//  ImageViewController.m
//  FinplexiOS
//
//  Created by agilet-ryu on 2019/9/13.
//  Copyright © 2019 Fujitsu. All rights reserved.
//

#import "ImageViewController.h"
#define SCREENH [UIScreen mainScreen].bounds.size.height
#define SCREENW [UIScreen mainScreen].bounds.size.width
#import <AVKit/AVKit.h>
@interface ImageViewController ()
@property (nonatomic, strong) NSURL *url;
@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.textString){
        if ([self.textString containsString:@"VIDEO="]) {
            
            
            NSString *base64String = [self.textString substringFromIndex:6];
            NSData *videoData = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
            
            NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            
            NSString *imagePath = [NSString stringWithFormat:@"%@/Media", pathDocuments];
            
            [[NSFileManager defaultManager] createDirectoryAtPath:imagePath withIntermediateDirectories:YES attributes:nil error:nil];
            NSString *filePath = [imagePath stringByAppendingPathComponent:@"DJI_0024.mp4"];
            [videoData writeToFile:filePath atomically:YES];
            
            self.url = [NSURL fileURLWithPath:filePath];
            
            
            UIImage *i = [self getVideoPreViewImage:self.url];
            float H = i.size.height;
            float W = i.size.width;
            float r = H / W;
            float viewW = W > SCREENW ? SCREENW : W;
            float viewH = viewW * r;
            float x = (SCREENW - viewW) * 0.5;
            float y = (SCREENH - viewH) * 0.5;

            UIImageView *img = [[UIImageView alloc] initWithImage:i];
            [img setFrame:CGRectMake(x, y, viewW, viewH)];
            img.userInteractionEnabled = YES;
            [self.view addSubview:img];
            
            
            UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
            float viewW1 = 100;
            float viewH1 = 100;
            float x1 = (SCREENW - viewW1) * 0.5;
            float y1 = (SCREENH - viewH1) * 0.5;
            [b setFrame:CGRectMake(x1, y1, 100, 100)];
            [b setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
            [b addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:b];
            
        }else if ([self.textString containsString:@"IMAGE="]){
            NSString *base64String = [self.textString substringFromIndex:6];
            NSData *imageData = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
            self.img = [UIImage imageWithData:imageData];
        }else{
            NSString *tmp;
            UILabel *a = [[UILabel alloc] init];
            if ([self.textString containsString:@";"]) {
                tmp = [self.textString stringByReplacingOccurrencesOfString:@";" withString:@"\n"];
                [a setText:tmp];
            }else{
                [a setText:self.textString];
            }
            a.numberOfLines = 0;
            a.textAlignment = NSTextAlignmentCenter;
            [a setFrame:CGRectMake(0, 0, SCREENW, SCREENH)];
            [self.view addSubview:a];
        }
    }
    
    if (self.img) {
        float H = self.img.size.height;
        float W = self.img.size.width;
        float r = H / W;
        float viewW = W > SCREENW ? SCREENW : W;
        float viewH = viewW * r;
        float x = (SCREENW - viewW) * 0.5;
        float y = (SCREENH - viewH) * 0.5;
        UIImageView *i = [[UIImageView alloc] initWithImage:self.img];
        [i setFrame:CGRectMake(x, y, viewW, viewH)];
        [self.view addSubview:i];
    }
}

- (void)playVideo{
    
    
    AVPlayerViewController * play = [[AVPlayerViewController alloc]init];
    
    play.player = [[AVPlayer alloc]initWithURL:self.url];
    
    [self presentViewController:play animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (UIImage*)getVideoPreViewImage:(NSURL *)path
{
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:path options:nil];
    AVAssetImageGenerator *assetGen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    
    assetGen.appliesPreferredTrackTransform = YES;
    CMTime time = CMTimeMakeWithSeconds(0.0, 600);
    NSError *error = nil;
    CMTime actualTime;
    CGImageRef image = [assetGen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage *videoImage = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    return videoImage;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

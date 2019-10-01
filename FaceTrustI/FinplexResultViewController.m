//
//  FinplexResultViewController.m
//  FinplexiOS
//
//  Created by agilet-ryu on 2019/09/12.
//  Copyright © 2019 Fujitsu. All rights reserved.
//

#import "FinplexResultViewController.h"
#import <objc/runtime.h>
#import "ImageViewController.h"
#import <AVKit/AVKit.h>


@interface FinplexResultViewController ()

@end

static NSArray * allFinplexResultPropertyNames(){
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([FaceTrustResult class], &count);
    NSMutableArray *rv = [NSMutableArray array];
    unsigned i;
    for (i = 0; i < count; i++){
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        [rv addObject:name];
    }
    free(properties);
    return rv;
}

@implementation FinplexResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(actionCancel:)];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return allFinplexResultPropertyNames().count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NSString *strKey = allFinplexResultPropertyNames()[indexPath.row];
    id result = [self.finplexResult valueForKey:strKey];
    cell.textLabel.text = strKey;
    cell.imageView.image = nil;
    if([strKey containsString:@"_IMG"] || [strKey containsString:@"IMAGE_"]){
        if (![result isKindOfClass:[NSString class]]) {
            cell.imageView.image = [UIImage imageWithData:result];
            cell.detailTextLabel.text = @"";
        }else{
            cell.detailTextLabel.text = [NSString stringWithFormat:@"IMAGE=%@", result];
            cell.detailTextLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        }
    }else if([strKey containsString:@"THICKNESS_VIDEO"]){
        cell.detailTextLabel.text = [NSString stringWithFormat:@"VIDEO=%@", result];
        cell.detailTextLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    }else{
        cell.detailTextLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",
                                     [result isKindOfClass:[NSMutableArray class]]?[result componentsJoinedByString:@";"]:
                                 result];
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell.detailTextLabel.text containsString:@"VIDEO="]) {
        [self playVideoWithBase64String:cell.detailTextLabel.text];
    }else{
        ImageViewController *imgVC = [[ImageViewController alloc] init];
        if (cell.imageView.image) {
            imgVC.img = cell.imageView.image;
        }else{
            imgVC.textString = cell.detailTextLabel.text;
        }
        [self presentViewController:imgVC animated:YES completion:^{
            
        }];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(void)actionCancel:(id)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
    }];
}
- (void)playVideoWithBase64String:(NSString *)str{
    NSString *base64String = [str substringFromIndex:6];
    NSData *videoData = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
    NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *imagePath = [NSString stringWithFormat:@"%@/Media", pathDocuments];
    [[NSFileManager defaultManager] createDirectoryAtPath:imagePath withIntermediateDirectories:YES attributes:nil error:nil];
    NSString *filePath = [imagePath stringByAppendingPathComponent:@"DJI_0024.mp4"];
    [videoData writeToFile:filePath atomically:YES];
    AVPlayerViewController * play = [[AVPlayerViewController alloc]init];
    play.player = [[AVPlayer alloc]initWithURL:[NSURL fileURLWithPath:filePath]];
    [self presentViewController:play animated:YES completion:nil];
}
@end

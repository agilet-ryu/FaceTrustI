//
//  FinplexResultViewController.h
//  FinplexiOS
//
//  Created by agilet-ryu on 2019/09/12.
//  Copyright © 2019 Fujitsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FaceTrust/FaceTrustSDKI.h>
NS_ASSUME_NONNULL_BEGIN

@interface FinplexResultViewController : UITableViewController

@property(nonatomic,strong) FaceTrustResult *finplexResult;

@end

NS_ASSUME_NONNULL_END

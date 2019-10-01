//
//  FinplexManager.h
//  FinplexiOS
//
//  Created by agilet-ryu on 2019/9/2.
//  Copyright © 2019 Fujitsu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "StartConfig.h"
#import "FaceTrustResult.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^FaceTrustCallback)(FaceTrustResult* result);  // オンライン本人確認ライブラリ処理結果応答

@interface FaceTrustManager : NSObject

/**
 SDK初期化
 
 @param startParam 呼出元アプリ入力パラメータ
 @param callBack オンライン本人確認ライブラリ処理結果応答
 @param currentController 呼出元アプリのController
 @return Finplex初期化
 */
+ (instancetype)startFaceTrust:(UIViewController *)currentController
                    startParam:(StartConfig *)startParam
                      callback:(FaceTrustCallback)callBack;

@end

NS_ASSUME_NONNULL_END

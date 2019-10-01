//
//  Config.h
//  demoApp
//
//  Created by agilet-ryu on 2019/7/17.
//  Copyright © 2019 fujitsu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 顔照合の結果をOKとする他人受入率（FAR）の閾値を1～4で指定
 
 - ONE: 1：1/1,000
 - TWO: 2：1/10,000
 - THREE: 3：1/100,000
 - FOUR: 4：1/1,000,000
 */
typedef NS_ENUM(NSUInteger, THREHOLDS_LEVEL_ENUM) {
    ONE = 1,
    TWO = 2,
    THREE = 3,
    FOUR = 4
};

/**
 ライブラリの実行結果として受け取る画像の形式を1～4で指定
 
 - ImageTypeJPEG: 1：JPEG（バイナリデータ）
 - ImageTypeJPEGBase64: 2：JPEGBase64String（Base64文字列）
 */
typedef NS_ENUM(NSUInteger, IMAGE_TYPE_ENUM) {
    JPEG = 1,
    JPEG64 = 2,
};

/**
 情報を照合履歴として保持するか否かを指定、1の場合のみ、管理画面で情報の参照が可能
 
 - FLG_ENUMNOTSaveInDB: 0：保持しない
 - FLG_ENUMSaveInDB: 1：保持する
 */
typedef NS_ENUM(NSUInteger, FLG_ENUM) {
    OFF = 0,
    ON = 1
};

@interface StartConfig : NSObject
@property (nonatomic, copy) NSString *API_SECRET;  // 管理コンソールで発行のAPIキーを指定
@property (nonatomic, assign) THREHOLDS_LEVEL_ENUM THREHOLDS_LEVEL;  // 顔照合の結果をOKとする他人受入率（FAR）の閾値を1～4で指定
@property (nonatomic, copy) NSString *UUID;  // 端末上で動作するアプリケーションを一意に識別する文字列を指定
@property (nonatomic, assign) IMAGE_TYPE_ENUM IMAGE_TYPE;  // ライブラリの実行結果として受け取る画像の形式を1～2で指定
@property (nonatomic, assign) FLG_ENUM NAME_FLG;  // 運転免許証からOCRした氏名情報を照合履歴として保持するか否かを指定
@property (nonatomic, assign) FLG_ENUM KANA_FLG;  // 運転免許証からOCRした氏名カナ情報を照合履歴として保持するか否かを指定
@property (nonatomic, assign) FLG_ENUM BIRTH_FLG;  // 運転免許証からOCRした生年月日情報を照合履歴として保持するか否かを指定
@property (nonatomic, assign) FLG_ENUM PERMANENT_ADDRESS_FLG;  // 運転免許証からOCRした本籍地情報を照合履歴として保持するか否かを指定
@property (nonatomic, assign) FLG_ENUM ADDRESS_FLG;  // 運転免許証からOCRした住所情報を照合履歴として保持するか否かを指定
@property (nonatomic, assign) FLG_ENUM ISSUANCE_DATE_FLG;  // 運転免許証からOCRした交付日情報を照合履歴として保持するか否かを指定
@property (nonatomic, assign) FLG_ENUM BAND_COLOR_FLG;  // 運転免許証からOCRした有効期限帯色を照合履歴として保持するか否かを指定
@property (nonatomic, assign) FLG_ENUM NUMBER_FLG;  // 運転免許証からOCRした運転免許証番号を照合履歴として保持するか否かを指定
@property (nonatomic, assign) FLG_ENUM EXPIRATION_FLG;  // 運転免許証からOCRした有効期限を照合履歴として保持するか否かを指定
@property (nonatomic, assign) FLG_ENUM TYPE_FLG;  // 運転免許証からOCRした運転免許種類を照合履歴として保持するか否かを指定
@property (nonatomic, assign) FLG_ENUM COMMISSION_FLG;  // 運転免許証からOCRした公安委員会を照合履歴として保持するか否かを指定
@property (nonatomic, assign) FLG_ENUM CONDITION_FLG;  // 運転免許証からOCRした免許の条件等を照合履歴として保持するか否かを指定
@property (nonatomic, assign) FLG_ENUM DATE_NIKOGEN_FLG;  // 運転免許証からOCRした取得日（二・小・原）を照合履歴として保持するか否かを指定
@property (nonatomic, assign) FLG_ENUM DATE_OTHER_FLG;  // 運転免許証からOCRした取得日（他）を照合履歴として保持するか否かを指定
@property (nonatomic, assign) FLG_ENUM DATE_SECOND_FLG;  // 運転免許証からOCRした取得日（二種）を照合履歴として保持するか否かを指定
@property (nonatomic, assign) FLG_ENUM SEX_FLG;  // 運転免許証からOCRした性別を照合履歴として保持するか否かを指定
@property (nonatomic, assign) FLG_ENUM GEOLOCATION_FLG;  // 端末のGPSから取得した位置情報を照合履歴として保持するか否かを指定
@property (nonatomic, assign) FLG_ENUM OTHER_FLG;  // 上記以外の本人確認書類から取得した情報を照合履歴として保持するか否かを指定
@property (nonatomic, copy) NSString *BIZ_NO;  // 呼出元アプリから自由に設定項目。管理画面に登録する場合、設定
@end

NS_ASSUME_NONNULL_END

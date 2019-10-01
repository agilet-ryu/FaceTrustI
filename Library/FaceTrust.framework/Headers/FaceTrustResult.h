//
//  FinplexResult.h
//  FinplexiOS
//
//  Created by agilet-ryu on 2019/9/2.
//  Copyright © 2019 Fujitsu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FaceTrustResult : NSObject
@property (nonatomic, copy) NSString *SDK_RESULT;  // "オンライン本人確認結果認証処理結果"
@property (nonatomic, copy) NSString *RESULT;  // 顔照合結果
@property (nonatomic, copy) NSString *SCORE;  // 照合スコア
@property (nonatomic, copy) NSString *FAR;  //  他人受入率（FAR）
@property (nonatomic, copy) NSString *FRR;  // 本人拒否入率（FRR）
@property (nonatomic, copy) NSString *DOC_TYPE;  // 本人確認書類区分
@property (nonatomic, copy) NSString *GAIN_TYPE;  // 照合画像取得方法
@property (nonatomic, copy) NSString *ERROR;  // エラーコード
@property (nonatomic, strong) NSMutableArray *PROCESS_ID_LIST;
@property (nonatomic, strong) NSMutableArray *REQUEST_ID_LIST;
@property (nonatomic, strong) id IMAGE_REF1;  // 照合画像１
@property (nonatomic, strong) id IMAGE_REF2;  // 照合画像２
@property (nonatomic, strong) id OBVERSE_IMG_ID;  // 本人確認書類画像１
@property (nonatomic, strong) id REVERSE_IMG_ID;  // 本人確認書類画像２
@property (nonatomic, copy) NSString *THICKNESS_VIDEO; // 厚み撮影動画
@property (nonatomic, copy) NSString *LATITUDE;  // 位置情報（緯度）
@property (nonatomic, copy) NSString *LONGITUDE;  // 位置情報（経度）
@property (nonatomic, copy) NSString *NAME;  // 氏名
@property (nonatomic, copy) NSString *KANA;  // 氏名（カナ）
@property (nonatomic, copy) NSString *ADDRESS;  // 住所
@property (nonatomic, copy) NSString *BIRTH;  // 生年月日
@property (nonatomic, copy) NSString *NUMBER;  // 運転免許証番号
@property (nonatomic, copy) NSString *PERMANENT_ADDRESS;  // 本籍地
@property (nonatomic, copy) NSString *TYPE;  // 運転免許種類
@property (nonatomic, copy) NSString *BAND_COLOR;  // 有効期限帯色
@property (nonatomic, copy) NSString *SEX;  // 性別
@property (nonatomic, copy) NSString *EXPIRATION;  // 有効期限
@property (nonatomic, copy) NSString *ISSUANCE_DATE;  // 交付日
@property (nonatomic, copy) NSString *TYPE_NUM;  // 免許種類の枠数
@property (nonatomic, copy) NSString *CONDITION_1;  // 免許の条件等1
@property (nonatomic, copy) NSString *CONDITION_2;  // 免許の条件等2
@property (nonatomic, copy) NSString *CONDITION_3;  // 免許の条件等3
@property (nonatomic, copy) NSString *CONDITION_4;  // 免許の条件等4
@property (nonatomic, copy) NSString *DATE_NIKOGEN;  // 取得日（二・小・原）
@property (nonatomic, copy) NSString *DATE_OTHER;  // 取得日（他）
@property (nonatomic, copy) NSString *DATE_SECOND;  // 取得日（二種）
@property (nonatomic, copy) NSString *COMMISSION;  // 公安委員会
@property (nonatomic, copy) NSString *COMMON_NAME;  // NFC_運_通称名
@property (nonatomic, copy) NSString *UNIFY_NAME;  // NFC_運_統一氏名（カナ）
@property (nonatomic, copy) NSString *REFERENCE_NUMBER;  // NFC_運_照会番号
@property (nonatomic, copy) NSString *DATE_OGATA;  // NFC_運_取得日（大型）
@property (nonatomic, copy) NSString *DATE_FUTSU;  // NFC_運_取得日（普通）
@property (nonatomic, copy) NSString *DATE_OTOKU;  // NFC_運_取得日（大特）
@property (nonatomic, copy) NSString *DATE_DAIJINI;  // NFC_運_取得日（大自二）
@property (nonatomic, copy) NSString *DATE_FUJINI;  // NFC_運_取得日（普自二）
@property (nonatomic, copy) NSString *DATE_KOTOKU;  // NFC_運_取得日（小特）
@property (nonatomic, copy) NSString *DATE_GEN;  // NFC_運_取得日（原付）
@property (nonatomic, copy) NSString *DATE_KEIN;  // NFC_運_取得日（け引）
@property (nonatomic, copy) NSString *DATE_DAINI;  // NFC_運_取得日（大二）
@property (nonatomic, copy) NSString *DATE_FUNI;  // NFC_運_取得日（普二）
@property (nonatomic, copy) NSString *DATE_DAITOKUNI;  // NFC_運_取得日（大特二）
@property (nonatomic, copy) NSString *DATE_KEINNI;  // NFC_運_取得日（け引二）
@property (nonatomic, copy) NSString *DATE_CHUGATA;  // NFC_運_取得日（中型）
@property (nonatomic, copy) NSString *DATE_CHUNI;  // NFC_運_取得日（中二）
@property (nonatomic, copy) NSString *DATE_JUNCHUGATA;  // NFC_運_取得日（準中型）
@property (nonatomic, copy) NSString *NEW_COMMISSION_1;  // NFC_運_新公安委員会1
@property (nonatomic, copy) NSString *NEW_COMMISSION_2;  // NFC_運_新公安委員会2
@property (nonatomic, copy) NSString *NEW_COMMISSION_3;  // NFC_運_新公安委員会3
@property (nonatomic, copy) NSString *NEW_COMMISSION_4;  // NFC_運_新公安委員会4
@property (nonatomic, copy) NSString *NEW_COMMISSION_5;  // NFC_運_新公安委員会5
@property (nonatomic, copy) NSString *NEW_COMMISSION_6;  // NFC_運_新公安委員会6
@property (nonatomic, copy) NSString *NEW_COMMISSION_7;  // NFC_運_新公安委員会7
@property (nonatomic, copy) NSString *NEW_COMMISSION_8;  // NFC_運_新公安委員会8
@property (nonatomic, copy) NSString *NEW_COMMISSION_9;  // NFC_運_新公安委員会9
@property (nonatomic, copy) NSString *NEW_COMMISSION_10;  // NFC_運_新公安委員会10
@property (nonatomic, copy) NSString *NEW_COMMISSION_11;  // NFC_運_新公安委員会11
@property (nonatomic, copy) NSString *NEW_COMMISSION_12;  // NFC_運_新公安委員会12
@property (nonatomic, copy) NSString *NEW_COMMISSION_13;  // NFC_運_新公安委員会13
@property (nonatomic, copy) NSString *NEW_COMMISSION_14;  // NFC_運_新公安委員会14
@property (nonatomic, copy) NSString *NEW_COMMISSION_15;  // NFC_運_新公安委員会15
@property (nonatomic, copy) NSString *NEW_NAME_1;  // NFC_運_新氏名1
@property (nonatomic, copy) NSString *NEW_NAME_2;  // NFC_運_新氏名2
@property (nonatomic, copy) NSString *NEW_NAME_3;  // NFC_運_新氏名3
@property (nonatomic, copy) NSString *NEW_NAME_4;  // NFC_運_新氏名4
@property (nonatomic, copy) NSString *NEW_NAME_5;  // NFC_運_新氏名5
@property (nonatomic, copy) NSString *NEW_NAME_6;  // NFC_運_新氏名6
@property (nonatomic, copy) NSString *NEW_NAME_7;  // NFC_運_新氏名7
@property (nonatomic, copy) NSString *NEW_NAME_8;  // NFC_運_新氏名8
@property (nonatomic, copy) NSString *NEW_KANA_1;  // NFC_運_新氏名（カナ）1
@property (nonatomic, copy) NSString *NEW_KANA_2;  // NFC_運_新氏名（カナ）2
@property (nonatomic, copy) NSString *NEW_KANA_3;  // NFC_運_新氏名（カナ）3
@property (nonatomic, copy) NSString *NEW_KANA_4;  // NFC_運_新氏名（カナ）4
@property (nonatomic, copy) NSString *NEW_KANA_5;  // NFC_運_新氏名（カナ）5
@property (nonatomic, copy) NSString *NEW_KANA_6;  // NFC_運_新氏名（カナ）6
@property (nonatomic, copy) NSString *NEW_KANA_7;  // NFC_運_新氏名（カナ）7
@property (nonatomic, copy) NSString *NEW_KANA_8;  // NFC_運_新氏名（カナ）8
@property (nonatomic, copy) NSString *NEW_ADDRESS_1;  // NFC_運_新住所1
@property (nonatomic, copy) NSString *NEW_ADDRESS_2;  // NFC_運_新住所2
@property (nonatomic, copy) NSString *NEW_ADDRESS_3;  // NFC_運_新住所3
@property (nonatomic, copy) NSString *NEW_ADDRESS_4;  // NFC_運_新住所4
@property (nonatomic, copy) NSString *NEW_ADDRESS_5;  // NFC_運_新住所5
@property (nonatomic, copy) NSString *NEW_ADDRESS_6;  // NFC_運_新住所6
@property (nonatomic, copy) NSString *NEW_ADDRESS_7;  // NFC_運_新住所7
@property (nonatomic, copy) NSString *NEW_ADDRESS_8;  // NFC_運_新住所8
@property (nonatomic, copy) NSString *NEW_CONDITION_1;  // NFC_運_新条件1
@property (nonatomic, copy) NSString *NEW_CONDITION_2;  // NFC_運_新条件2
@property (nonatomic, copy) NSString *NEW_CONDITION_3;  // NFC_運_新条件3
@property (nonatomic, copy) NSString *NEW_CONDITION_4;  // NFC_運_新条件4
@property (nonatomic, copy) NSString *NEW_CONDITION_5;  // NFC_運_新条件5
@property (nonatomic, copy) NSString *NEW_CONDITION_6;  // NFC_運_新条件6
@property (nonatomic, copy) NSString *NEW_CONDITION_7;  // NFC_運_新条件7
@property (nonatomic, copy) NSString *NEW_CONDITION_8;  // NFC_運_新条件8
@property (nonatomic, copy) NSString *CONDITION_CANCEL_1;  // NFC_運_条件解除1
@property (nonatomic, copy) NSString *CONDITION_CANCEL_2;  // NFC_運_条件解除2
@property (nonatomic, copy) NSString *CONDITION_CANCEL_3;  // NFC_運_条件解除3
@property (nonatomic, copy) NSString *CONDITION_CANCEL_4;  // NFC_運_条件解除4
@property (nonatomic, copy) NSString *CONDITION_CANCEL_5;  // NFC_運_条件解除5
@property (nonatomic, copy) NSString *CONDITION_CANCEL_6;  // NFC_運_条件解除6
@property (nonatomic, copy) NSString *CONDITION_CANCEL_7;  // NFC_運_条件解除7
@property (nonatomic, copy) NSString *CONDITION_CANCEL_8;  // NFC_運_条件解除8
@property (nonatomic, copy) NSString *REMARKS_1;  // NFC_運_備考1
@property (nonatomic, copy) NSString *REMARKS_2;  // NFC_運_備考2
@property (nonatomic, copy) NSString *REMARKS_3;  // NFC_運_備考3
@property (nonatomic, copy) NSString *REMARKS_4;  // NFC_運_備考4
@property (nonatomic, copy) NSString *REMARKS_5;  // NFC_運_備考5
@property (nonatomic, copy) NSString *REMARKS_6;  // NFC_運_備考6
@property (nonatomic, copy) NSString *REMARKS_7;  // NFC_運_備考7
@property (nonatomic, copy) NSString *REMARKS_8;  // NFC_運_備考8
@property (nonatomic, copy) NSString *RESERVE_1;  // NFC_運_予備1
@property (nonatomic, copy) NSString *RESERVE_2;  // NFC_運_予備2
@property (nonatomic, copy) NSString *RESERVE_3;  // NFC_運_予備3
@property (nonatomic, copy) NSString *RESERVE_4;  // NFC_運_予備4
@property (nonatomic, copy) NSString *RESERVE_5;  // NFC_運_予備5
@property (nonatomic, copy) NSString *RESERVE_6;  // NFC_運_予備6
@property (nonatomic, copy) NSString *RESERVE_7;  // NFC_運_予備7
@property (nonatomic, copy) NSString *RESERVE_8;  // NFC_運_予備8
@property (nonatomic, copy) NSString *NEW_PERMANENT_ADDRESS_1;  // NFC_運_新本籍1
@property (nonatomic, copy) NSString *NEW_PERMANENT_ADDRESS_2;  // NFC_運_新本籍2
@property (nonatomic, copy) NSString *NEW_PERMANENT_ADDRESS_3;  // NFC_運_新本籍3
@property (nonatomic, copy) NSString *NEW_PERMANENT_ADDRESS_4;  // NFC_運_新本籍4
@property (nonatomic, copy) NSString *NEW_PERMANENT_ADDRESS_5;  // NFC_運_新本籍5
@property (nonatomic, copy) NSString *SERIAL_NUM;  // NFC_運_シリアル番号
@property (nonatomic, copy) NSString *ISSUER;  // NFC_運_発行者名
@property (nonatomic, copy) NSString *MAIN_PERSON;  // NFC_運_主体者名

@end

NS_ASSUME_NONNULL_END

//
//  MMHAssistant.h
//  MamHao
//
//  Created by Louis Zhu on 15/4/1.
//  Copyright (c) 2015年 Mamhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


//#if defined (DEBUG_LOUIS)
//#define LZLog( s, ... ) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
//#else
//#define     LZLog( s, ... )
//#endif
//
//
//#if defined (DEBUG_ARES)
//#define ARESLog( s, ... ) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
//#else
//#define     ARESLog( s, ... )
//#endif


extern BOOL mmh_option_contains_bit(NSUInteger option, NSUInteger bit);


extern CGFloat mmh_screen_scale();
extern CGFloat mmh_screen_width();
extern CGFloat mmh_pixel();


#define mmh_relative_float MMHFloat
#define mmh_relative_point MMHPoint
#define mmh_relative_size MMHSize
#define mmh_relative_rect MMHRect
#define mmh_relative_point_make MMHPointMake
#define mmh_relative_size_make MMHSizeMake
#define mmh_relative_rect_make MMHRectMake
#define mmh_relative_edgeInsets_make MMHEdgeInsetsMake


extern CGFloat MMHFloat(CGFloat floatValue);
extern CGFloat MMHFloatWithPadding(CGFloat floatValue, CGFloat padding);
extern CGPoint MMHPoint(CGPoint pointValue);
extern CGSize MMHSize(CGSize sizeValue);
extern CGRect MMHRect(CGRect rectValue);


extern CGPoint MMHPointMake(CGFloat x, CGFloat y);
extern CGSize MMHSizeMake(CGFloat width, CGFloat height);
extern CGRect MMHRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height);


extern UIEdgeInsets UIEdgeInsetsWithTop(CGFloat top);
extern UIEdgeInsets UIEdgeInsetsWithLeft(CGFloat left);
extern UIEdgeInsets UIEdgeInsetsWithBottom(CGFloat bottom);
extern UIEdgeInsets UIEdgeInsetsWithRight(CGFloat right);


extern UIEdgeInsets MMHEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);


extern CGFloat MMHFontSize(CGFloat pointSize);
extern UIFont *MMHFontOfSize(CGFloat pointSize);


extern CGSize CGSizePixelToPoint(CGSize sizeOfPixel);
extern CGSize CGSizePointToPixel(CGSize sizeOfPoint);
/////project -- SM
extern NSString * deviceUID();
extern NSString * dateStr();
extern NSString * appSign();

@interface NSObject (MamHao)

- (BOOL)notNilOrEmpty;

@end


@interface NSString (MamHao)

- (NSString *)md5String;
- (NSString *)sha1String;
- (BOOL)isEmptyAfterTrimmingWhitespaceAndNewlineCharacters;
- (NSString *)stringByTrimmingWhitespaceAndNewlineCharacters;

- (NSString *)URLEncodedStringWithCFStringEncoding:(CFStringEncoding)encoding;
- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;

+ (NSString *)stringWithDate:(NSDate *)date dateFormat:(NSString *)format;

- (NSComparisonResult)versionNumberCompare:(NSString *)string;

// 是否是邮箱
- (BOOL)conformsToEMailFormat;
// 长度是否在一个范围之内,包括范围值
- (BOOL)isLengthGreaterThanOrEqual:(NSInteger)minimum lessThanOrEqual:(NSInteger)maximum;

- (NSRange)firstRangeOfURLSubstring;
- (NSString *)firstURLSubstring;
- (NSString *)firstMatchUsingRegularExpression:(NSRegularExpression *)regularExpression;
- (NSString *)firstMatchUsingRegularExpressionPattern:(NSString *)regularExpressionPattern;
// 注意这个是全文匹配
- (BOOL)matchesRegularExpressionPattern:(NSString *)regularExpressionPattern;
- (NSRange)rangeOfFirstMatchUsingRegularExpressionPattern:(NSString *)regularExpressionPattern;

- (NSString *)stringByReplacingMatchesUsingRegularExpressionPattern:(NSString *)regularExpressionPattern withTemplate:(NSString *)templ;

- (CGSize)sizeWithSingleLineFont:(UIFont *)font;

- (id)jsonObject;

//+ (NSString *)stringWithPrice:(MMHPrice)price;
//- (MMHPrice)priceValue;
//+ (NSString *)stringWithMMHID:(MMHID)mmhid;
//- (MMHID)MMHIDValue;
+ (NSString *)stringWithMonthAge:(long)monthAge;

- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)maxWidth lineCount:(NSUInteger)maxLineCount;
- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)maxWidth lineCount:(NSUInteger)maxLineCount constrained:(BOOL *)constrained;



-(BOOL)checkPhoneNumInput:(NSString *)mobileNum;

@end


@interface NSNumber (MamHao)

//- (MMHPrice)priceValue;
//- (MMHID)MMHIDValue;

@end


@interface NSArray (MamHao)

- (id)firstObject;

- (NSArray *)arrayWithObjectsPassingTest:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))predicate;
- (NSArray *)arrayByRemovingObjectsOfClass:(Class)aClass;
- (NSArray *)arrayByKeepingObjectsOfClass:(Class)aClass;
- (NSArray *)arrayByRemovingObjectsFromArray:(NSArray *)otherArray;

- (id)objectPassingTest:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))predicate;
- (id)nullableObjectAtIndex:(NSInteger)index;

- (NSArray *)transformedArrayUsingHandler:(id (^)(id originalObject, NSUInteger index))handler;

- (NSString *)JSONString;

@end


@interface NSMutableArray (MamHao)

+ (NSMutableArray *)nullArrayWithCapacity:(NSUInteger)capacity;
- (void)removeObjectsPassingTest:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))predicate;
- (void)removeLatterObjectsToKeepObjectsNoMoreThan:(NSInteger)maxCount;
- (void)replaceObject:(id)anObject withObject:(id)anotherObject;
- (void)insertUniqueObject:(id)anObject;
- (void)insertUniqueObject:(id)anObject atIndex:(NSInteger)index;
- (void)insertUniqueObjectsFromArray:(NSArray *)otherArray;
- (void)appendUniqueObjectsFromArray:(NSArray *)otherArray;

- (void)moveObject:(id)object toIndex:(NSInteger)index;

@end


@interface NSDictionary (MamHao)

- (NSString *)stringRepresentationByURLEncoding;
- (NSString *)stringForKey:(id)key;

- (NSInteger)integerForKey:(id)key;
- (double)doubleForKey:(NSString *)key;

- (NSString *)JSONString;

- (BOOL)hasKey:(id)key;
@end


@interface NSMutableDictionary (MamHao)

- (void)setNullableObject:(id)anObject forKey:(id <NSCopying>)aKey;

@end


@interface UIColor (MamHao)

+ (UIColor *)colorWithIntegerRed:(NSInteger)r green:(NSInteger)g blue:(NSInteger)b;
+ (UIColor *)colorWithHexString:(NSString *)string;

+ (UIColor *)mamhaoMainColor;

@end


@interface UIFont (MamHao)

+ (NSArray *)allFontsWithSize:(CGFloat)fontSize;

+ (UIFont *)avenirMediumFontWithSize:(CGFloat)fontSize;
+ (UIFont *)avenirBookFontWithSize:(CGFloat)fontSize;

+ (UIFont *)helveticaNeueThinFontWithSize:(CGFloat)fontSize;
+ (UIFont *)helveticaNeueLightFontWithSize:(CGFloat)fontSize;
+ (UIFont *)helveticaNeueFontWithSize:(CGFloat)fontSize;
+ (UIFont *)helveticaNeueUltraLightFontWithSize:(CGFloat)fontSize;

+ (UIFont *)systemFontOfCustomeSize:(CGFloat)fontSize;
+ (UIFont *)boldSystemFontOfCustomeSize:(CGFloat)fontSize;

@end


@interface UIImage (MamHao)

// 如果参数比原image的size小，是截取原image相应的rect里的部分，如果参数比原image大，则是白底填充原image
- (UIImage *)imageInRect:(CGRect)aRect;
- (UIImage *)centerSquareImage;
- (UIImage *)imageScaledToFitUploadSize;
- (UIImage *)scaledToFitSize:(CGSize)size;
- (UIImage *)orientationFixedImage;
+ (UIImage *)retina4CompatibleImageNamed:(NSString *)imageName;
+ (UIImage *)patternImageWithColor:(UIColor *)color;

@end


@interface UIView (MamHao)

- (void)removeAllSubviews;
- (void)addSubviews:(NSArray *)sb;
- (void)addAlwaysFitSubview:(UIView *)subview;
- (void)addAlwaysFitSubview:(UIView *)subview withEdgeInsets:(UIEdgeInsets)edgeInsets;

- (void)bringToFront;
- (void)sendToBack;

- (CGFloat)height;
- (CGFloat)width;

- (void)setOrigin:(CGPoint)origin;
- (void)setSize:(CGSize)size;
- (void)setX:(CGFloat)x;
- (void)setY:(CGFloat)y;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (void)setMaxX:(CGFloat)maxX;
- (void)setMaxY:(CGFloat)maxY;

- (void)moveXOffset:(CGFloat)xOffset;
- (void)moveYOffset:(CGFloat)yOffset;
- (void)moveToCenterOfSuperview;

- (void)setTop:(CGFloat)top;
- (CGFloat)top;

- (void)setBottom:(CGFloat)bottom;
- (CGFloat)bottom;
- (void)moveToBottom:(CGFloat)bottom;

- (void)setCenterX:(CGFloat)centerX;
- (CGFloat)centerX;

- (void)setCenterY:(CGFloat)centerY;
- (CGFloat)centerY;

- (void)setLeft:(CGFloat)left;
- (CGFloat)left;

- (void)setRight:(CGFloat)right;
- (CGFloat)right;
- (void)moveToRight:(CGFloat)right;

- (void)attachToLeftSideOfView:(UIView *)otherView byDistance:(CGFloat)distance;
- (void)attachToRightSideOfView:(UIView *)otherView byDistance:(CGFloat)distance;
- (void)attachToBottomSideOfView:(UIView *)otherView byDistance:(CGFloat)distance;

- (UIImage *)snapshotWithScale:(CGFloat)scale;

- (void)makeRoundedRectangleShape;
- (void)setBorderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius;

- (void)addTopSeparatorLine;
- (void)addBottomSeparatorLine;

- (void)showProcessingView;
- (void)hideProcessingView;
- (void)showProcessingViewWithMessage:(NSString *)message;
- (void)showTips:(NSString *)tips;
- (void)showTipsWithError:(NSError *)error;

@end


@interface UIImageView (MamHao)

+ (instancetype)imageViewWithImageName:(NSString *)imageName;

@end


@interface UILabel (MamHao)

- (void)setFontSize:(NSInteger)size;
- (void)setTextWithDate:(NSDate *)date dateFormat:(NSString *)format;
//- (CGFloat)heightWithText:(NSString *)text;
- (void)updateHeight;
- (BOOL)setText:(NSString *)text constrainedToLineCount:(NSUInteger)maxLineCount;
- (void)setSingleLineText:(NSString *)text;
- (void)setSingleLineText:(NSString *)text constrainedToWidth:(CGFloat)maxWidth;
- (void)setSingleLineText:(NSString *)text keepingHeight:(BOOL)keepingHeight;
- (void)setSingleLineText:(NSString *)text constrainedToWidth:(CGFloat)maxWidth keepingHeight:(BOOL)keepingHeight;
- (void)setSingleLineText:(NSString *)text constrainedToWidth:(CGFloat)maxWidth withEdgeInsets:(UIEdgeInsets)edgeInsets;

- (void)setTextColor:(UIColor *)color inRange:(NSRange)range;
- (void)setTextColor:(UIColor *)color forSubstring:(NSString *)substring;
@end


@interface UIButton (MamHao)

+ (id)buttonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName title:(NSString *)title target:(id)target action:(SEL)action;

- (void)makeVerticalWithPadding:(CGFloat)padding;
+(UIButton *)systemButtonWithFrame:(CGRect)frame title:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor target:(id)target action:(SEL)action;
+(UIButton *)systemButtonWithFrame:(CGRect)frame title:(NSString *)title  value:(NSString *)value textColor:(UIColor *)textColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor target:(id)target action:(SEL)action;
@end


@interface UITextField (MamHao)

- (BOOL)isEmptyAfterTrimmingWhitespaceAndNewlineCharacters;

- (NSString *)nonNilText;

- (NSInteger)textLengh;

@end


@interface UIViewController (MamHao)

- (void)popWithAnimation;
- (void)dismissViewControllerWithAnimation;

- (void)showHudInView:(UIView *)view hint:(NSString *)hint;
- (void)hideHud;
- (void)showHint:(NSString *)hint;
// 从默认(showHint:)显示的位置再往上(下)yOffset
- (void)showHint:(NSString *)hint yOffset:(float)yOffset;


@end


@interface UITextView (MamHao)

- (BOOL)isEmptyAfterTrimmingWhitespaceAndNewlineCharacters;

@end


@interface UIBarButtonItem (MamHao)

+ (id)itemWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName title:(NSString *)title target:(id)target action:(SEL)action;
+ (id)itemWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName title:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;

@end


@interface UITableView (MamHao)

- (NSIndexPath *)lastIndexPath;
- (void)scrollToLastRowAnimated:(BOOL)animated;
- (BOOL)lastCellVisible;

@end


@interface UIApplication (MamHao)

- (void)clearNotificationMark;
+ (void)tryToCallPhoneNumber:(NSString *)phoneNumber;
@end


typedef NS_ENUM(NSInteger, LESScreenMode) {
    LESScreenModeIPhone4SOrEarlier,
    LESScreenModeIPhone5Series,
    LESScreenModeIPhone6,
    LESScreenModeIPhone6Plus,
    
    LESScreenModeIPadPortrait,
    LESScreenModeIPadLandscape,
    
    LESScreenModeUnknown,
};


@interface UIScreen (MamHao)

+ (LESScreenMode)currentScreenMode;

@end


@interface NSDate (MamHao)

//若format为nil ,默认为 yyyy.MM.dd HH: mm: ss 格式
- (NSString *)stringRepresentationWithDateFormat:(NSString *)format;

@end


@interface NSData (MamHao)

- (NSString *)md5String;

@end


@interface NSFileManager (MamHao)

+ (void)setExcludedFromBackup:(BOOL)excluded forFileAtpath:(NSString *)path;
- (unsigned long long int)documentsFolderSize:(NSString *)documentPath;
- (void)removeFileAtPath:(NSString *)path condition:(BOOL (^)(NSString *))block;
+ (BOOL)removeItemIfExistsAtPath:(NSString *)path error:(NSError **)error;

@end

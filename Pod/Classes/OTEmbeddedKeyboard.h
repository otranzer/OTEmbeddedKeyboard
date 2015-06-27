//
//  OTEmbeddedKeyboard.h
//  OTEmbeddedKeyboardExample
//
//  Created by Olivier Tranzer on 13/06/15.
//  Copyright (c) 2015 Olivier Tranzer. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OTEmbeddedKeyboardDatasource <NSObject>

@optional
- (NSArray *)labelsForKeyboard;
- (UIColor *)tintColorForButtons;
- (double)fontSizeForButtons;

@end

@protocol OTEmbeddedKeyboardDelegate <NSObject>

- (void)didClickOnNumber:(NSUInteger)number;
- (void)didAddComma;
- (void)didDeleteOneNumber;

@end

@interface OTEmbeddedKeyboard : UIView

/*
 * Base datasource protocol.
 */
@property (nonatomic, weak) id<OTEmbeddedKeyboardDatasource> datasource;

/*
 * Base delegate protocol.
 */
@property (nonatomic, weak) id<OTEmbeddedKeyboardDelegate> delegate;


+ (id)embeddedKeyboard;

@end

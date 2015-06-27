//
//  OTEmbeddedKeyboard.m
//  OTEmbeddedKeyboardExample
//
//  Created by Olivier Tranzer on 13/06/15.
//  Copyright (c) 2015 Olivier Tranzer. All rights reserved.
//

#import "OTEmbeddedKeyboard.h"

@interface OTEmbeddedKeyboard()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (weak, nonatomic) IBOutlet UIButton *buttonPoint;
@property (weak, nonatomic) IBOutlet UIButton *button0;
@property (weak, nonatomic) IBOutlet UIButton *buttonDelete;


@end

@implementation OTEmbeddedKeyboard

+ (id)embeddedKeyboard
{
    OTEmbeddedKeyboard *embeddedKeyboard = [[[NSBundle mainBundle] loadNibNamed:@"OTEmbeddedKeyboard" owner:nil options:nil] lastObject];
    
    // make sure customView is not nil or the wrong class!
    if ([embeddedKeyboard isKindOfClass:[OTEmbeddedKeyboard class]]) {
        
        // Set tags
        embeddedKeyboard.button0.tag = 0;
        embeddedKeyboard.button1.tag = 1;
        embeddedKeyboard.button2.tag = 2;
        embeddedKeyboard.button3.tag = 3;
        embeddedKeyboard.button4.tag = 4;
        embeddedKeyboard.button5.tag = 5;
        embeddedKeyboard.button6.tag = 6;
        embeddedKeyboard.button7.tag = 7;
        embeddedKeyboard.button8.tag = 8;
        embeddedKeyboard.button9.tag = 9;
        embeddedKeyboard.buttonPoint.tag = 10;
        embeddedKeyboard.buttonDelete.tag = 11;
        
        // Add targets
        [embeddedKeyboard.button0 addTarget:embeddedKeyboard action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
        [embeddedKeyboard.button1 addTarget:embeddedKeyboard action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
        [embeddedKeyboard.button2 addTarget:embeddedKeyboard action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
        [embeddedKeyboard.button3 addTarget:embeddedKeyboard action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
        [embeddedKeyboard.button4 addTarget:embeddedKeyboard action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
        [embeddedKeyboard.button5 addTarget:embeddedKeyboard action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
        [embeddedKeyboard.button6 addTarget:embeddedKeyboard action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
        [embeddedKeyboard.button7 addTarget:embeddedKeyboard action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
        [embeddedKeyboard.button8 addTarget:embeddedKeyboard action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
        [embeddedKeyboard.button9 addTarget:embeddedKeyboard action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
        [embeddedKeyboard.buttonPoint addTarget:embeddedKeyboard action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
        [embeddedKeyboard.buttonDelete addTarget:embeddedKeyboard action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
        
        return embeddedKeyboard;
    }
    else
        return nil;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Change labels
    if (self.datasource && [self.datasource respondsToSelector:@selector(labelsForKeyboard)]) {
        NSArray *labels = [self.datasource labelsForKeyboard];
        if ([labels count] != 11) {
            NSLog(@"[Error] Embedded keyboard datasource not 11 labels");
        }
        else {
            [self.button0 setTitle:labels[0] forState:UIControlStateNormal];
            [self.button1 setTitle:labels[1] forState:UIControlStateNormal];
            [self.button2 setTitle:labels[2] forState:UIControlStateNormal];
            [self.button3 setTitle:labels[3] forState:UIControlStateNormal];
            [self.button4 setTitle:labels[4] forState:UIControlStateNormal];
            [self.button5 setTitle:labels[5] forState:UIControlStateNormal];
            [self.button6 setTitle:labels[6] forState:UIControlStateNormal];
            [self.button7 setTitle:labels[7] forState:UIControlStateNormal];
            [self.button8 setTitle:labels[8] forState:UIControlStateNormal];
            [self.button9 setTitle:labels[9] forState:UIControlStateNormal];
            [self.buttonPoint setTitle:labels[10] forState:UIControlStateNormal];
        }
    }
    
    // Tint colors
    if (self.datasource && [self.datasource respondsToSelector:@selector(tintColorForButtons)]) {
        UIColor *buttonTintColor = [self.datasource tintColorForButtons];
        self.button0.tintColor = buttonTintColor;
        self.button1.tintColor = buttonTintColor;
        self.button2.tintColor = buttonTintColor;
        self.button3.tintColor = buttonTintColor;
        self.button4.tintColor = buttonTintColor;
        self.button5.tintColor = buttonTintColor;
        self.button6.tintColor = buttonTintColor;
        self.button7.tintColor = buttonTintColor;
        self.button8.tintColor = buttonTintColor;
        self.button9.tintColor = buttonTintColor;
        self.buttonPoint.tintColor = buttonTintColor;
        self.buttonDelete.tintColor = buttonTintColor;
    }
    
    // Font size
    if (self.datasource && [self.datasource respondsToSelector:@selector(fontSizeForButtons)]) {
        double fontSize = [self.datasource fontSizeForButtons];
        self.button0.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        self.button1.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        self.button2.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        self.button3.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        self.button4.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        self.button5.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        self.button6.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        self.button7.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        self.button8.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        self.button9.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        self.buttonPoint.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        self.buttonDelete.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    }

}

- (void)didClick:(id)sender
{
    UIView *view = (UIView *) sender;
    
    switch (view.tag) {
        case 0:
            if (self.delegate && [self.delegate respondsToSelector:@selector(didClickOnNumber:)]) [self.delegate didClickOnNumber:0];
            break;
        case 1:
            if (self.delegate && [self.delegate respondsToSelector:@selector(didClickOnNumber:)]) [self.delegate didClickOnNumber:1];
            break;
        case 2:
            if (self.delegate && [self.delegate respondsToSelector:@selector(didClickOnNumber:)]) [self.delegate didClickOnNumber:2];
            break;
        case 3:
            if (self.delegate && [self.delegate respondsToSelector:@selector(didClickOnNumber:)]) [self.delegate didClickOnNumber:3];
            break;
        case 4:
            if (self.delegate && [self.delegate respondsToSelector:@selector(didClickOnNumber:)]) [self.delegate didClickOnNumber:4];
            break;
        case 5:
            if (self.delegate && [self.delegate respondsToSelector:@selector(didClickOnNumber:)]) [self.delegate didClickOnNumber:5];
            break;
        case 6:
            if (self.delegate && [self.delegate respondsToSelector:@selector(didClickOnNumber:)]) [self.delegate didClickOnNumber:6];
            break;
        case 7:
            if (self.delegate && [self.delegate respondsToSelector:@selector(didClickOnNumber:)]) [self.delegate didClickOnNumber:7];
            break;
        case 8:
            if (self.delegate && [self.delegate respondsToSelector:@selector(didClickOnNumber:)]) [self.delegate didClickOnNumber:8];
            break;
        case 9:
            if (self.delegate && [self.delegate respondsToSelector:@selector(didClickOnNumber:)]) [self.delegate didClickOnNumber:9];
            break;
        case 10:
            if (self.delegate && [self.delegate respondsToSelector:@selector(didAddComma)]) [self.delegate didAddComma];
            break;
        case 11:
            if (self.delegate && [self.delegate respondsToSelector:@selector(didDeleteOneNumber)]) [self.delegate didDeleteOneNumber];
            break;
            
        default:
            NSLog(@"Error: unrecognised tag");
            break;
    }
}

@end

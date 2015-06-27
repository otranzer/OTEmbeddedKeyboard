//
//  OTViewController.m
//  OTEmbeddedKeyboard
//
//  Created by Olivier Tranzer on 27/06/15.
//  Copyright (c) 2015 Olivier. All rights reserved.
//

#import "OTViewController.h"

@interface OTViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *keyboardContainer;

@property (nonatomic, strong) OTEmbeddedKeyboard *embeddedKeyboard;

@end

@implementation OTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.embeddedKeyboard = [OTEmbeddedKeyboard embeddedKeyboard];
    self.embeddedKeyboard.frame = self.keyboardContainer.bounds;
    self.embeddedKeyboard.delegate = self;
    self.embeddedKeyboard.datasource = self;
    [self.keyboardContainer addSubview:self.embeddedKeyboard];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.embeddedKeyboard.frame = self.keyboardContainer.bounds;
    
}

#pragma mark - Embedded keyboard datasource

- (NSArray *)labelsForKeyboard
{
    return @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"."];
}

- (UIColor *)tintColorForButtons
{
    return [UIColor orangeColor];
}

- (double)fontSizeForButtons
{
    return 25;
}

#pragma mark - Embedded keyboard delegate

- (void)didClickOnNumber:(NSUInteger)number
{
    self.label.text = [NSString stringWithFormat:@"%@%lu", self.label.text, (unsigned long)number];
}

- (void)didAddComma
{
    self.label.text = [NSString stringWithFormat:@"%@%c", self.label.text, '.'];
}

- (void)didDeleteOneNumber
{
    if (self.label.text.length > 0) {
        self.label.text = [self.label.text substringToIndex:[self.label.text length] - 1];
    }
}
@end

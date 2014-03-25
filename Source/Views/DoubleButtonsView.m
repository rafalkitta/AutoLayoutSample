//
//  DoubleButtonsView.m
//  AutoLayoutSample
//
//  Created by Rafał Kitta on 3/24/14.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import "DoubleButtonsView.h"

@implementation DoubleButtonsView{
    // Butons arranged on the view
    UIButton *_button1;
    UIButton *_button2;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        // setup first-top button
        _button1 = [UIButton buttonWithType:UIButtonTypeSystem];
        _button1.translatesAutoresizingMaskIntoConstraints = NO;
        [_button1 setTitle:@"Button1"
                  forState:UIControlStateNormal];
        [self addSubview:_button1];
        
        // setup second-botom button
        _button2 = [UIButton buttonWithType:UIButtonTypeSystem];
        _button2.translatesAutoresizingMaskIntoConstraints = NO;
        [_button2 setTitle:@"Button2"
                  forState:UIControlStateNormal];
        [self addSubview:_button2];
        
        // setup constraints
        [self setupConstraints];
    }
    return self;
}

-(void)updateConstraints{
    // add your constraints
    [super updateConstraints];
}

- (void)setupConstraints{
    // NSDictionary with views
    NSDictionary *views = NSDictionaryOfVariableBindings(_button1, _button2);
    
    // Defining constraints in plain Visual Format Language
    NSString * const kFirstButtonHorizontal = @"H:|-10-[_button1(>=50)]-10-|";
    NSString * const kSecondButtonHorizontal = @"H:|-10-[_button2(>=50)]-10-|";
    NSString * const kButtonsVertical = @"V:|-10-[_button1(==22)]-(>=10)-[_button2(==_button1)]-10-|";
    
    // Horizontal constraints
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kFirstButtonHorizontal
                                                                 options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllCenterY
                                                                 metrics:0
                                                                   views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kSecondButtonHorizontal
                                                                 options:NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllCenterY
                                                                 metrics:0
                                                                   views:views]];
    // Vertical constraints
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kButtonsVertical
                                                                 options:NSLayoutFormatAlignAllLeft
                                                                 metrics:0
                                                                   views:views]];
}

#pragma mark - Setters
- (void)setFirstButtonsColor:(UIColor *)firstColor
          secondButtonsColor:(UIColor *)secondColor
{
    _button1.backgroundColor = firstColor;
    _button2.backgroundColor = secondColor;
}

@end

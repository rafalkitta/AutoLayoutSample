//
//  DoubleButtonsView.m
//  AutoLayoutSample
//
//  Created by Rafał Kitta on 3/24/14.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import "DoubleButtonsView.h"

@implementation DoubleButtonsView{
    UIButton *_button1;
    UIButton *_button2;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        //setup first-top button
        _button1 = [UIButton buttonWithType:UIButtonTypeSystem];
        _button1.translatesAutoresizingMaskIntoConstraints = NO;
        [_button1 setTitle:@"Button1"
                  forState:UIControlStateNormal];
        [self addSubview:_button1];
        
        //setup second-botom button
        _button2 = [UIButton buttonWithType:UIButtonTypeSystem];
        _button2.translatesAutoresizingMaskIntoConstraints = NO;
        [_button2 setTitle:@"Button2"
                  forState:UIControlStateNormal];
        [self addSubview:_button2];
        
        //setup constraints
        [self setupConstraints];
    }
    return self;
}

-(void)updateConstraints{
    // add your constraints
    [super updateConstraints];
}

- (void)setupConstraints{
    NSDictionary *views = NSDictionaryOfVariableBindings(_button1, _button2);
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_button1(>=50)]-10-|"
                                                                 options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllCenterY
                                                                 metrics:0
                                                                   views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_button2(>=50)]-10-|"
                                                                 options:NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllCenterY
                                                                 metrics:0
                                                                   views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[_button1(==22)]-(>=10)-[_button2(==_button1)]-10-|"
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

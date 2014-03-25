//
//  AutoLayoutProgView.m
//  AutoLayoutSample
//
//  Created by Rafał Kitta on 3/24/14.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import "AutoLayoutProgView.h"

@implementation AutoLayoutProgView{
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        // Setup views
        _view1 = [[UIView alloc] init];
        _view1.translatesAutoresizingMaskIntoConstraints = NO;
        _view1.backgroundColor = [UIColor redColor];
        [self addSubview:_view1];
        
        _view2 = [[UIView alloc] init];
        _view2.translatesAutoresizingMaskIntoConstraints = NO;
        _view2.backgroundColor = [UIColor greenColor];
        [self addSubview:_view2];
        
        _view3 = [[UIView alloc] init];
        _view3.translatesAutoresizingMaskIntoConstraints = NO;
        _view3.backgroundColor = [UIColor blueColor];
        [self addSubview:_view3];
        
        _view4 = [[UIView alloc] init];
        _view4.translatesAutoresizingMaskIntoConstraints = NO;
        _view4.backgroundColor = [UIColor yellowColor];
        [self addSubview:_view4];
        
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
    NSDictionary *views = NSDictionaryOfVariableBindings(_view1, _view2, _view3, _view4);
    
    // Defining constraints in plain Visual Format Language
    NSString * const kFirstAndSecondViewHorizontal = @"H:|-20-[_view1(>=100)]-20-[_view2(==_view1)]-20-|";
    NSString * const kThirdAndFourthViewHorizontal = @"H:|-20-[_view3(>=100)]-20-[_view4(==_view3)]-20-|";
    NSString * const kFirstAndThirdViewVertical = @"V:|-20-[_view1(>=100)]-20-[_view3(==_view1)]-80-|";
    NSString * const kSecondAndFourthViewVetical = @"V:|-20-[_view2(>=100)]-20-[_view4(==_view2)]-80-|";
    
    // Horizontal constraints
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kFirstAndSecondViewHorizontal
                                                                 options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllCenterY
                                                                 metrics:0
                                                                   views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kThirdAndFourthViewHorizontal
                                                                 options:NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllCenterY
                                                                 metrics:0
                                                                   views:views]];
    // Vertical constraints
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kFirstAndThirdViewVertical
                                                                 options:NSLayoutFormatAlignAllLeft
                                                                 metrics:0
                                                                   views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:kSecondAndFourthViewVetical
                                                                 options:NSLayoutFormatAlignAllLeft
                                                                 metrics:0
                                                                   views:views]];
}



@end

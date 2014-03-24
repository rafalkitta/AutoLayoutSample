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
        
//        [self setNeedsUpdateConstraints];
        [self setupConstraints];
        
    }
    return self;
}

-(void)updateConstraints{
    // add your constraints
    [super updateConstraints];
}

- (void)setupConstraints{
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_view1, _view2, _view3, _view4);
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_view1(>=100)]-20-[_view2(==_view1)]-20-|"
                                                                 options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllCenterY
                                                                 metrics:0
                                                                   views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[_view3(>=100)]-20-[_view4(==_view3)]-20-|"
                                                                 options:NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllCenterY
                                                                 metrics:0
                                                                   views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_view1(>=100)]-20-[_view3(==_view1)]-80-|"
                                                                 options:NSLayoutFormatAlignAllLeft
                                                                 metrics:0
                                                                   views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_view2(>=100)]-20-[_view4(==_view2)]-80-|"
                                                                 options:NSLayoutFormatAlignAllLeft
                                                                 metrics:0
                                                                   views:views]];
}



@end

//
//  AutoLayoutProgrammaticallyViewController.m
//  AutoLayoutSample
//
//  Created by Rafał Kitta on 19.03.2014.
//  Copyright (c) 2014 Rafał Kitta. All rights reserved.
//

#import "AutoLayoutProgrammaticallyViewController.h"
#import "AutoLayoutProgView.h"
#import "DoubleButtonsView.h"

@interface AutoLayoutProgrammaticallyViewController (){
    
    __weak AutoLayoutProgView *_view;
}

@end

@implementation AutoLayoutProgrammaticallyViewController

- (void)loadView{
    // get app frame
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    
    // create and assign view
    AutoLayoutProgView* view = [[AutoLayoutProgView alloc] initWithFrame:rect];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    view.backgroundColor = [UIColor whiteColor];
    self.view = view;
    
    // save weak referance
    _view = view;
    
    [self loadButtonsView];

}

- (void)loadButtonsView{
    
    DoubleButtonsView *buttons1 = [[DoubleButtonsView alloc] init];
    [_view.view1 addSubview:buttons1];
    
    DoubleButtonsView *buttons2 = [[DoubleButtonsView alloc] init];
    [buttons2 setFirstButtonsColor:[UIColor whiteColor]
                secondButtonsColor:[UIColor blackColor]];
    [_view.view2 addSubview:buttons2];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

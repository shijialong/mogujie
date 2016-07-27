//
//  BannerView.m
//  mogujie
//
//  Created by shijialong on 16/7/27.
//  Copyright © 2016年 shijialong. All rights reserved.
//

#import "BannerView.h"

@interface BannerView ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *bannerScrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation BannerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (UIScrollView *)bannerScrollView {
    if (!_bannerScrollView) {
        _bannerScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        
        _bannerScrollView.delegate = self;
        _bannerScrollView.pagingEnabled = YES;
        _bannerScrollView.showsVerticalScrollIndicator = NO;
        _bannerScrollView.showsHorizontalScrollIndicator = NO;
        
        for (NSUInteger i = 0; i < self.banners.count; i++) {
            CGRect frame = (CGRect){_bannerScrollView.frame.size.width * i, 0, _bannerScrollView.frame.size};
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
            
            [_bannerScrollView addSubview:imageView];
        }
        [self.timer invalidate];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
        _bannerScrollView.contentSize = CGSizeMake(_bannerScrollView.frame.size.width * self.banners.count, self.frame.size.height);
        _bannerScrollView.contentOffset = CGPointMake(0, 0);
    }
    return _bannerScrollView;
}

- (UIPageControl *)pageControl {

    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.currentPage = 0;
        _pageControl.numberOfPages = self.banners.count;
    }
    return _pageControl;
}

- (void)autoScroll {

}
@end

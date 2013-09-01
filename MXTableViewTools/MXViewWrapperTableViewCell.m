//
//  MXViewWrapperTableViewCell.m
//  MXTableViewTools
//
//  Created by Sebastiaan Besselsen.
//  Copyright (c) 2013 MixCom.
//

#import "MXViewWrapperTableViewCell.h"

@implementation MXViewWrapperTableViewCell

- (id)initWithView:(UIView *)view reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    
    [self.contentView removeFromSuperview];
    self.backgroundColor = [UIColor clearColor];
    self.innerView = view;
    
    return self;
}

- (void)setInnerView:(id)innerView {
    if (_innerView) {
        [_innerView removeFromSuperview];
    }
    if (![innerView isKindOfClass:[UIView class]]) {
        return;
    }
    if (innerView) {
        [self addSubview:innerView];
        [self layoutIfNeeded];
    }
    _innerView = innerView;
}

- (void)setViewInsets:(UIEdgeInsets)viewInsets {
    _viewInsets = viewInsets;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIEdgeInsets viewInsets = self.viewInsets;
    ((UIView *)self.innerView).frame = CGRectMake(viewInsets.left, viewInsets.top, self.bounds.size.width - viewInsets.left - viewInsets.right, self.bounds.size.height - viewInsets.top - viewInsets.bottom);
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize innerSizeConstraints = CGSizeMake(size.width - self.viewInsets.left - self.viewInsets.right, size.height - self.viewInsets.top - self.viewInsets.bottom);
    CGSize innerSize = [self.innerView sizeThatFits:innerSizeConstraints];
    return CGSizeMake(innerSize.width + self.viewInsets.left + self.viewInsets.right, innerSize.height + self.viewInsets.top + self.viewInsets.bottom);
}

@end
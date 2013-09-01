//
//  MXViewWrapperTableViewCell.h
//  MXTableViewTools
//
//  Created by Sebastiaan Besselsen.
//  Copyright (c) 2013 MixCom.
//

#import <UIKit/UIKit.h>

@interface MXViewWrapperTableViewCell : UITableViewCell

@property (assign, nonatomic) UIEdgeInsets viewInsets;
@property (weak, nonatomic) id innerView;

- (id)initWithView:(UIView *)view reuseIdentifier:(NSString *)reuseIdentifier;

@end

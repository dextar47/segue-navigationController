//
//  FaceView.h
//  Happiness
//
//  Created by Usman Ahmad on 8/24/12.
//  Copyright (c) 2012 Upanels. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FaceView;

@protocol FaceVIewDataSource
-(CGFloat)smileForFaceView:(FaceView *)faceView;
@end

@interface FaceView : UIView
@property (nonatomic) CGFloat scale;
-(void)pinch: (UIPinchGestureRecognizer *)gesture;
@property (nonatomic,weak) IBOutlet id <FaceVIewDataSource> dataSource;
@end

//
//  FaceView.m
//  Happiness
//
//  Created by Usman Ahmad on 8/24/12.
//  Copyright (c) 2012 Upanels. All rights reserved.
//

#import "FaceView.h"

@implementation FaceView
@synthesize scale = _scale;
#define DEFAULT_SCALE 0.90
-(CGFloat)scale {
    if(!_scale) {
        return DEFAULT_SCALE;
    } else {
        return _scale;
    }
}
-(void) setScale:(CGFloat)scale {
    if(_scale != scale) {
        _scale = scale;
        [self setNeedsDisplay];
    }
}

-(void)pinch: (UIPinchGestureRecognizer *)gesture {
    if(gesture.state == UIGestureRecognizerStateChanged
       || gesture.state == UIGestureRecognizerStateEnded) {
        self.scale *= gesture.scale;
        //self.smile *= gesture.scale;
        gesture.scale = 1;
    }
}

-(void) setup
{
    self.contentMode = UIViewContentModeRedraw;
}

-(void) awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        // Initialization code
    }
    return self;
}

-(void)drawCircletAtPoint:(CGPoint)p withRadius:(CGFloat)radius inContext:(CGContextRef)context {
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    CGContextAddArc(context, p.x, p.y, radius, 0, 2*M_PI, YES);
    CGContextStrokePath(context);
    UIGraphicsPopContext();
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    // draw a big circle for the face 
    CGPoint midPoint;
    // getting Mid point of the current View
    midPoint.x = self.bounds.origin.x+self.bounds.size.width/2;
    midPoint.y = self.bounds.origin.y+self.bounds.size.height/2;
    
    // getting size
    CGFloat size = self.bounds.size.width/2;
    if(self.bounds.size.width > self.bounds.size.height) size = self.bounds.size.height/2;
    
    size *= self.scale;
    
    CGContextSetLineWidth(context, 5.0);
    [[UIColor redColor] setStroke];
    [self drawCircletAtPoint:midPoint withRadius:size inContext:context];
    
    // draw 2 small circles for eyes
#define EYE_H 0.35
#define EYE_V 0.35
#define EYE_S 0.15
    
    CGPoint eye_p;
    eye_p.x = midPoint.x - size*EYE_H;
    eye_p.y = midPoint.y - size*EYE_V;
    
    [self drawCircletAtPoint:eye_p withRadius:size * EYE_S inContext:context];
    eye_p.x += size * EYE_H * 2;
    [self drawCircletAtPoint:eye_p withRadius:size * EYE_S inContext:context];

    // no nose
    // one smily
#define M_H 0.45
#define M_V 0.40
#define M_S 0.25
    CGPoint startPoint;
    startPoint.x = midPoint.x - size * M_H;
    startPoint.y = midPoint.y + size * M_V;
    CGPoint endPoint = startPoint;
    endPoint.x += M_H * size * 2;
    CGPoint CP1 = startPoint;
    CP1.x += M_H * size * 2/3;
    CGPoint CP2 = endPoint;
    CP2.x -= M_V * size * 2/3;
    
    CGFloat smile = [self.dataSource smileForFaceView:self];
    NSLog(@"%g",smile);
    if(smile > 1) smile = 1;
    if (smile < -1) smile = -1;
    CGFloat smileOffSet = M_S * size * smile;
    CP1.y += smileOffSet;
    CP2.y += smileOffSet;
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddCurveToPoint(context, CP1.x, CP1.y, CP2.x, CP2.y, endPoint.x, endPoint.y);
    CGContextStrokePath(context);
    
}
@end




















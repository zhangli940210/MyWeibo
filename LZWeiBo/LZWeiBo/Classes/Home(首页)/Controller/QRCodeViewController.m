//
//  QRCodeViewController.m
//  LZWeiBo
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 m14a. All rights reserved.
//

#import "QRCodeViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface QRCodeViewController () <UITabBarDelegate, AVCaptureMetadataOutputObjectsDelegate>

// 冲击波视图
@property (weak, nonatomic) IBOutlet UIImageView *scanLineView;
// 冲击波视图顶部约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scanLineCons;
// 扫描容器高度约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerHeightCons;
// 底部视图
@property (weak, nonatomic) IBOutlet UITabBar *customTabBar;

/** 会话*/
@property (nonatomic, strong) AVCaptureSession *session;
/** 拿到输入设备*/
@property (nonatomic, strong) AVCaptureDeviceInput *deviceInput;
/** 拿到输出对象*/
@property (nonatomic, strong) AVCaptureMetadataOutput *output;
/** 创建预览图层*/
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;
/** 创建用于绘制边线的图层*/
@property (nonatomic, strong) CALayer *drawLayer;
/** 显示扫描二维码之后的数据结果*/
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation QRCodeViewController

#pragma mark - 懒加载
- (AVCaptureSession *)session
{
    if (_session == nil) {
        _session = [[AVCaptureSession alloc] init];
    }
    return _session;
}

- (AVCaptureDeviceInput *)deviceInput
{
    if (_deviceInput == nil) {
        // 获取摄像头
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        // 创建输入对象
        NSError *error = nil;
        AVCaptureDeviceInput *input = [[AVCaptureDeviceInput alloc] initWithDevice:device error:&error];
        // 如果出错,返回nil
        if (error)  return nil;
        // 来到下面说明正确,直接赋值
        _deviceInput = input;
    }
    return _deviceInput;
}

- (AVCaptureMetadataOutput *)output
{
    if (_output == nil) {
        _output = [[AVCaptureMetadataOutput alloc] init];
    }
    return _output;
}

- (AVCaptureVideoPreviewLayer *)previewLayer
{
    if (_previewLayer == nil) {
        AVCaptureVideoPreviewLayer *layer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
        layer.frame = [UIScreen mainScreen].bounds;
        _previewLayer = layer;
    }
    return _previewLayer;
}

- (CALayer *)drawLayer
{
    if (_drawLayer == nil) {
        CALayer *layer = [[CALayer alloc] init];
        layer.frame = [UIScreen mainScreen].bounds;
        _drawLayer = layer;
    }
    return _drawLayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.设置底部视图默认选中第0个
    self.customTabBar.selectedItem = self.customTabBar.items[0];
    self.customTabBar.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 1.开始冲击波动画
    [self startAnimation];
    // 2.开始扫描
    [self startScan];
}

/**
 *  扫描二维码
 */
- (void)startScan
{
    // 1.判断是否能够将输入添加到会话中
    if (![self.session canAddInput:self.deviceInput]) {
        return;
    }
    // 2.判断是否能够将输出添加到会话中
    if (![self.session canAddOutput:self.output]) {
        return;
    }
    // 3.将输入和输出都添加到会话中
    [self.session addInput:self.deviceInput];
    [self.session addOutput:self.output];
    // 4.设置输出能够解析的数据类型
    // 注意: 设置能够解析的数据类型, 一定要在输出对象添加到会员之后设置, 否则会报错
//    self.output.metadataObjectTypes = self.output.availableMetadataObjectTypes;

    [self.output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
//  [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
    // 5.设置输出对象的代理, 只要解析成功就会通知代理
    [self.output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    [self.view.layer insertSublayer:self.previewLayer atIndex:0];
    
    // 6.告诉session开始扫描
    [self.session startRunning];
}

// 退出界面
- (IBAction)closeBtnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 执行动画
 */
- (void)startAnimation
{
    // 让约束从顶部开始
    // 从-300 开始
    self.scanLineCons.constant = - self.containerHeightCons.constant;
    [self.scanLineView layoutIfNeeded];
    // 执行冲击波动画
    [UIView animateWithDuration:2.0 animations:^{
        // 1.修改约束
        self.scanLineCons.constant = self.containerHeightCons.constant;
        // 设置动画指定的次数
        [UIView setAnimationRepeatCount:MAXFLOAT];
        // 2.强制更新界面
        [self.scanLineView layoutIfNeeded];
    }];
}

#pragma mark - UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    // 1.修改容器的高度
    if (item.tag == 1) {    // 二维码
        self.containerHeightCons.constant = 300;
    } else {    // 条形码
        self.containerHeightCons.constant = 150;
    }
    // 2.停止动画
    [self.scanLineView.layer removeAllAnimations];
    // 3.重新开始动画
    [self startAnimation];
}

/**
 清空边线
 */

- (void)clearConers
{
    // 1.判断drawLayer上是否有其它图层
    if (self.drawLayer.sublayers == nil || self.drawLayer.sublayers.count == 0) {
        return;
    }
    
    // 2.移除所有子图层
    for (CALayer *subLayer in self.drawLayer.sublayers) {
        [subLayer removeFromSuperlayer];
    }
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate方法
// 只要解析到数据就会调用
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    // 0.清空图层
    [self clearConers];
    // 1.获取扫描到的数据
    /*
//    self.resultLabel.text = metadataObjects.last?.stringValue
//    let str = metadataObjects.last?.stringValue
//    self.resultLabel.sizeToFit()
     */
    /*
     //    self.resultLabel.text = [[metadataObjects lastObject] stringValue];
     //    [self.resultLabel sizeToFit];
    // 注意: 要使用stringValue
//    NSString *str = [[metadataObjects lastObject] stringValue];
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    */
    if (metadataObjects.count > 0) {
        AVMetadataMachineReadableCodeObject *object = [metadataObjects lastObject];
        NSString *str = object.stringValue;
        self.resultLabel.text = str;
        [self.resultLabel sizeToFit];
//        LZLog(@"str = %@", str);
        // 关闭会话
        [self.session stopRunning];
//        [self.layer removeFromSuperlayer];
    }
    /*
    // 2.获取扫描到的二维码的位置
    // 2.1转换坐标
    
    for (id object in metadataObjects) {
        
        // 2.1.1判断当前获取到的数据, 是否是机器可识别的类型
        if ([object isKindOfClass:[AVMetadataMachineReadableCodeObject class]]) {
            
            // 2.1.2将坐标转换界面可识别的坐标
            AVMetadataObject *codeObject = [self.previewLayer transformedMetadataObjectForMetadataObject:(AVMetadataObject *)(object)];
            // 2.1.3绘制图形
            [self drawCorners:(AVMetadataMachineReadableCodeObject *)(codeObject)];
        }
    }
     */
}

/**
 绘制图形
 
 :param: codeObject 保存了坐标的对象
 */

- (void)drawCorners:(AVMetadataMachineReadableCodeObject *)codeObject
{
    if (codeObject.corners.count == 0) {
        return;
    }
    // 1.创建一个图层
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.lineWidth = 4;
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    // 2.创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint point = CGPointZero;
    NSInteger index = 0;
    // 2.1移动到第一个点
    // 从corners数组中取出第0个元素, 将这个字典中的x/y赋值给point
    CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)codeObject.corners[index++] , &point);
    
    [path moveToPoint:point];
    // 2.2移动到其它的点
    while (index < codeObject.corners.count) {
        CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)codeObject.corners[index++] , &point);
        [path addLineToPoint:point];
    }
    // 2.3关闭路径
    [path closePath];
    // 2.4绘制路径
    layer.path = path.CGPath;
    // 3.将绘制好的图层添加到drawLayer上
    [self.drawLayer addSublayer:layer];
}

@end

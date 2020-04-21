//
//  ViewController.m
//  CFFilterDemo
//
//  Created by Eric on 2020/4/21.
//  Copyright © 2020 song yang. All rights reserved.
//
/*  一些有意思的滤镜 （219 个找的）
CICode128BarcodeGenerator
CICircularScreen
CICMYKHalftone
CIColorInvert
CIColorMonochrome
CIComicEffect
CIDepthOfField
CIDiscBlur
CIDither
CIDocumentEnhancer
CIDotScreen
CIEdges
CIGaborGradients
CIHatchedScreen
CIHeightFieldFromMask
CILinearToSRGBToneCurve
CILineOverlay
CILineScreen
CIMaximumComponent
CIMinimumComponent
CIMorphologyGradient
CIPhotoEffectFade
CIPhotoEffectChrome
CIPhotoEffectInstant
CIPhotoEffectMono
CIPhotoEffectNoir
CIPhotoEffectProcess
CIPhotoEffectTonal
CIPhotoEffectTransfer
CIPinchDistortion
CIPointillize
CISepiaTone
CISpotColor
CISpotLight
CISRGBToneCurveToLinear
CITorusLensDistortion
CITwirlDistortion
CIVignetteEffect
 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSInteger i;
    UIImageView *imageView;
    NSArray *array;
    CIImage *image1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"scenery.jpg"];
    imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
//    imageView.image = [UIImage imageNamed:@"scenery.jpg"];
    [self.view addSubview:imageView];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    array =  @[@"CICircularScreen",
               @"CICMYKHalftone",
               @"CIColorInvert",
               @"CIColorMonochrome",
               @"CIComicEffect",
               @"CIDepthOfField",
               @"CIDiscBlur",
               @"CIDither",
               @"CIDocumentEnhancer",
               @"CIDotScreen",
               @"CIEdges",
               @"CIGaborGradients",
               @"CIHatchedScreen",
               @"CIHeightFieldFromMask",
               @"CILinearToSRGBToneCurve",
               @"CILineOverlay",
               @"CILineScreen",
               @"CIMaximumComponent",
               @"CIMinimumComponent",
               @"CIMorphologyGradient",
               @"CIPhotoEffectFade",
               @"CIPhotoEffectChrome",
               @"CIPhotoEffectInstant",
               @"CIPhotoEffectMono",
               @"CIPhotoEffectNoir",
               @"CIPhotoEffectProcess",
               @"CIPhotoEffectTonal",
               @"CIPhotoEffectTransfer",
               @"CIPinchDistortion",
               @"CIPointillize",
               @"CISepiaTone",
               @"CISpotColor",
               @"CISpotLight",
               @"CISRGBToneCurveToLinear",
               @"CITorusLensDistortion",
               @"CITwirlDistortion",
               @"CIVignetteEffect"];
    NSLog(@"%@",array);
    image1 = [CIImage imageWithCGImage:[image CGImage]];
    [self filterTest];
    
    
}

- (void)filterTest{
    if(i>=array.count ) {
     return;
    }
    CIFilter* filter = [CIFilter filterWithName:array[i]];
    
    [filter setValue:image1 forKey:kCIInputImageKey];
   
    CIImage *resultImage = filter.outputImage;
      
    UIImage *resultImg = [UIImage imageWithCIImage:resultImage];
    [imageView setImage:resultImg];
    [self performSelector:@selector(filterTest) withObject:nil afterDelay:1];
    i++;
}
@end

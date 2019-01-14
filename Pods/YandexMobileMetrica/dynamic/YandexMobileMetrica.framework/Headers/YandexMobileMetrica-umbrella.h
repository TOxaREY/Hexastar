#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "YandexMobileMetrica.h"
#import "YMMCompletionBlocks.h"
#import "YMMProfileAttribute.h"
#import "YMMReporterConfiguration.h"
#import "YMMRevenueInfo.h"
#import "YMMUserProfile.h"
#import "YMMVersion.h"
#import "YMMYandexMetrica.h"
#import "YMMYandexMetricaConfiguration.h"
#import "YMMYandexMetricaPreloadInfo.h"
#import "YMMYandexMetricaReporting.h"

FOUNDATION_EXPORT double YandexMobileMetricaVersionNumber;
FOUNDATION_EXPORT const unsigned char YandexMobileMetricaVersionString[];


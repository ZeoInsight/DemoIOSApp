//
//  ZBAnalytics.h
//  ZBAnalytics
//


#import <Foundation/Foundation.h>

@protocol ZBAnalyticsDelegate;

typedef enum
{
	kZBNoneTargetType							= 1 << 0,
	kZBUIViewControllerTargetType				= 1 << 1,
	kZBUIViewTargetType							= 1 << 2,
	kZBUITextInteractionAssistantType			= 1 << 3,
	kZBAnyTargetType							= 1 << 4
	
} ZBAnalyticsTargetTypesForHandlingGestureRecognizer;

typedef enum
{
	kZBAnalyticsCustomVariable1 = 0,
	kZBAnalyticsCustomVariable2,
	kZBAnalyticsCustomVariable3,
	kZBAnalyticsCustomVariable4,
	kZBAnalyticsCustomVariable5
} ZBAnalyticsCustomVariable;

@interface ZBAnalytics : NSObject

@property (assign) id<ZBAnalyticsDelegate> delegate;
@property (nonatomic) BOOL runtimeIntrusive;
@property (assign) BOOL flushEventsOnQuittingApp;

+ (BOOL)isEnabled;
+ (void)setEnabled:(BOOL)flag;
+ (void)setProductKey:(NSString *)productKey;

// Workaround, should be implemented on the server side.
+ (BOOL) isPrimaryProcess;
+ (void) setPrimaryProcess: (BOOL) flag;

+ (BOOL) usesCellularNetwork;
+ (void) setUsesCellularNetwork: (BOOL) flag;

+ (ZBAnalytics *)analytics;

- (void)addCustomEventWithName:(NSString *)name;
- (void)addCustomEventAndSendSynchronouslyWithName:(NSString *)name;
- (BOOL)addCustomEventAndSendSynchronouslyWithName:(NSString *)name maxTimeout:(NSTimeInterval)maxTimeout;

- (BOOL)flushAllEventsWithTimeout:(NSTimeInterval)maxTimeout;

- (void)setName:(NSString *)name forCustomVariable:(ZBAnalyticsCustomVariable)variable;
- (void)setValue:(NSString *)value forCustomVariable:(ZBAnalyticsCustomVariable)variable;

+ (ZBAnalyticsTargetTypesForHandlingGestureRecognizer) targetTypeForHandlingGestureRecognizer;
+ (void) setTargetTypeForHandlingGestureRecognizer: (ZBAnalyticsTargetTypesForHandlingGestureRecognizer) targetType;

@end


@protocol ZBAnalyticsDelegate <NSObject>
@optional
- (BOOL) analyticsShouldAddEventID:(NSString *)eventIdentifier sender:(id)sender userInfo:(NSDictionary *)userInfo;

@end


@protocol ZBAnalyticsCustomIdObject <NSObject>

+ (NSArray *)keysForCustomIdGenerationForAnalytics;

@end

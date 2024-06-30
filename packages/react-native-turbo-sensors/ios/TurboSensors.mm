#import "TurboSensors.h"
//#import "MotionSensor.h"

@implementation TurboSensors
RCT_EXPORT_MODULE();

- (id)init {
    self = [super init];
    if (self) {
        _sensorMap = [NSMutableDictionary dictionary];
//        [_sensorMap setObject:[[MotionSensors alloc] init:@"accelerometer"] forKey:@"accelerometer"];
//        [_sensorMap setObject:[[MotionSensors alloc] init:@"gyroscope"] forKey:@"gyroscope"];
//        [_sensorMap setObject:[[MotionSensors alloc] init:@"magnetometer"] forKey:@"magnetometer"];
//        [_sensorMap setObject:[[MotionSensors alloc] init:@"gravity"] forKey:@"gravity"];
    }
    return self;
}

+ (BOOL)requiresMainQueueSetup
{
    return NO;
}

- (NSArray<NSString *> *)supportedEvents {
    return @[@"accelerometerEvent"];
}

- (void)sendEvent:(NSString *)eventName body:(id)body {
    [self sendEventWithName:eventName body:body];
}

// Will be called when this module's first listener is added.
- (void)startObserving {
    // Set up any upstream listeners or background tasks as necessary
}

// Will be called when this module's last listener is removed, or on dealloc.
- (void)stopObserving {
    // Remove upstream listeners, stop unnecessary background tasks
    // If we no longer have listeners registered we should also probably also stop the sensor since the sensor events are essentially being dropped.
}

RCT_EXPORT_METHOD(isAvailable:(NSString *)sensor
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject) {
//   if ([_sensorMap objectForKey:sensor] != nil) {
//       resolve(@[_sensorMap objectForKey:sensor isAvailable]);
       resolve(@YES);
//   } else {
//       reject(@"sensor_not_found", @"Sensor not found", nil);
//   }
}

RCT_EXPORT_METHOD(setInterval:(NSString *)sensor
                  newInterval:(double)newInterval) {
//   if ([_sensorMap objectForKey:sensor] != nil) {
//     [_sensorMap objectForKey:sensor setInterval:newInterval];
//   }
}

RCT_EXPORT_METHOD(startListening:(NSString *)sensor) {
//   if ([_sensorMap objectForKey:sensor] != nil) {
//     [_sensorMap objectForKey:sensor startListening];
//   }
}

RCT_EXPORT_METHOD(stopListening:(NSString *)sensor) {
//   if ([_sensorMap objectForKey:sensor] != nil) {
//     [_sensorMap objectForKey:sensor stopListening];
//   }
}

// Don't compile this code when we build for the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeTurboSensorsSpecJSI>(params);
}
#endif

@end

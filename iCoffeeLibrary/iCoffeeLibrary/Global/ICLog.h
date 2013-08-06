//
//  ICLog.h
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/8/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#ifndef ICLibrary_ICLog_h
#define ICLibrary_ICLog_h

#ifdef DEBUG

#define ICDebugLog(fmt, ...) NSLog((@"%s [Line %d]\n" fmt @"\n\n\n"), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#else

#define ICDebugLog(...)

#endif

#define ICLog(fmt, ...) NSLog((@"%s [Line %d]" fmt @"\n\n\n"), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#endif

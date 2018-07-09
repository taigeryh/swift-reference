//
//  Logger.swift
//  swift-reference
//
//  Created by taiyh on 2018/7/6.
//  Copyright © 2018年 __ORGANIZATION__. All rights reserved.
//

import Foundation
import CocoaLumberjack


#if DEBUG
    let ddLogLevel = DDLogLevel.verbose
#else
    let ddLogLevel = DDLogLevel.error
#endif



class LoggerFormatter:NSObject, DDLogFormatter {
    func format(message logMessage: DDLogMessage) -> String? {
        var logLevel = ""
        switch logMessage.flag {
            case .error: logLevel = "❗️❗️❗️"
            case .warning: logLevel = "⚠️⚠️⚠️"
            case .info: logLevel = "ℹ️ℹ️ℹ️"
            case .debug: logLevel = "🔧🔧🔧"
            default: logLevel = ""
        }
        return String(format:"%@ --- %@ --- %@ --- %@ --- %@ ---","\(logLevel)","\(logMessage.fileName)","\(String(describing: logMessage.function))","\(logMessage.line)","\(logMessage.message)")
    }
}

class Logger {
    
    static func config() {
        
        DDLog.add(DDTTYLogger.sharedInstance, with: ddLogLevel) // TTY = Xcode console
        DDLog.add(DDASLLogger.sharedInstance, with: ddLogLevel) // ASL = Apple System Logs
        
        let fileLogger: DDFileLogger = DDFileLogger() // File Logger
        fileLogger.rollingFrequency = TimeInterval(60*60*24)  // 24 hours
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        DDLog.add(fileLogger)
        
        DDTTYLogger.sharedInstance.logFormatter = LoggerFormatter()
    }
}



public func Log(_ message: @autoclosure () -> String,file: StaticString = #file,function: StaticString = #function, line: UInt = #line) {
    DDLogVerbose(message,file:file, function:function, line:line)
}

public func LogDebug(_ message: @autoclosure () -> String,file: StaticString = #file,function: StaticString = #function, line: UInt = #line) {
    DDLogDebug(message,file:file, function:function, line:line)
}

public func LogInfo(_ message: @autoclosure () -> String,file: StaticString = #file,function: StaticString = #function, line: UInt = #line) {
    DDLogInfo(message,file:file, function:function, line:line)
}

public func LogWarn(_ message: @autoclosure () -> String,file: StaticString = #file,function: StaticString = #function, line: UInt = #line) {
    DDLogWarn(message,file:file, function:function, line:line)
}

public func LogError(_ message: @autoclosure () -> String,file: StaticString = #file,function: StaticString = #function, line: UInt = #line) {
    DDLogError(message,file:file, function:function, line:line)
}

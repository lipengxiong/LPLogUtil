//
//  Log.swift
//  LPLogUtil
//
//  Created by 张立鹏 on 2020/4/19.
//  Copyright © 2020 masterlipeng. All rights reserved.
//

import Foundation

fileprivate enum PrintLevel {
    case V
    case D
    case I
    case W
    case E
}

public struct Log {

    private static var sFormatter: DateFormatter {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss:SSS"
            return formatter
        }
    }
    
    public static func v(_ object: Any?,
                         _ file: String = #file,
                         _ function: String = #function,
                         _ line: Int = #line) {
        log(.V, object, file, function, line)
    }
    
    public static func d(_ object: Any?,
                         _ file: String = #file,
                         _ function: String = #function,
                         _ line: Int = #line) {
        log(.D, object, file, function, line)
    }
    
    public static func i(_ object: Any?,
                         _ file: String = #file,
                         _ function: String = #function,
                         _ line: Int = #line) {
        log(.I, object, file, function, line)
    }
    
    public static func w(_ object: Any?,
                         _ file: String = #file,
                         _ function: String = #function,
                         _ line: Int = #line) {
        log(.W, object, file, function, line)
    }
    
    public static func e(_ object: Any?,
                         _ file: String = #file,
                         _ function: String = #function,
                         _ line: Int = #line) {
        log(.E, object, file, function, line)
    }
    
    private static func log( _ level: PrintLevel,
                             _ object: @autoclosure() -> Any?,
                             _ file: String = #file,
                             _ function: String = #function,
                             _ line: Int = #line) {
        #if DEBUG
        let timestamp = sFormatter.string(from: Date())
        let queue = Thread.isMainThread ? "Main" : "BG"
        let fileURL = NSURL(string: file)?.lastPathComponent ?? "Unknown file"
        var printLevel: String
        
        switch level {
            case .D:
                printLevel = "DEBUG"
            case .I:
                printLevel = "INFO"
            case .W:
                printLevel = "WARN"
            case .E:
                printLevel = "ERROR"
            default:
                printLevel = "VERBOSE"
        }
        guard let value = object() else {
            print("\(timestamp) { \(queue) } \(printLevel) \t\(fileURL) > \(function) [\(line)]: \(String(describing: object()))")
            return
        }
        var stringRepresentation: String?
        
        if let value = value as? String {
            stringRepresentation = value
        } else if let value = value as? CustomDebugStringConvertible {
            stringRepresentation = value.debugDescription
        } else if let value = value as? CustomStringConvertible {
            stringRepresentation = value.description
        } else {
            fatalError("gLog only works for values that conform to CustomDebugStringConvertible or CustomStringConvertible")
        }
        
        
    
        if let string = stringRepresentation {
            print("\(timestamp) { \(queue) } \(printLevel) \t\(fileURL) > \(function) [\(line)]: \(string)")
        } else {
            print("\(timestamp) { \(queue) } \(printLevel) \t\(fileURL) > \(function) [\(line)]: \(value)")
        }
        #endif
    }
}

import Foundation
import UIKit
import os.log

@available(iOS 13.0, *)
public final class AHQSLogger {
    
    /// The singleton instance.
    public static let shared = AHQSLogger()
    
    /// Private initializer. This is a singleton.
    private init() {}
    
    /// A visual indicator for easily spotting logs in the console.
    public var loggerVisualIndicator: String = "📑"
    
    /// A visual indicator for easily spotting the information log in the console.
    public var loggerInfoVisualIndicator: String = "🗣"
    
    /// A visual indicator for easily spotting the error log in the console.
    public var loggerErrorVisualIndicator: String = "❌"
        
    /// Log subsystem.
    private var subsystem = "Logging"
    
    /// Log category.
    private var category = "Application"
    
    /// Adds identification for subsystem and category for better visualization in Console.
    public func setSubsystem(_ subsystem: String, category: String) {
        self.subsystem = subsystem
        self.category = category
    }
    
    /// Adds identification for subsystem for better visualization in Console.
    public func setSubsystem(_ subsystem: String) {
        self.subsystem = subsystem
    }
    
    /// Adds category for better visualization in Console.
    public func setCategory(_ category: String) {
        self.category = category
    }
    
    /// Logs debug information.
    /// Additionaly an object can be logged as well.
    public func info(_ message: String, containing object: Any? = nil) {
        let log = OSLog(subsystem: self.subsystem, category: self.category)
        if let object = object as? CVarArg {
            os_log("%{public}@ %{public}@ %{public}@ : %{public}@", log: log, type: .info, self.loggerVisualIndicator, self.loggerInfoVisualIndicator, message, "\(object)")
        } else {
            os_log("%{public}@ %{public}@ %{public}@", log: log, type: .info, self.loggerVisualIndicator, self.loggerInfoVisualIndicator, message)
        }
    }
    
    /// Logs error with Error object.
    /// Additionaly an object can be logged as well.
    public func error(_ error: Error, containing object: Any? = nil) {
        let log = OSLog(subsystem: self.subsystem, category: self.category)
        if let object = object as? CVarArg {
            os_log("%{public}@ %{public}@ %{public}@ : %{public}@", log: log, type: .error, self.loggerVisualIndicator, self.loggerErrorVisualIndicator, error.localizedDescription, "\(object)")
        } else {
            os_log("%{public}@ %{public}@ %{public}@", log: log, type: .error, self.loggerVisualIndicator, self.loggerErrorVisualIndicator, error.localizedDescription)
        }
    }
    
    /// Logs error with NSError object.
    /// Additionaly an object can be logged as well.
    public func error(_ error: NSError, containing object: Any? = nil) {
        let log = OSLog(subsystem: self.subsystem, category: self.category)
        if let object = object as? CVarArg {
            os_log("%{public}@ %{public}@ %{public}@ : %{public}@", log: log, type: .error, self.loggerVisualIndicator, self.loggerErrorVisualIndicator, error.localizedDescription, "\(object)")
        } else {
            os_log("%{public}@ %{public}@ %{public}@", log: log, type: .error, self.loggerVisualIndicator, self.loggerErrorVisualIndicator, error.localizedDescription)
        }
    }
}

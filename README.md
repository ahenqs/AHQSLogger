# AHQSLogger

A simple logging system.

## Usage

    import AHQSLogger

Use the following methods for loggging. 

## Logging an information / debug

You can log a simple message:

        AHQSLogger.shared.info("Hello world!")
        
        
Additionally you can pass an object as a parameter:

        let values = ["hello", "foo", "bar"]

        AHQSLogger.shared.info("Hello world!", containing: values)
        
        
## Logging an error

You can either log an Error object or an NSError object.


### Error

    enum MyCustomError: LocalizedError {
        case invalid
        case unknown
    
        var errorDescription: String? {
            switch self {
            case .invalid:
                return "Invalid error."
            case .unknown:
                return "Unknown error."
            }
        }
    }
    
    let customError = MyError.invalid
        
    AHQSLogger.shared.error(customError)
    
    
### NSError

    let error = NSError(domain: "com.ahenqs.logger", code: 1, userInfo: [NSLocalizedDescriptionKey: "Custom NSError here for testing purposes."])
    AHQSLogger.shared.error(error)


## Subsystem and Category
        
You can change the subsystem and category for better separation of logs.

    AHQSLogger.shared.setSubsystem("Foo", category: "Bar")
    
Or set them separately at run time:

    AHQSLogger.shared.setSubsystem("Other")
    
    AHQSLogger.shared.setCategory("MyApp")

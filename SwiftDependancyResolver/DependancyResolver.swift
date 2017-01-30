//
//  DependancyResolver.swift
//  SwiftDependancyResolver
//
//  Created by Chris Simpson on 30/1/17.
//
//

import Foundation

typealias Resolver = (() -> Any)

enum DependancyError: Error {
    
    case dependancyNotFound(dependancyName: String)
    case unknownError
}

class DependancyResolver {
    
    private static var resolvers = Dictionary<String, Any>()
    
    class func register(protocol _protocol: Any, withObject object: AnyObject) {
        
        DependancyResolver.register(protocol: _protocol, withResolver: { object })
    }
    
    class func register(protocol _protocol: Any, withResolver resolver: @escaping Resolver) {
        
        if let protocolName = String(describing: type(of: _protocol)).components(separatedBy: ".").first {
            
            DependancyResolver.resolvers[protocolName] = resolver
        }
    }
    
    class func dependancy<T>(for _protocol: T.Type) throws -> T {
        
        if let protocolName = String(describing: type(of: _protocol)).components(separatedBy: ".").first {
        
            if let resolver = self.resolvers[protocolName], let typedResolver = resolver as? T {
                
                return typedResolver
            }
            else {
            
                throw DependancyError.dependancyNotFound(dependancyName: protocolName)
            }
        }
        else {
            
            throw DependancyError.unknownError
        }
    }
}

// 
//  RequestInterceptorFactory.swift
//  FRCore
//
//  Copyright (c) 2020 ForgeRock. All rights reserved.
//
//  This software may be modified and distributed under the terms
//  of the MIT license. See the LICENSE file for details.
//


import Foundation


/// RequestInterceptorFactory is responsible to maintain, and manage an array of `RequestInterceptor` for FRCore's network layer
public struct RequestInterceptorFactory {
    
    //  MARK: - Property
    
    /// Shared instance of `RequestInterceptorFactory`
    public static let shared = RequestInterceptorFactory()
    
    
    //  MARK: - Public
    
    /// Registers a new array of interceptor to FRCore's network layer; the new array can override the existing interceptors, or append on top of existing array
    /// - Parameters:
    ///   - interceptors: An array of RequestInterceptor to be registered
    ///   - shouldOverride: Boolean indicator whether or not to override existing array
    public func registerInterceptors(interceptors: [RequestInterceptor]?, shouldOverride: Bool = true) {
        if shouldOverride {
            RestClient.shared.setRequestInterceptors(interceptors: interceptors)
        }
        else {
            if let interceptors = interceptors {
                var newInterceptors = RestClient.shared.interceptors ?? []
                for interceptor in interceptors {
                    newInterceptors.append(interceptor)
                }
                RestClient.shared.setRequestInterceptors(interceptors: newInterceptors)
            }
        }
    }
}

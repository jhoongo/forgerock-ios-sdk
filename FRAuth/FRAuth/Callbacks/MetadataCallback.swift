// 
//  MetadataCallback.swift
//  FRAuth
//
//  Copyright (c) 2019 ForgeRock. All rights reserved.
//
//  This software may be modified and distributed under the terms
//  of the MIT license. See the LICENSE file for details.
//


import Foundation

public class MetadataCallback: Callback {
    
    public var stepType: String
    public var _id: Int?
    
    //  MARK: - Init method
    
    /// Designated initialization method for MetadataCallback
    ///
    /// - Parameter callbackJSON: JSON object of MetadataCallback
    /// - Throws: AuthError.invalidCallbackResponse for invalid callback response
    public required init(json: [String : Any]) throws {
        
        
        guard let callbackType = json["type"] as? String else {
            throw AuthError.invalidCallbackResponse(String(describing: json))
        }
        
        guard let output = json["output"] as? [Any] else {
            throw AuthError.invalidCallbackResponse(String(describing: json))
        }

        guard let outputDict = output[0] as? [String: Any], let prompt = outputDict["value"] as? [String: Any], let stepType = prompt["stepType"] as? String else {
            throw AuthError.invalidCallbackResponse(String(describing: json))
        }
        
        self.stepType = stepType
        
        if let callbackId = json["_id"] as? Int {
            self._id = callbackId
        }
        
        try super.init(json: [:])
        self.type = callbackType
        self.response = json
    }
    
    
    //  MARK: - Build
    
    /// Builds JSON request payload for the Callback
    ///
    /// - Returns: JSON request payload for the Callback
    public override func buildResponse() -> [String : Any] {
        return self.response
    }
}

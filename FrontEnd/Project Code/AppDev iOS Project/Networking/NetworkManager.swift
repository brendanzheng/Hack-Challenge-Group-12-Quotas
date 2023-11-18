//
//  NetworkManager.swift
//  AppDev iOS Project
//
//  Created by William Liu on 11/18/23.
//

import Foundation

class NetworkManager {
    
    // MARK: - shared singleton instance
    static let shared = NetworkManager()
    
    private let decoder = JSONDecoder()
    
    private let endpoint = "[Endpoint URL here]"
    
    private init() { }
    
    
}



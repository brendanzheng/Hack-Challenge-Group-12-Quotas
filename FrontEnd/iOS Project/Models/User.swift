//
//  User.swift
//  iOS Project
//
//  Created by William Liu on 11/18/23.
//

import Foundation

struct User: Codable {
    
    // MARK: - Properties (data)
    
    private var userId: String
    private var username: String
    private var quotasLeft: Int
    
    // MARK: - init
    
    init(userId: String, username: String, quotasLeft: Int) {
        self.userId = userId
        self.username = username
        self.quotasLeft = quotasLeft
    }
    
    // MARK: - Get Functions
    
    public func getUserId() -> String {
        return userId
    }
    
    public func getUsername() -> String {
        return username
    }
    
    public func getQuotasLeft() -> Int {
        return quotasLeft
    }
    
}

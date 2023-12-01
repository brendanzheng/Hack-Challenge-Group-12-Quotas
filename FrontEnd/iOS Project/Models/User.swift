//
//  User.swift
//  iOS Project
//
//  Created by William Liu on 11/18/23.
//

import Foundation

struct User: Codable {
    
    // MARK: - Properties (data)
    
    private var profilePicture: String
    private var userId: Int
    private var username: String
    private var quotasLeft: Int
    
    // MARK: - init
    
    init(profilePicture: String, userId: Int, username: String, quotasLeft: Int) {
        self.profilePicture = profilePicture
        self.userId = userId
        self.username = username
        self.quotasLeft = quotasLeft
    }
    
    // MARK: - Get Functions
    
    public func getProfilePicture() -> String {
        return profilePicture
    }
    
    public func getUserId() -> Int {
        return userId
    }
    
    public func getUsername() -> String {
        return username
    }
    
    public func getQuotasLeft() -> Int {
        return quotasLeft
    }
    
}

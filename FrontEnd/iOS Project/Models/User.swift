//
//  User.swift
//  iOS Project
//
//  Created by William Liu on 11/18/23.
//

import Foundation

struct User: Codable {
    
    // Order is id, username, quotas left, profile picture url, and a list of their services history (each of which is in the service json format).
    
    // MARK: - Properties (data)
    
    private var id: Int
    private var username: String
    private var quotas_left: Int
    private var profile_picture: String
    private var services: [Service]
    
    // MARK: - init
    
    init() {
        self.id = 0
        self.username = ""
        self.quotas_left = 0
        self.profile_picture = ""
        self.services = []
    }
    
    init(id: Int, username: String, quotas_left: Int, profile_picture: String, services: [Service]) {
        self.id = id
        self.username = username
        self.quotas_left = quotas_left
        self.profile_picture = profile_picture
        self.services = services
    }
    
    
    // MARK: - Get Functions
    
    public func getId() -> Int {
        return id
    }
    
    public func getUsername() -> String {
        return username
    }
    
    public func getQuotasLeft() -> Int {
        return quotas_left
    }
    
    public func getProfilePicture() -> String {
        return profile_picture
    }
    
    public func getServices() -> [Service] {
        return services
    }
    
}

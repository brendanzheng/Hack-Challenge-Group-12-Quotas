//
//  Service.swift
//  iOS Project
//
//  Created by William Liu on 11/19/23.
//

import Foundation

class Service: Codable {
    
    // MARK: - Properties (data)
    
    private var serviceId: Int
    private var imageURL: String
    private var name: String
    private var description: String
    private var popularity: String
    private var cost: Int
    
    // MARK: - init
    
    init(serviceId: Int, imageURL: String, name: String, description: String, popularity: String, cost: Int) {
        
        self.serviceId = serviceId
        self.imageURL = imageURL
        self.name = name
        self.description = description
        self.popularity = popularity
        self.cost = cost
    }
    
    // MARK: - Get Functions
    
    public func getServiceId() -> Int {
        return serviceId
    }
    
    public func getImageURL() -> String {
        return imageURL
    }
    
    public func getName() -> String {
        return name
    }
    
    public func getDescription() -> String {
        return description
    }
    
    public func getPopularity() -> String {
        return popularity
    }
    
    public func getCost() -> Int {
        return cost
    }
    
    
}

//
//  Service.swift
//  iOS Project
//
//  Created by William Liu on 11/19/23.
//

import Foundation

struct Service: Codable {
    
    // MARK: - Properties (data)
    
    private var id: Int
    private var image_url: String
    private var name: String
    private var description: String
    private var popularity: Double
    private var cost: Int
    
    // MARK: - init
    
    init(id: Int, image_url: String, name: String, description: String, popularity: Double, cost: Int) {
        self.id = id
        self.image_url = image_url
        self.name = name
        self.description = description
        self.popularity = popularity
        self.cost = cost
    }
    
    // MARK: - Get Functions
    
    public func getId() -> Int {
        return id
    }
    
    public func getImageURL() -> String {
        return image_url
    }
    
    public func getName() -> String {
        return name
    }
    
    public func getDescription() -> String {
        return description
    }
    
    public func getPopularity() -> Double {
        return popularity
    }
    
    public func getCost() -> Int {
        return cost
    }
    
    
}

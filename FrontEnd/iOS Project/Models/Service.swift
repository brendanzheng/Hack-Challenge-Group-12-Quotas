//
//  Service.swift
//  iOS Project
//
//  Created by William Liu on 11/19/23.
//

import Foundation

class Service: Codable {
    
    // MARK: - Properties (data)
    
    private var imageURL: String
    private var name: String
    private var description: String
    private var popularity: String
    private var cost: Int
    private var amountUsed: Int
    private var frequencyOfUse: String
    
    // MARK: - init
    
    init(imageURL: String, name: String, description: String, popularity: String, cost: Int, amountUsed: Int, frequencyOfUse: String) {
        self.imageURL = imageURL
        self.name = name
        self.description = description
        self.popularity = popularity
        self.cost = cost
        self.amountUsed = amountUsed
        self.frequencyOfUse = frequencyOfUse
    }
    
    // MARK: - Get Functions
    
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
    
    public func getAmountUsed() -> Int {
        return amountUsed
    }
    
    public func getFrequencyOfUse() -> String {
        return frequencyOfUse
    }
    
    
}

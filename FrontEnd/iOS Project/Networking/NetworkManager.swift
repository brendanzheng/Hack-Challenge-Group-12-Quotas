//
//  NetworkManager.swift
//  iOS Project
//
//  Created by William Liu on 11/18/23.
//

import Foundation
import Alamofire

class NetworkManager {
    
    // MARK: - shared singleton instance
    static let shared = NetworkManager()
    
    private let decoder = JSONDecoder()
    
    private let endpoint = "http://35.221.25.166/"
    
    private init() { }
    
    // MARK: - Networking
    
    func fetchAllServices(completion: @escaping([Service]) -> Void) {
        
        let devEndPointGetAllServices = "\(endpoint)api/services/"
        
        AF.request(devEndPointGetAllServices, method: .get)
            .validate()
            .responseDecodable(of: [Service].self, decoder: decoder) { response in
                switch response.result {
                case .success(let allServices):
                    completion(allServices)
                case .failure(let error):
                    print("Error in NetworkManager.fetchAllServices: \(error.localizedDescription)")
                    completion([])
                }
            }
    }
    
    func fetchUser(completion: @escaping(User?) -> Void) {
        
        let devEndPointGetUser = "\(endpoint)api/users/1/"
        
        AF.request(devEndPointGetUser, method: .get)
            .validate()
            .responseDecodable(of: User.self, decoder: decoder) {response in
            switch response.result {
            case .success(let user):
                completion(user)
            case .failure(let error):
                print("Error in NetworkManager.fetchUser: \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
    
    func deleteUser(user: User, completion: @escaping(User) -> Void) {
        
        let devEndPointDeleteUser = "\(endpoint)api/users/1/"
        
        let parameters: Parameters = [
            "id": user.getId(),
            "username": user.getUsername(),
            "quotas_left": user.getQuotasLeft(),
            "profile_picture": user.getProfilePicture(),
            "services": user.getServices()
        ]
        
        AF.request(devEndPointDeleteUser, method: .delete, parameters: parameters)
            .validate()
            .responseDecodable(of: User.self, decoder: decoder) { response in
                switch response.result {
                case .success(let user):
                    completion(user)
                case .failure(let error):
                    print("Error in NetworkManager.deleteUser: \(error.localizedDescription)")
                }
            }
    }
    
    func decreaseQuotaCost(service: Service, user: User, completion: @escaping(User) -> Void) {
        
        let devEndPointDecreaseQuotaCost = "\(endpoint)api/users/1/service/\(service.getId())/"
        
        let quotas = user.getQuotasLeft() - service.getCost()
        print(service.getId())
        
        let parameters: Parameters = [
            "id": user.getId(),
            "username": user.getUsername(),
            "quotas_left": quotas,
            "profile_picture": user.getProfilePicture(),
            "services": user.getServices()
        ]
        
        AF.request(devEndPointDecreaseQuotaCost, method: .post, parameters: parameters)
            .validate()
            .responseDecodable(of: User.self, decoder: decoder) { response in
                switch response.result   {
                case .success(let user):
                    completion(user)
                case .failure(let error):
                    print("Error in NetworkManager.decreaseQuotaCost: \(error.localizedDescription)")
                }
                
            }
    }
    
}

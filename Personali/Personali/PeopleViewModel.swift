//
//  PeopleViewModel.swift
//  Personali
//
//  Created by Kamil Krzych on 29/03/2023.
//

import Foundation


class PeopleViewModel {
    
    private var people = [PersonResponse]()
    
    func getUsers() {
        
        Task { [weak self] in
            
            do {
                let url = URL(string: "https://reqres.in/api/users")!
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let jsonDecoder = JSONDecoder()
                
                // I'm gonna download API data which is in Snake_Case but I created my Model following camelCase so I can just tell my jsonDecoder to change it
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                
                self?.people = try jsonDecoder.decode(UserResponse.self, from: data).data
                    
            } catch {
                print(error)
            }
            
        }
    }
}

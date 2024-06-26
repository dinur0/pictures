//
//  NetworkClass.swift
//  RandomPhotos
//
//  Created by хех on 26.06.2024.
//

import Foundation

class NetworkClass : ObservableObject{
    
    private let thisSession = URLSession.shared
    
    let url = "https://api.unsplash.com/photos/random?client_id=g8dhDsBjh0S2x353YF2Cw3ANrez24x5i5ANV-4E0PCE"
    
    func fetchPhotos(){
        guard let url = URL(string: url) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let res = try JSONDecoder().decode(APIResponse.self, from: data)
                print(res.results.count)
            } catch {
                print(error)
            }
            
        }
        task.resume()
    }
}
    extension NetworkClass {
        enum MyNetworkErrors: Error{
            case dataError
        }
    }

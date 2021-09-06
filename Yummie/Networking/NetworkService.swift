//
//  NetworkService.swift
//  Yummie
//
//  Created by VD on 05/09/2021.
//

import Foundation



struct NetworkService {
    
    
    static let shared = NetworkService()
    private init() {}
    
    func myFirstRequest (){
        
        request(route: .temp, method: .get, type: String.self , completion:{_ in })
    }
    
    
    
    private func request<T:Codable> (route: Route, method : Method, parameters : [String:Any]? = nil, type : T.Type, completion: (Result<T, Error>)-> Void){
        
        
        guard  let request = createRequest(route: route, method: method, parameters: parameters) else {
            
            completion(.failure(AppError.unknownError))
            return
            
        }
        URLSession.shared.dataTask(with: request) { data, response, error in
            var result : Result <Data, Error>?
            if let data = data{
                result = .success(data)
                let responseString = String(data : data, encoding: .utf8) ?? "could not turn into a string"
                print("response = \(responseString)")
            }else if let error = error{
                result = .failure(error)
                print(error)
            }
            
            DispatchQueue.main.async {
                // TODO send back to the user
            }
        }.resume()
    }
    
    
    /// this function helps us generate a url request
    /// - Parameters:
    ///   - route: the path to the resource in the backend
    ///   - method: type of request to be made
    ///   - parameters: whateveer extra info you need to pass to the backend
    /// - Returns: returns our url request
     private func createRequest(route : Route, method : Method, parameters: [String: Any]? = nil)-> URLRequest?{
        
        let urlString = Route.baseURL + route.description
        guard let  url = urlString.asURL else{return nil}
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = parameters{
            
            switch method{
            
            case .get:
                var urlComponent =  URLComponents(string: urlString)
                urlComponent?.queryItems = params.map  {URLQueryItem(name: $0, value: "\($1)")}
                urlRequest.url = urlComponent?.url
                
                
            case .post, .delete, . patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
                urlRequest.httpBody = bodyData
          
            }
        }
        return urlRequest
        
    }
    

}




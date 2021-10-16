////
////  NetworkService.swift
////  FlashFood
////
////  Created by VD on 05/09/2021.
////
//
//import Foundation
//
//
//
//struct NetworkService {
//
//
//    static let shared = NetworkService()
//    private init() {}
//
//
//    //MARK:-API CALLS
//
//    func fetchAllCategories(completion : @escaping(Result<AllDishes, Error>)-> Void){
//        request(route: .fetchAllCAtegories, method: .get, completion: completion)
//    }
//
//    func placeOrder(dishiD : String, name: String, completion: @escaping(Result<Order,Error>)->Void){
//        let params = ["name" : name]
//        request(route: .placeOrder(dishiD), method: .post, parameters: params, completion: completion)
//
//    }
//
//
//    func fetchCAtegoryDishes(categoryId: String, completion : @escaping (Result<[Dish], Error>)->Void){
//        request(route: .fetchCategoryDishes(categoryId), method: .get, completion: completion)
//
//    }
//
//    func fetchOrders(completion : @escaping(Result<[Order], Error>)->Void){
//        request(route: .fetchOrder, method: .get, completion: completion)
//
//    }
//
//
//    //MARK:-ASSISTANT FUNCTIONS
//
//
//
//    private func request<T:Decodable> (route: Route, method : Method, parameters : [String:Any]? = nil,  completion: @escaping(Result<T, Error>)-> Void){
//
//
//        guard  let request = createRequest(route: route, method: method, parameters: parameters) else {
//
//            completion(.failure(AppError.unknownError))
//            return
//
//        }
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            var result : Result <Data, Error>?
//            if let data = data{
//                result = .success(data)
//
//                let responseString = String(data : data, encoding: .utf8) ?? "could not turn into a string"
//                print("response = \(responseString)")
//            }else if let error = error{
//                result = .failure(error)
//                print(error)
//            }
//
//            DispatchQueue.main.async {
//                self.handleResponse(result: result, completion: completion)
//            }
//
//        }
//            .resume()
//    }
//
//    private func handleResponse<T : Decodable> (result : Result<Data, Error>?, completion :(Result<T, Error>)-> Void){
//
//        guard let result = result else{
//            completion(.failure(AppError.unknownError))
//            return
//        }
//
//        switch result {
//
//
//        case.success(let data) :
//        let decoder = JSONDecoder()
//            guard let response = try? decoder.decode(ApiResponse<T>.self, from: data) else {
//                completion(.failure(AppError.errorDecoding))
//                return
//            }
//            if let error = response.error{
//                completion(.failure(AppError.serverError(error)))
//                return
//            }
//            if let decodedData = response.data {
//                completion(.success(decodedData))
//            }else{completion(.failure(AppError.unknownError))
//
//            }
//
//
//        case .failure(let error) :
//        completion(.failure(error))
//        }
//
//    }
//
//    /// this function helps us generate a url request
//    /// - Parameters:
//    ///   - route: the path to the resource in the backend
//    ///   - method: type of request to be made
//    ///   - parameters: whateveer extra info you need to pass to the backend
//    /// - Returns: returns our url request
//     private func createRequest(route : Route, method : Method, parameters: [String: Any]? = nil)-> URLRequest?{
//
//        let urlString = Route.baseURL + route.description
//        guard let  url = urlString.asURL else{return nil}
//        var urlRequest = URLRequest(url: url)
//        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.httpMethod = method.rawValue
//
//        if let params = parameters{
//
//            switch method{
//
//            case .get:
//                var urlComponent =  URLComponents(string: urlString)
//                urlComponent?.queryItems = params.map  {URLQueryItem(name: $0, value: "\($1)")}
//                urlRequest.url = urlComponent?.url
//
//
//            case .post, .delete, . patch:
//                let bodyData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
//                urlRequest.httpBody = bodyData
//
//            }
//        }
//        return urlRequest
//
//    }
//
//
//}
//
//
//
//

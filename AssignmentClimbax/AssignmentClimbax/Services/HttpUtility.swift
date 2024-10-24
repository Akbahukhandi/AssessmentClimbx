//
//  HttpUtility.swift
//  AssignmentClimbax
//
//  Created by Aakanksha on 24/10/24.
//

import Foundation

struct HttpUtility {
    func getApiData<T: Decodable>(urlRequest: URL, resultType: T.Type, completionhandler: @escaping (Result<T, APIError>) -> Void) {
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            if let error = error {
                if let urlError = error as? URLError {
                    switch urlError.code {
                    case .timedOut:
                        completionhandler(.failure(.timeout))
                    default:
                        completionhandler(.failure(.other(urlError)))
                    }
                } else {
                    completionhandler(.failure(.other(error)))
                }
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: Constant.ErrorMessage.dataError, code: -1, userInfo: [NSLocalizedDescriptionKey: Constant.ErrorMessage.noData])
                completionhandler(.failure(.other(error)))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let result = try decoder.decode(T.self, from: data)
                completionhandler(.success(result))
            } catch let decodingError {
                completionhandler(.failure(.other(decodingError)))
                debugPrint("Error occurred while decoding: \(decodingError.localizedDescription)")
            }
        }
        task.resume()
    }
}

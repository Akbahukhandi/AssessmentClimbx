//
//  RecipiesApiRepository.swift
//  AssignmentClimbax
//
//  Created by Aakanksha on 24/10/24.
//

import Foundation

struct RecipiesApiRepository {
    func getAllRecipies(completion: @escaping(_ result: Recipies?) -> Void) {
        let url = URL(string: Constant.ApiEndPoints.recipies)!
        let httpUtility = HttpUtility()
        
        //Method use to get data from the API
        httpUtility.getApiData(urlRequest: url, resultType: Recipies.self) { result in
            switch result {
            case .success(let recipies):
                completion(recipies)
            case .failure(let error):
                completion(nil)
                print("Error is", error)
            }
        }
    }
}

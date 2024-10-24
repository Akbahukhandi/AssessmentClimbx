//
//  recipiesViewModel.swift
//  AssignmentClimbax
//
//  Created by Aakanksha on 24/10/24.
//

import Foundation
protocol recipiesViewModelDelegate {
    func didreceiveRecipies(recipiesResponse : Recipies)
}

struct RecipiesViewModel {
    var delegate: recipiesViewModelDelegate?
    func getRecipiesData() {
        let recipiesApiRepository = RecipiesApiRepository()
        recipiesApiRepository.getAllRecipies { result in
            if result != nil {
                DispatchQueue.main.async {
                    delegate?.didreceiveRecipies(recipiesResponse: result!)
                }
            }
        }
    }
}

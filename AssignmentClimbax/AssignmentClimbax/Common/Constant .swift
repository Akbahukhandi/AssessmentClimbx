//
//  Constant .swift
//  AssignmentClimbax
//
//  Created by Aakanksha on 24/10/24.
//

import Foundation
struct Constant {
    
    struct ApiEndPoints {
        static let recipies = "https://dummyjson.com/recipes"
    }
    
    struct ApiMethod {
        static let get = "GET"
        static let post = "POST"
    }
    
    struct TableCell{
        static let recipiesTableViewCell = "RecipiesTableViewCell"
    }
    
    struct Identifire {
        static let reuseIdentifier = "cell"
    }
    
    struct ErrorMessage {
        static let dataError = "DataError"
        static let noData = "No data received"
        static let decodingError = "Error occurred while decoding:"
    }
    
    struct Message {
        static let RecipeAdded = "Recipe added successfully"
        static let RecipeRemoved = "Recipe removed successfully"
    }
}

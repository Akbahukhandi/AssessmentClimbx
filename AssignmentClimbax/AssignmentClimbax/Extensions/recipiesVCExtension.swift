//
//  recipiesVCExtension.swift
//  AssignmentClimbax
//
//  Created by Aakanksha on 24/10/24.
//

import Foundation
import UIKit

extension RecipiesViewController: recipiesViewModelDelegate, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecipiesTableViewCell
        let recipiName = recipiesArray[indexPath.row]
        cell.recipiesLabel.text = recipiName.name
        cell.isFavorite = recipiName.isFavorite
        cell.favouriteButton.tag = indexPath.row
        cell.favouriteButton.addTarget(self, action: #selector(favouriteButtonTapped(_:)), for: .touchUpInside)
        return cell
    }
    
    func didreceiveRecipies(recipiesResponse: Recipies) {
        self.recipiesArray = recipiesResponse.recipes
        self.tableView.reloadData()
    }
}



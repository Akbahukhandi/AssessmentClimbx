//
//  FavViewController.swift
//  AssignmentClimbax
//
//  Created by Aakanksha on 24/10/24.
//

import UIKit

class FavViewController: UIViewController {
    var favoriteRecipes: [Recipe] = []
    @IBOutlet weak var tableView: UITableView!
    var recipiesArray: [Recipe] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    //Method use to register table view cell.
    func setupTableView() {
        self.tableView.register(UINib(nibName: Constant.TableCell.recipiesTableViewCell, bundle: nil), forCellReuseIdentifier: Constant.Identifire.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //Methed use to back action
    @IBAction func backButtonAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    //Method use to perform action when click on fav button.
    @objc func favouriteButtonTapped(_ sender: UIButton) {
        self.showToast(message: Constant.Message.RecipeAdded, font: .systemFont(ofSize: 12.0))
        let index = sender.tag
        let removedRecipe = favoriteRecipes[index]
        favoriteRecipes.remove(at: index)
        tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        if let recViewController = navigationController?.viewControllers.first(where: { $0 is RecipiesViewController }) as? RecipiesViewController {
            if let recipeIndex = recViewController.recipiesArray.firstIndex(where: { $0.name == removedRecipe.name }) {
                recViewController.recipiesArray[recipeIndex].isFavorite = false
            }
        }
        self.tableView.reloadData()
    }
}

extension FavViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Identifire.reuseIdentifier, for: indexPath) as! RecipiesTableViewCell
        cell.recipiesLabel.text = favoriteRecipes[indexPath.row].name
        cell.isFavorite = favoriteRecipes[indexPath.row].isFavorite
        cell.favouriteButton.tag = indexPath.row
        cell.favouriteButton.addTarget(self, action: #selector(favouriteButtonTapped(_:)), for: .touchUpInside)
        return cell
    }
}

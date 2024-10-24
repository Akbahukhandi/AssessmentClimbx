//
//  RecipiesViewController.swift
//  AssignmentClimbax
//
//  Created by Aakanksha on 24/10/24.
//

import UIKit

class RecipiesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var recipiesArray: [Recipe] = []
    var recipieViewModel = RecipiesViewModel()
    var isstartSelected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchAllRecipies()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    //Method use to register the cell.
    private func setUpTableView() {
        self.tableView.register(UINib(nibName: Constant.TableCell.recipiesTableViewCell, bundle: nil), forCellReuseIdentifier: Constant.Identifire.reuseIdentifier)
    }
    
    //Methou use to fethch all recipies.
    private func fetchAllRecipies() {
        self.recipieViewModel.delegate = self
        self.recipieViewModel.getRecipiesData()
    }
    
    //Method use navigate favourite view controller.
    @IBAction func showFavoritesButtonTapped(_ sender: UIBarButtonItem) {
        let favoritesVC = FavViewController()
        favoritesVC.favoriteRecipes = recipiesArray.filter { $0.isFavorite }
        navigationController?.pushViewController(favoritesVC, animated: true)
    }
    
    //Method use to perfor action tapped on favourite button
    @objc func favouriteButtonTapped(_ sender: UIButton) {
        self.showToast(message: Constant.Message.RecipeAdded, font: .systemFont(ofSize: 12.0))
        let index = sender.tag
        recipiesArray[index].isFavorite.toggle()
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
    }
}

//
//  ListDishesViewController.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 11.05.2023.
//

import UIKit
import ProgressHUD

class ListDishesViewController: UIViewController {

    @IBOutlet weak var listDishTableView: UITableView!
    
    var dishCategory : DishCategoryModel!
    
    var dishList: [DishModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = dishCategory.name
        ProgressHUD.show("Loading...")
        NetworkService.instance.fetchCategoryDishes(categoryId: dishCategory.id!) { result in
            switch result {
            case .success(let list):
                ProgressHUD.dismiss()
                self.dishList=list
                self.listDishTableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
                
            }
        }
        
        registerCell()
    }
    
    private func registerCell(){
        listDishTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
        
     
    }
    

}

extension ListDishesViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dishModel: dishList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        
        controller.dish = dishList[indexPath.row]
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}

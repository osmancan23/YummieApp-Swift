//
//  HomeViewController.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 9.05.2023.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var specialCollectionView: UICollectionView!
    
    var categories : [DishCategoryModel] = []
    
    var populars: [DishModel] = []
    
    var specials: [DishModel] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        ProgressHUD.show()
        NetworkService.instance.fetchAllCategories {  result in
            switch result {
            case .success(let allDishModel):
                ProgressHUD.dismiss()
                self.categories = allDishModel.categories ?? []
                self.populars = allDishModel.populars ?? []
                self.specials = allDishModel.specials ?? []
                
                self.categoryCollectionView.reloadData()
                self.popularCollectionView.reloadData()
                self.specialCollectionView.reloadData()
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        
        }
        registerCells()
    }
    

    private func registerCells(){
        
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: PopularDishCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularDishCollectionViewCell.identifier)
        
        specialCollectionView.register(UINib(nibName: ChefsSpecialCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ChefsSpecialCollectionViewCell.identifier)
    }
    

}

extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialCollectionView:
            return specials.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    switch collectionView {
        case categoryCollectionView:
            let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(dishCategory: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularDishCollectionViewCell.identifier, for: indexPath) as! PopularDishCollectionViewCell
            cell.setup(dishModel:  populars[indexPath.row])
            return cell
        case specialCollectionView:
        let cell = specialCollectionView.dequeueReusableCell(withReuseIdentifier: ChefsSpecialCollectionViewCell.identifier, for: indexPath) as! ChefsSpecialCollectionViewCell
        cell.setup(dish:  specials[indexPath.row])
        return cell
        
    default:
            return UICollectionViewCell()
        }
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.dishCategory = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }else{
            let controller = DishDetailViewController.instantiate()
            
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
}

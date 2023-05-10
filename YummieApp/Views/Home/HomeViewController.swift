//
//  HomeViewController.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 9.05.2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var specialCollectionView: UICollectionView!
    
    var categories : [DishCategoryModel] = [
        .init(title: "id1", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", id: "1"),
        .init(title: "id2", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", id: "1"),
        .init(title: "id3", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", id: "1"),
        .init(title: "id4", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", id: "1"),
        .init(title: "id5", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", id: "1")
    ]
    
    var populars: [DishModel] = [
        .init(id: "id1", name: "Mantı", description: "Kayseri", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", calories: 35),
        .init(id: "id2", name: "Yuvarlama", description: "Gaziantep", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", calories: 60),
        .init(id: "id3", name: "Kebap", description: "Adana", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", calories: 100),
        .init(id: "id4", name: "Cag Kebabı", description: "Erzurum", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", calories: 150),
    ]
    
    var specials: [DishModel] = [
        .init(id: "id1", name: "Mantı", description: "Kayseri", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", calories: 35),
        .init(id: "id2", name: "Yuvarlama", description: "Gaziantep", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", calories: 60),
        .init(id: "id3", name: "Kebap", description: "Adana", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", calories: 100),
        .init(id: "id4", name: "Cag Kebabı", description: "Erzurum", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", calories: 150),
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
       
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        
        specialCollectionView.dataSource = self
        specialCollectionView.delegate = self
        
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
    
    
}

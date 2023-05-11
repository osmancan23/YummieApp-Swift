//
//  ListDishesViewController.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 11.05.2023.
//

import UIKit

class ListDishesViewController: UIViewController {

    @IBOutlet weak var listDishTableView: UITableView!
    
    var dishCategory : DishCategoryModel!
    
    var dishList: [DishModel] = [
        .init(id: "id1", name: "Mantı", description: "Kayseri", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", calories: 35),
        .init(id: "id2", name: "Yuvarlama", description: "Gaziantep", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", calories: 60),
        .init(id: "id3", name: "Kebap", description: "Adana", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", calories: 100),
        .init(id: "id4", name: "Cag Kebabı", description: "Erzurum", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", calories: 150),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = dishCategory.title
        registerCell()
    }
    
    private func registerCell(){
        listDishTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
        
     
    }
    

}

extension ListDishesViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(dishList.count)
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

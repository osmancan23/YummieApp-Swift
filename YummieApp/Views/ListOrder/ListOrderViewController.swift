//
//  ListOrderViewController.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 11.05.2023.
//

import UIKit

class ListOrderViewController: UIViewController {
    
    @IBOutlet weak var orderTableView: UITableView!
    var orderList : [OrderModel] = [
        .init(id: "id1", name: "Order 1", dish: DishModel(id: "id1", name: "Mantı", description: "Kayseri", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", calories: 35)),
        .init(id: "id2", name: "Order 2", dish: DishModel(id: "id2", name: "Mantı", description: "Kayseri", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", calories: 35)),
        .init(id: "id3", name: "Order 3", dish: DishModel(id: "id3", name: "Mantı", description: "Kayseri", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", calories: 35)),
        .init(id: "id4", name: "Order 4", dish: DishModel(id: "id4", name: "Mantı", description: "Kayseri", image: "https://cdn.yemek.com/mnresize/940/940/uploads/2020/08/manti-tarifi-guncelleme-son.jpg", calories: 35)),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    
    private func registerCell(){
        orderTableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }

}

extension ListOrderViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(orderModel:  orderList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        
        controller.dish = orderList[indexPath.row].dish
        
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
}

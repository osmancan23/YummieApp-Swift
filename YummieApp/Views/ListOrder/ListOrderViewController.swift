//
//  ListOrderViewController.swift
//  YummieApp
//
//  Created by Osmancan Akagündüz on 11.05.2023.
//

import UIKit
import ProgressHUD

class ListOrderViewController: UIViewController {
    
    @IBOutlet weak var orderTableView: UITableView!
    var orderList : [OrderModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show("Loading...")
        NetworkService.instance.fetchOrders { result in
            switch result {
            case .success(let list):
                ProgressHUD.dismiss()
                self.orderList = list
                self.orderTableView.reloadData()
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
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

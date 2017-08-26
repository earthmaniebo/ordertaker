//
//  MenuViewController.swift
//  Ordertaker
//
//  Created by Earth Maniebo on 8/26/17.
//  Copyright © 2017 Earth Maniebo. All rights reserved.
//

import UIKit
import RealmSwift

class MenuViewController: UIViewController {

    @IBOutlet weak var menuSearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    @IBAction func didTapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapAddButton(_ sender: Any) {
        self.performSegue(withIdentifier: kProductSegue, sender: self)
    }
    
    var products: Results<Product>!
    var selectedProductId: Int?
    var kProductSegue = "product_form"
    var kProductCell = "product_cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        products = ProductDataManager.get()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: kProductCell)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        products = ProductDataManager.get()
        tableView.reloadData()
        selectedProductId = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
                
            case kProductSegue:
                let destinationVC = segue.destination as! ProductFormViewController
                destinationVC.selectedProductId = selectedProductId
            default:
                print("default");
            }
        }
    }
}


extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count > 0 ? products.count : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kProductCell, for: indexPath as IndexPath) as! ProductTableViewCell
        let product = products[indexPath.row]
        
        cell.productNameLabel.text = product.name
        cell.productDescriptionLabel.text = product.productDescription
        cell.priceLabel.text = String(product.price)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProductId = products[indexPath.row].id
        self.performSegue(withIdentifier: kProductSegue, sender: self)
    }
}

//
//  ProductFormViewController.swift
//  Ordertaker
//
//  Created by Earth Maniebo on 8/26/17.
//  Copyright © 2017 Earth Maniebo. All rights reserved.
//

import UIKit

class ProductFormViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func didTapSaveButton(_ sender: Any) {
        save()
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func didTapCancelButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    var selectedProductId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let productId = selectedProductId {
            let product = ProductDataManager.get(id: productId)
            idTextField.text = String(product?.id ?? 0)
            idTextField.isUserInteractionEnabled = false
            productNameTextField.text = product?.name
            descriptionTextField.text = product?.productDescription
            priceTextField.text = String(product?.price ?? 0)
        }
    }
    
    func save() {
        let product = Product()
        product.id = Int(idTextField.text ?? "0")!
        product.name = productNameTextField.text ?? ""
        product.productDescription = descriptionTextField.text ?? ""
        product.price = Int(priceTextField.text ?? "0")!
        
        ProductDataManager.add(product)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

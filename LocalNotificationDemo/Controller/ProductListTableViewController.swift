//
//  ProductListTableViewController.swift
//  LocalNotificationDemo
//
//  Created by Webwerks1 on 7/24/19.
//  Copyright © 2019 Webwerks1. All rights reserved.
//

import UIKit
//import Alamofire
import SDWebImage
var count = 0

class ProductListTableViewController: UITableViewController {
    var getid = 0
    @IBOutlet var tableVIew: UITableView!
    var productDetails:[ProductLists]?
  
   
    override func viewDidLoad() {
        super.viewDidLoad()
       navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
     productList()
    }
    
    func productList(){
        let dictproduct = getid
        
        JsonParsing.callWebService(url: UrlEndPoints.getProductList, httpMethod: .get, responceTYpe: ProductListModel.self, parameters: ["product_category_id":dictproduct], headers: nil) { products in
            //count = (products.data?.count)!
            self.productDetails = products.data
            self.navigationItem.title = Singleton.shared.product_detail?[self.getid - 1].name
            self.tableView.reloadData()
        }
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productDetails?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell") as? ProductListCellTableViewCell
        cell?.cellProductTitle.text = productDetails?[indexPath.row].name
        cell?.cellProductSubTitle.text = productDetails?[indexPath.row].producer
        cell?.cellProductPrice.text = "Rs:" + String(productDetails?[indexPath.row].cost ?? 0)
        let urlimage = productDetails?[indexPath.row].product_images
        cell?.cellProductImage?.sd_setImage(with: URL(string: urlimage!), completed: nil)
        return cell!
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController
        vc?.id = productDetails?[indexPath.row].id ?? 0
        self.navigationController?.pushViewController(vc!, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

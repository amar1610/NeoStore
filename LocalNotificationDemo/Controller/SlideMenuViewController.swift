//
//  SlideMenuViewController.swift
//  LocalNotificationDemo
//
//  Created by Webwerks1 on 7/23/19.
//  Copyright © 2019 Webwerks1. All rights reserved.
//

import UIKit
import SideMenu
var arrmenuimages = [#imageLiteral(resourceName: "shoppingcart_icon"),#imageLiteral(resourceName: "tables_icon"),#imageLiteral(resourceName: "sofa_icon"),#imageLiteral(resourceName: "cupboard_icon"),#imageLiteral(resourceName: "chair_icon"),#imageLiteral(resourceName: "storelocator_icon"),#imageLiteral(resourceName: "myorders_icon"),#imageLiteral(resourceName: "logout_icon")]
var arrmenutitles = ["My Cart","Tables","Sofas","CupBoards","Chairs","StoreLocation","My Orders","Logout"]



class SlideMenuViewController: UIViewController {

    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var lblUserEmail: UILabel!
    
    var userdetails:Userdetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        profileImage.layer.borderWidth = 3
        profileImage.layer.masksToBounds = true
        
    
    }
   
    
}
    

extension SlideMenuViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrmenutitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tablecell = tableView.dequeueReusableCell(withIdentifier: "tablecell") as! MenuTableViewCell
        tablecell.slidemenuBagcount.isHidden = true
        tablecell.slideMenuCellImage.image = arrmenuimages[indexPath.item]
        tablecell.slideMenuCellTitle.text = arrmenutitles[indexPath.item]
         if indexPath.row == 0
         {
              tablecell.slidemenuBagcount.isHidden = false
            tablecell.slidemenuBagcount.layer.cornerRadius = tablecell.slidemenuBagcount.frame.width  / 2
            tablecell.slidemenuBagcount.text = String(describing:userdetails?.total_carts ?? 0)
        }
        tablecell.selectionStyle = .none
        return tablecell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        switch indexPath.item {
        case 1:
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProductListTableViewController") as! ProductListTableViewController
            vc.getid = Singleton.shared.product_detail?[0].id ?? 0
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProductListTableViewController") as! ProductListTableViewController
            vc.getid = Singleton.shared.product_detail?[2].id ?? 0
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProductListTableViewController") as! ProductListTableViewController
            vc.getid = Singleton.shared.product_detail?[3].id ?? 0
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProductListTableViewController") as! ProductListTableViewController
            vc.getid = Singleton.shared.product_detail?[1].id ?? 0
            self.navigationController?.pushViewController(vc, animated: true)
        case 7:
     SideMenuManager.default.menuLeftNavigationController?.removeFromParent()
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = UINavigationController(rootViewController: vc)
        appDelegate.window?.makeKeyAndVisible()
        default:
            print("exit")
        }
    }
    
    
}


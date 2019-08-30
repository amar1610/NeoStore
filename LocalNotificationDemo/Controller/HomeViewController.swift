//
//  HomeViewController.swift
//  LocalNotificationDemo
//
//  Created by Webwerks1 on 7/22/19.
//  Copyright © 2019 Webwerks1. All rights reserved.
//

import UIKit
import SideMenu
var arrBannerImage = [#imageLiteral(resourceName: "slider_img3"),#imageLiteral(resourceName: "slider_img4"),#imageLiteral(resourceName: "slider_img2"),#imageLiteral(resourceName: "slider_img1")]
var arrImage = [#imageLiteral(resourceName: "tableicon"),#imageLiteral(resourceName: "chairsicon"),#imageLiteral(resourceName: "sofaicon"),#imageLiteral(resourceName: "cupboardicon")]
var counter = 0
var currentPage = 0
var toogle = false
var time = Timer()
class HomeViewController: UIViewController {

    @IBOutlet weak var firstCollectionView: UICollectionView!
    
    @IBOutlet weak var SecondCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu_icon"), style: .done, target: self, action: #selector(slideMenuToggle))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "search_icon"), style: .done, target: self, action: nil)
         navigationItem.title = "NeoSTORE"
//        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
 self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
    
        fetchUserDetails()
     time =  Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(bannerSlider), userInfo:nil, repeats: true)
    }
    func fetchUserDetails(){
        JsonParsing.callWebService(url: UrlEndPoints.fetchAccDetails, httpMethod: .get, responceTYpe: FetchAccountDetail.self, parameters: nil, headers:["access_token":"\(Singleton.shared.userdata?.access_token ?? "")"]) { response in
            Singleton.shared.product_detail = response.data?.product_categories
        }
    }
     @objc func slideMenuToggle()
     {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let menu = storybord.instantiateViewController(withIdentifier: "SlideMenuViewController") as! SlideMenuViewController
        SideMenuManager.defaultManager.menuLeftNavigationController = UISideMenuNavigationController.init(rootViewController: menu)
        SideMenuManager.defaultManager.menuWidth = view.frame.width - 70
        if let sideMenu = SideMenuManager.default.menuLeftNavigationController {
            if sideMenu.presentingViewController == nil {
                self.navigationController?.present(sideMenu, animated: true, completion: nil)
                
            } else {
                sideMenu.dismiss(animated: false, completion: {
                    self.navigationController?.present(sideMenu, animated: true, completion: nil)
                    
                } )
            }
        }
       
    }
    @objc func bannerSlider(){
        if counter < arrBannerImage.count{
            let count = IndexPath.init(row: counter, section: 0)
            firstCollectionView.scrollToItem(at: count, at: .centeredHorizontally, animated: true)
            pageController.currentPage = counter
            counter += 1
        }
        else{
            counter = 0
            let count = IndexPath.init(row: counter, section: 0)
            firstCollectionView.scrollToItem(at: count, at: .centeredHorizontally, animated: true)
             pageController.currentPage = counter
        }
    }

    

}
extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == firstCollectionView
        { return arrBannerImage.count }
       
            return arrImage.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == firstCollectionView
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannercell", for: indexPath) as! HomeBannerCollectionViewCell
            cell.imageCell.image = arrBannerImage[indexPath.row]
            return cell
        }
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imagecell", for: indexPath) as! HomeImageCollectionViewCell
            cell.imagecell.image = arrImage[indexPath.row]
            return cell
     
       
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProductListTableViewController") as! ProductListTableViewController
            vc.getid = Singleton.shared.product_detail?[0].id ?? 0
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProductListTableViewController") as! ProductListTableViewController
            vc.getid = Singleton.shared.product_detail?[3].id ?? 0
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProductListTableViewController") as! ProductListTableViewController
            vc.getid = Singleton.shared.product_detail?[1].id ?? 0
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = storyboard?.instantiateViewController(withIdentifier: "ProductListTableViewController") as! ProductListTableViewController
            vc.getid = Singleton.shared.product_detail?[2].id ?? 0
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            print("exit")
        }
}
    
}
extension HomeViewController:UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == SecondCollectionView
        {
        let width = SecondCollectionView.frame.width
        let height = SecondCollectionView.frame.height
        return CGSize(width: width / 2 - 30, height:height / 2 - 30)
        }
        return CGSize(width: firstCollectionView.frame.width, height: firstCollectionView.frame.height)
    }


}

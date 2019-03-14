//
//  Home_VC.swift
//  Flight
//
//  Created by Little on 07/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class Home_VC:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource
{
   
    

    @IBAction func BusSearchClk(_ sender: Any) {
        
        let vc = BusSearchViewController.init(nibName: "BusSearchViewController", bundle: nil) 
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBOutlet weak var collVwHome: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "Home"
        // Do any additional setup after loading the view.
        
        
        let imageVw = UIImageView(image: UIImage(named: "logo-text"))
       // imageVw.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        
       self.navigationItem.titleView = imageVw

    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath as IndexPath) as! HomeCell
        
        // cell.myLabel.text = self.items[indexPath.item]
       // cell.backgroundColor = UIColor.blue // make cell more visible in our example project
        
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension Home_VC : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width-5
        return CGSize(width: collectionViewWidth/2, height: 268)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

//
//  Menu_VC.swift
//  Flight
//
//  Created by Little on 07/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class Menu_VC: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    var menu = ["My Trips","My Plans","My Reviews","My Chats","My Qna","Payments","Offers and Promotions","Refer and Earn","Scan QR code","Share","Help"]
     var menuImages = ["trip","plan","review","chat","qna","payment","offer","refer","scan","share","help"]
    // var menu = ["My Trips","My Plans","My Reviews","My Chats","My Qna","Payments","Offers and Promotions","Refer and Earn","Scan QR code","Share","Help"]
    let cellReuseIdentifier = "cell"

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var tblMenu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.title = "Menus"
        // Do any additional setup after loading the view.
         tblMenu.tableFooterView = UIView()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : MenuCell? = (tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell)
        if cell == nil {
            cell = MenuCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        }

        
        let image : UIImage = UIImage(named: menuImages[indexPath.row])!
      
        cell!.imageView!.image = image
        cell!.imageView?.contentMode = .scaleAspectFit
        cell?.textLabel?.text = self.menu[indexPath.row]
        
        return cell!
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

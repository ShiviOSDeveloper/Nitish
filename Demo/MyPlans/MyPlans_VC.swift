//
//  MyPlans_VC.swift
//  Flight
//
//  Created by Little on 10/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class MyPlans_VC: UIViewController,UITableViewDataSource,UITableViewDelegate
{
   
    
    @IBOutlet weak var tblMyPlans: UITableView!
    
    let MyPlans = ["Home","Packages", "Seight Seeing","Hotels","Events","Profile","Contacts Us"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Plans"
         tblMyPlans.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyPlans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        let cell:UITableViewCell?  = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell!.textLabel?.text = self.MyPlans[indexPath.row]
        
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if self.MyPlans[indexPath.row] == "Home"
        {
            tabBarController!.selectedIndex = 0
        }
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

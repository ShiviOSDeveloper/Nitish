//
//  AllPackages.swift
//  Flight
//
//  Created by Little on 10/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class AllPackages: UITableViewController {
    
   let arrAllPackages = ["All BookingTour","Tour Package Booking","Hotel Booking","Car Rentals Booking","Flight Booking","Slider Booking","All Package","Family Package","Honeymoon Package","Group Package","WeekEnd Package","Regular Package","Custom Package"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrAllPackages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell:UITableViewCell?  = tableView.dequeueReusableCell(withIdentifier: "AllPkg")
        
        cell?.textLabel?.text = self.arrAllPackages[indexPath.row]
        
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
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

//
//  HotelSearchViewController.swift
//  Flight
//
//  Created by Shiv on 09/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit
var Hotel_SearchModel = HotelSearchModel()

class HotelSearchViewController: UIViewController {

    @IBOutlet weak var hotelSearchView: HotelSearchView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Hotels"
        
       

        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkInClk(_ sender: Any) {
        
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "CalanderViewController") as! CalanderViewController
        if ((sender as AnyObject).tag == 1)
        {
        vc.isfrom = "checkIn"
        }
        else  if ((sender as AnyObject).tag == 2)
        {
            vc.isfrom = "checkOut"
        }
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        hotelSearchView.checkinTxtFld?.text = Hotel_SearchModel.checkIn
        hotelSearchView.checkOutTxtFld?.text = Hotel_SearchModel.checkOut
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

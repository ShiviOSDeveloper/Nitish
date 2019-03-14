//
//  BusSearchViewController.swift
//  Flight
//
//  Created by Shiv on 14/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit
let Bus_SearchModel = BusSearchModel()
class BusSearchViewController: UIViewController {

    @IBOutlet weak var originCityBusTxtFld: UITextField!
    @IBOutlet weak var destinationCityBusTxtFld: UITextField!
    @IBOutlet weak var departureDateBusTxtFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bus Booking"
        
        originCityBusTxtFld?.setBlueBorder()
        destinationCityBusTxtFld?.setBlueBorder()
        departureDateBusTxtFld?.setBlueBorder()
        // Do any additional setup after loading the view.
    }
    @IBAction func departureDateBusTxtFldClk(_ sender: Any) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CalanderViewController") as! CalanderViewController
        vc.isfrom = "departureDateBus"
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        departureDateBusTxtFld?.text = Bus_SearchModel.departureDate
}

    @IBAction func busSearchClk(_ sender: Any) {
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

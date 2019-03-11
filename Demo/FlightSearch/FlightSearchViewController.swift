//
//  FlightSearchViewController.swift
//  Flight
//
//  Created by Shiv on 10/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit
var Flight_SearchModel = FlightSearchModel()

class FlightSearchViewController: UIViewController {
@IBOutlet weak var flightSearchView: FlightSearchView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Flights"    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkInClk(_ sender: Any) {
        
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "CalanderViewController") as! CalanderViewController
        if ((sender as AnyObject).tag == 1)
        {
            vc.isfrom = "departure"
        }
        else  if ((sender as AnyObject).tag == 2)
        {
            vc.isfrom = "return"
        }
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        flightSearchView.departureDateTxtFld?.text = Flight_SearchModel.departureDate
        flightSearchView.returnDateTxtFld?.text = Flight_SearchModel.returnDate
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

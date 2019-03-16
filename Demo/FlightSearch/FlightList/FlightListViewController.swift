//
//  FlightListViewController.swift
//  Flight
//
//  Created by Shiv on 16/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class FlightListViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet weak var filghtTblVw: UITableView!
    var Flight_ListModel:FlightListModel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        filghtTblVw.register(UINib(nibName: "FlightListCell", bundle: nil), forCellReuseIdentifier: "FlightListCell")

        
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Flight_ListModel.resultData[0].fltSchedule.flt_originDestination.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightListCell", for: indexPath) as! FlightListCell
        
        
      //  let ID = Flight_ListModel.resultData[0].fltSchedule.flt_originDestination[indexPath.row].ID
        
        let OD = Flight_ListModel.resultData[0].fltSchedule.flt_originDestination[indexPath.row].OD[0]
        let FS = Flight_ListModel.resultData[0].fltSchedule.flt_originDestination[indexPath.row].OD[0].FS[0]
        cell.dTime.text = FS.dd
        cell.aTime.text = FS.ad
        cell.travellTime.text = self.timeFormatter(time: FS.du!)
        cell.classType.text = FS.classtype
        cell.mealType.text = FS.ml
        cell.price.text = "₹ " + String(Int.random(in: 1500..<4000))
        cell.stops.text = "\(OD.ts!) Stops"
        return cell;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    func timeFormatter(time:String)->String
    {
        let datefromater = DateFormatter.init()
        datefromater.dateFormat = "hhmm"
        let date = datefromater.date(from: time)
        datefromater.dateFormat = "hh"
        let hour = datefromater.string(from: date!)
        datefromater.dateFormat = "mm"
        let minute = datefromater.string(from: date!)
        
        let dateTime = hour + "h " + minute + "m"
        return dateTime
        
    }
}

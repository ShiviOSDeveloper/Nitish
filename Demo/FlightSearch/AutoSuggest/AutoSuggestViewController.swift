//
//  AutoSuggestViewController.swift
//  Flight
//
//  Created by Shiv on 15/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit

class AutoSuggestViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
   
    
    var isFrom:String! = ""
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var autoSuggestTblVw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       autoSuggestTblVw.tableFooterView = UIView()
       searchBar.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (self.isFrom == "From")
        {
            return Flight_SearchModel.AirFrom_autoSuggestModel.Air_PortsArrayModel.count
        }
        else
        {
            return Flight_SearchModel.AirTo_autoSuggestModel.Air_PortsArrayModel.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        if (self.isFrom == "From")
        {
            let flight_Model = Flight_SearchModel.AirFrom_autoSuggestModel.Air_PortsArrayModel[indexPath.row].Flight_ArrayModel[0]
            
            cell.textLabel?.text = flight_Model.an + "," + flight_Model.ct + "," + flight_Model.cn
        }
        else
        {
            let flight_Model = Flight_SearchModel.AirTo_autoSuggestModel.Air_PortsArrayModel[indexPath.row].Flight_ArrayModel[0]
            
            cell.textLabel?.text = flight_Model.an + ", " + flight_Model.ct + ", " + flight_Model.cn
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    

    func autoSuggestCall(strURL:String)
    {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: false)
        hud.label.text = "Loading"
        hud.mode = .annularDeterminate


        AFWrapper.requestGETURL(strURL, success:  {
            (JSONResponse) -> Void in
            
            
            if (self.isFrom == "From")
            {
                Flight_SearchModel.AirFrom_autoSuggestModel = AirautoSuggestModel()

                let Air_autoSuggestModelTemp = Flight_SearchModel.AirFrom_autoSuggestModel
                Air_autoSuggestModelTemp.id = JSONResponse["id"].string
                Air_autoSuggestModelTemp.key = JSONResponse["key"].string
                
                
                let responseArr = JSONResponse["airports"].array!
                
                //var  arrModel = [AirPortsModel]
                
                for i in (0..<responseArr.count)
                {
                    let Air_PortsModelTemp =  AirPortsModel()
                    let airportsDict = JSONResponse["airports"].array?[i].dictionary!
                    Air_PortsModelTemp.city = airportsDict?["city"]?.string
                    Air_PortsModelTemp.country = airportsDict?["country"]?.string
                    Air_PortsModelTemp.esKey = airportsDict?["esKey"]?.string
                    Air_PortsModelTemp.flight = airportsDict?["flight"]?.string
                    Air_PortsModelTemp.hotel = airportsDict?["hotel"]?.string
                    Air_PortsModelTemp.priority = airportsDict?["priority"]?.int
                    Air_PortsModelTemp.type = airportsDict?["type"]?.string
                    
                    let flightArr = airportsDict!["flight"]!.array!

                    for i in (0..<flightArr.count)
                    {
                        let flightModelTemp =  FlightModel()
                        let flightDict = airportsDict?["flight"]?.array![i].dictionary!
                        flightModelTemp.ac = flightDict?["ac"]?.string
                        flightModelTemp.an = flightDict?["an"]?.string
                        flightModelTemp.cc = flightDict?["cc"]?.string
                        flightModelTemp.cn = flightDict?["cn"]?.string
                        flightModelTemp.ct = flightDict?["ct"]?.string
                        flightModelTemp.priority = airportsDict?["priority"]?.int
                        Air_PortsModelTemp.Flight_ArrayModel.append(flightModelTemp)
                    }
                    Air_autoSuggestModelTemp.Air_PortsArrayModel.append(Air_PortsModelTemp)
                    
                }
                
            }
            else
            {
                Flight_SearchModel.AirTo_autoSuggestModel = AirautoSuggestModel()

                let Air_autoSuggestModelTemp = Flight_SearchModel.AirTo_autoSuggestModel
                Air_autoSuggestModelTemp.id = JSONResponse["id"].string
                Air_autoSuggestModelTemp.key = JSONResponse["key"].string
                
                
                let responseArr = JSONResponse["airports"].array!
                
                for i in (0..<responseArr.count)
                {
                    let Air_PortsModelTemp =  AirPortsModel()
                    let airportsDict = JSONResponse["airports"].array?[i].dictionary!
                    Air_PortsModelTemp.city = airportsDict?["city"]?.string
                    Air_PortsModelTemp.country = airportsDict?["country"]?.string
                    Air_PortsModelTemp.esKey = airportsDict?["esKey"]?.string
                    Air_PortsModelTemp.flight = airportsDict?["flight"]?.string
                    Air_PortsModelTemp.hotel = airportsDict?["hotel"]?.string
                    Air_PortsModelTemp.priority = airportsDict?["priority"]?.int
                    Air_PortsModelTemp.type = airportsDict?["type"]?.string
                    Air_autoSuggestModelTemp.Air_PortsArrayModel.append(Air_PortsModelTemp)

                    let flightArr = airportsDict!["flight"]!.array!
                    
                    for i in (0..<flightArr.count)
                    {
                        let flightModelTemp =  FlightModel()
                        let flightDict = airportsDict?["flight"]?.array![i].dictionary!
                        flightModelTemp.ac = flightDict?["ac"]?.string
                        flightModelTemp.an = flightDict?["an"]?.string
                        flightModelTemp.cc = flightDict?["cc"]?.string
                        flightModelTemp.cn = flightDict?["cn"]?.string
                        flightModelTemp.ct = flightDict?["ct"]?.string
                        flightModelTemp.priority = airportsDict?["priority"]?.int
                        Air_PortsModelTemp.Flight_ArrayModel.append(flightModelTemp)
                    }
                }
                
            }
            self.autoSuggestTblVw.reloadData()
            hud.hide(animated: true)
        }) {
            (error) -> Void in
            print(error)
            hud.hide(animated: true)
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        if (self.isFrom == "From")
         {
            
         Flight_SearchModel.AirFrom_autoSuggestModel.Air_PortsModel =     Flight_SearchModel.AirFrom_autoSuggestModel.Air_PortsArrayModel[indexPath.row]

            
            Flight_SearchModel.departure = Flight_SearchModel.AirFrom_autoSuggestModel.Air_PortsArrayModel[indexPath.row].city
            Flight_SearchModel.ac_departure = Flight_SearchModel.AirFrom_autoSuggestModel.Air_PortsArrayModel[indexPath.row].Flight_ArrayModel[0].ac
            
            
        }
        else
        {
            Flight_SearchModel.AirTo_autoSuggestModel.Air_PortsModel =     Flight_SearchModel.AirTo_autoSuggestModel.Air_PortsArrayModel[indexPath.row]

            Flight_SearchModel.destination = Flight_SearchModel.AirTo_autoSuggestModel.Air_PortsArrayModel[indexPath.row].city
            Flight_SearchModel.ac_destination = Flight_SearchModel.AirTo_autoSuggestModel.Air_PortsArrayModel[indexPath.row].Flight_ArrayModel[0].ac
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        let strURL = autSuggestUrl + searchBar.text!
      
        autoSuggestCall(strURL: strURL)
        
       
    }
}

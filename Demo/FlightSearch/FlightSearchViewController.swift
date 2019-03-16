//
//  FlightSearchViewController.swift
//  Flight
//
//  Created by Shiv on 10/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//

import UIKit
var Flight_SearchModel = FlightSearchModel()
var Flvart_ListModel = FlightListModel()
class FlightSearchViewController: UIViewController {
@IBOutlet weak var flightSearchView: FlightSearchView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Flights"    
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func checkInClk(_ sender: Any)
    {
        
        
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
        
        
        //https://www.yatra.com/nearby-service/autoSuggest?key=varanasi
    }
    
    @IBAction func FromToClick(_ sender: Any)
    {
        
        if ((sender as AnyObject).tag == 100)
        {
            
            let vc:AutoSuggestViewController = AutoSuggestViewController.init(nibName: "AutoSuggestViewController", bundle: nil)
            vc.isFrom = "From"
            vc.title = "Departure"
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        else
        {
            let vc:AutoSuggestViewController = AutoSuggestViewController.init(nibName: "AutoSuggestViewController", bundle: nil)
            vc.isFrom = "To"
             vc.title = "Destination"
            self.navigationController?.pushViewController(vc, animated: true)
        }
       
        
    }
    
    
   
    
    override func viewDidAppear(_ animated: Bool) {
        flightSearchView.departureDateTxtFld?.text = Flight_SearchModel.departureDate
        flightSearchView.returnDateTxtFld?.text = Flight_SearchModel.returnDate
        flightSearchView.departureTxtFld?.text = Flight_SearchModel.departure
        flightSearchView.destinationTxtFld?.text = Flight_SearchModel.destination
       
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func searchFlightClk(_ sender: Any) {
        
        Flight_SearchModel.travellerClass = flightSearchView.classTxtFld?.text
        Flight_SearchModel.traveller = flightSearchView.travellerTxtFld?.text
        if (Flight_SearchModel.ac_departure != nil)
       {
        //let url =  "https://secure.yatra.com/air-service/dbe0e9dc-38f0-4c67-a8b6-604f919241fe/search?type=R&viewName=normal&flexi=0&noOfSegments=2&origin=DEL&originCountry=IN&destination=BOM&destinationCountry=IN&flight_depart_date=02/04/2019&arrivalDate=20/04/2019&ADT=1&CHD=0&INF=0&class=Economy&hb=0&source=fresco-home&booking-type=official"
        
        if (Flight_SearchModel.travellerClass == nil)
        {
            alert(message: "Please enter traveller class", title: "OOPS")
            return
        }
       
         let url = "https://secure.yatra.com/air-service/\(Flight_SearchModel.AirTo_autoSuggestModel.id!)/search?type=R&viewName=normal&flexi=0&noOfSegments=2&origin=\(Flight_SearchModel.ac_departure!)&originCountry=IN&destination=\(Flight_SearchModel.ac_destination!)&destinationCountry=IN&flight_depart_date=\(Flight_SearchModel.departureDate!)&arrivalDate=\(Flight_SearchModel.returnDate!)&ADT=1&CHD=0&INF=0&class=\(Flight_SearchModel.travellerClass!)&hb=0&source=fresco-home&booking-type=official"
        
        //origin=DEL&originCountry=IN&destination=BOM&destinationCountry=IN&flight_depart_date=02/04/2019&arrivalDate=20/04/2019&ADT=1&CHD=0&INF=0&class=Economy&hb=0&source=fresco-home&booking-type=official"
        
        
                let hud = MBProgressHUD.showAdded(to: self.view, animated: false)
                hud.label.text = "Loading"
                hud.mode = .annularDeterminate
        
                AFWrapper.requestGETURL(url, success:  {
                    (JSONResponse) -> Void in
        
        
                    print(JSONResponse)
                    
                    let FlightList = FlightListModel()
                    FlightList.eagerFetch = JSONResponse["eagerFetch"].string
                    FlightList.userId = JSONResponse["userId"].string
                    
                    let resultDataDic = JSONResponse["resultData"].array?[0].dictionary
                    
            
                    let resultData = resultDataModel()
                    resultData.isFlights = resultDataDic?["isFlights"]?.string
                    resultData.isWarnings = resultDataDic?["isWarnings"]?.string
                    resultData.isError = resultDataDic?["isError"]?.string
                    
                    let fltSchedule = resultDataDic?["fltSchedule"]?.dictionary
                    
                    resultData.fltSchedule.scid = fltSchedule?["scid"]?.string
                    
                    
                    
                    let originDestinationDate = Flight_SearchModel.ac_departure+Flight_SearchModel.ac_destination + self.SouceDestinationDDMMYYFormat(date:(self.flightSearchView.departureDateTxtFld?.text!)!)

                    
                    
                    //let originDestinationDate = "BOMDEL20190420"
                    var originDestinationArray = fltSchedule![originDestinationDate]!.array!
                    
                    for i in (0..<originDestinationArray.count)
                    {
                        let flt_originDestinationTemp =  flt_originDestinationModel()
                        
                       let BOMDELDic =  originDestinationArray[i].dictionary
                        
                        flt_originDestinationTemp.ID = BOMDELDic?["ID"]?.string
                        
                        var ODDict = BOMDELDic?["OD"]?.array?[0]
                        
                         let ODMod = ODModel()
                         ODMod.classtype = ODDict?["classtype"].string
                         ODMod.ts = ODDict?["ts"].string
                         ODMod.tdu = ODDict?["tdu"].string
            
                        
                         var FSDict = ODDict?["FS"].array?[0]
                      
                         let FSOmd = FSMODEL()
                         FSOmd.aac = FSDict?["aac"].string
                         FSOmd.dac = FSDict?["dac"].string
                         FSOmd.dd = FSDict?["dd"].string
                         FSOmd.ad = FSDict?["ad"].string
                         FSOmd.ddt = FSDict?["ddt"].string
                         FSOmd.du = FSDict?["du"].string
                         FSOmd.ml = FSDict?["ml"].string
                         FSOmd.classtype = FSDict?["classtype"].string
                        
                         ODMod.FS.append(FSOmd)
                        
                        flt_originDestinationTemp.OD = [ODMod]
                        resultData.fltSchedule.flt_originDestination.append(flt_originDestinationTemp)
                        
                        
                    }
                    
                    FlightList.resultData  = [resultData]
//                    let originDestinationDate = Flight_SearchModel.ac_departure+Flight_SearchModel.ac_destination+"20190420"
//
//
//                    var riginDestinationArray = fltSchedule?[originDestinationDate]?.dictionary
//
//                    let searchKey = "BOMAMD6E18120190420AMDDEL6E16220190420_6EAPI"
//
//                    let ORDictionary = riginDestinationArray?[searchKey]?.dictionary
//
//
                    
                    
        
                    let vc:FlightListViewController = FlightListViewController.init(nibName: "FlightListViewController", bundle: nil)
                     vc.Flight_ListModel = FlightList
                   // vc.title = Flight_SearchModel.ac_departure + " < - > " + Flight_SearchModel.ac_destination
                    self.navigationController?.pushViewController(vc, animated: true)
//
//
        
                    hud.hide(animated: true)
                }) {
                    (error) -> Void in
                    print(error)
                    hud.hide(animated: true)
        
                }
        
       }
        
        
    }
    
    
    func SouceDestinationDDMMYYFormat(date:String)->String
    {
        //20190420
        let datefromater = DateFormatter.init()
        datefromater.dateFormat = "dd/mm/yyyy"
        let date = datefromater.date(from: date)
        datefromater.dateFormat = "yyyymmdd"
        let formattedDate = datefromater.string(from: date!)
        return formattedDate
        
    }
}

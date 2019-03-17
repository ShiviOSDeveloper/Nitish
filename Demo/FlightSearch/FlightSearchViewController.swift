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
    
    
   
    
    override func viewDidAppear(_ animated: Bool)
    {
        
       
        
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
        
        
        let dDateStr = Flight_SearchModel.departureDate
        let datefromater = DateFormatter.init()
        datefromater.dateFormat = "dd/mm/yyyy"
        let depDate = datefromater.date(from: dDateStr!)!
        let destDateStr = Flight_SearchModel.returnDate
        let destDate = datefromater.date(from: destDateStr!)!
        if (Flight_SearchModel.ac_departure == nil)
        {
            alert(message: "Please enter Departure City/Destination City", title: "Flight Search")
            return
        }
       else if depDate.compare(destDate) == .orderedDescending
        {
            alert(message: "Return date not valid!", title: "Flight Search")
            return
        }
        else if (Flight_SearchModel.traveller == nil)
        {
            alert(message: "Please enter traveller", title: "Flight Search")
            return
        }
        else if (Flight_SearchModel.travellerClass == nil)
        {
            alert(message: "Please enter traveller class", title: "Flight Search")
            return
        }
        //let url =  "https://secure.yatra.com/air-service/dbe0e9dc-38f0-4c67-a8b6-604f919241fe/search?type=R&viewName=normal&flexi=0&noOfSegments=2&origin=DEL&originCountry=IN&destination=BOM&destinationCountry=IN&flight_depart_date=02/04/2019&arrivalDate=20/04/2019&ADT=1&CHD=0&INF=0&class=Economy&hb=0&source=fresco-home&booking-type=official"
        
        let Air_PortsModelTemp_From = Flight_SearchModel.AirFrom_autoSuggestModel.Air_PortsModel
        let Flight_ArrayModelTemp_From = Air_PortsModelTemp_From.Flight_ArrayModel[0]
        
        let Air_PortsModelTemp_To = Flight_SearchModel.AirTo_autoSuggestModel.Air_PortsModel
        let Flight_ArrayModelTemp_To = Air_PortsModelTemp_To.Flight_ArrayModel[0]
        
        
        let url = "https://secure.yatra.com/air-service/\(Flight_SearchModel.AirFrom_autoSuggestModel.id!)/search?type=R&viewName=normal&flexi=0&noOfSegments=2&origin=\(Flight_SearchModel.ac_departure!)&originCountry=\(Flight_ArrayModelTemp_From.cc!)&destination=\(Flight_SearchModel.ac_destination!)&destinationCountry=\(Flight_ArrayModelTemp_To.cc!)&flight_depart_date=\(Flight_SearchModel.departureDate!)&arrivalDate=\(Flight_SearchModel.returnDate!)&ADT=1&CHD=0&INF=0&class=\(Flight_SearchModel.travellerClass!)&hb=0&source=fresco-home&booking-type=official"
        
        print("url=\(url)")
        
                let hud = MBProgressHUD.showAdded(to: self.view, animated: false)
                hud.label.text = "Loading"
                hud.mode = .annularDeterminate
        
                AFWrapper.requestGETURL(url, success:  {
                    (JSONResponse) -> Void in
        
                    hud.hide(animated: true)

                    if(JSONResponse["meta"].dictionary?["success"]?.bool == false)
                    {
                        self.alert(message: JSONResponse["meta"].dictionary?["errorMsg"]?.string ?? "", title: "Oops")
                        return
                    }
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

                    
                    //==============================DELBOMAI62420190317_GALDOM
                    let fareDetails = resultDataDic?["fareDetails"]?.dictionary
                    let originDestinationfareDetailsdictionary = fareDetails?[originDestinationDate]?.dictionary!
                 
                   
                    
                    if fltSchedule?.count == 0
                    {
                        self.alert(message: "Please search with different choice", title: "Ooops!")
                        return
                    }
                    //=============================
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
                        
                        
                        
                        
                        
                        //===================================
                        let ID_Galdom = BOMDELDic?["ID"]?.string
                        
                        let fareDetail_ID_originDestinationTemp = fareDetail_ID_originDestinationModel()
                        let originDestinationfareDetailsdictionary_withGaldom = originDestinationfareDetailsdictionary?[ID_Galdom!]?.dictionary!
                        
                        let O_Model = OModel()
                        let oDictionary = originDestinationfareDetailsdictionary_withGaldom?["O"]?.dictionary!
                        let adt_Mod = ADTModel()
                        let ADTDictionary = oDictionary?["ADT"]?.dictionary!
                        adt_Mod.bf = ADTDictionary?["bf"]?.string
                        adt_Mod.tf = ADTDictionary?["tf"]?.string
                        O_Model.ADTMod = adt_Mod
                        
                        
                        
                        
                        fareDetail_ID_originDestinationTemp.OMod = O_Model
                        flt_originDestinationTemp.fareDetail_ID_originDestination = fareDetail_ID_originDestinationTemp
                        
                        
                        resultData.fltSchedule.flt_originDestination.append(flt_originDestinationTemp)

                    }
                    
                    
                    
                    FlightList.resultData  = [resultData]
                    
    
        
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

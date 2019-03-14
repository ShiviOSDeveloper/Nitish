//
//  CalanderViewController.swift
//  Flight
//
//  Created by Shiv on 09/03/19.
//  Copyright © 2019 Nitish. All rights reserved.
//https://github.com/shoheiyokoyama/Koyomi

import UIKit
import Koyomi
class CalanderViewController: UIViewController,KoyomiDelegate {
    var isfrom : String = String()
    @IBOutlet weak var dateLbl: UILabel!
    var koyomi = Koyomi(frame: CGRect(x: 0, y: 0, width: 0, height: 0), sectionSpace: 0, cellSpace: 0, inset: .zero, weekCellHeight: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 0, y : 180, width: self.view.frame.size.width, height: 300)
         koyomi = Koyomi(frame: frame, sectionSpace: 1.5, cellSpace: 0.5, inset: .zero, weekCellHeight: 25)
        view.addSubview(koyomi)
        
        let currentDateString = koyomi.currentDateString()
        dateLbl.text = currentDateString

        koyomi.selectionMode = .single(style: .circle)
        
        koyomi.calendarDelegate = self
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        switch isfrom {
        case "checkIn":
            let date = formatter.date(from: Hotel_SearchModel.checkIn)
            koyomi.select(date: date!)
            break
        case "checkOut":
            let date = formatter.date(from: Hotel_SearchModel.checkOut)
            koyomi.select(date: date!)
            break
        case "departure":
            let date = formatter.date(from: Flight_SearchModel.departureDate)
            koyomi.select(date: date!)
            break
        case "return":
            let date = formatter.date(from: Flight_SearchModel.returnDate)
            koyomi.select(date: date!)
            break
        case "departureDateBus":
            let date = formatter.date(from: Bus_SearchModel.departureDate)
            koyomi.select(date: date!)
            break
            
        default: break
            
            
        }
        self.title = "Calander"
    }
    
    func koyomi(_ koyomi: Koyomi, didSelect date: Date?, forItemAt indexPath: IndexPath)
    {
        print(date ?? "")
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let myString = formatter.string(from:date!)
        switch isfrom {
        case "checkIn":
            Hotel_SearchModel.checkIn = myString
            self.navigationController?.popViewController(animated: false)

        break
        case "checkOut":
            Hotel_SearchModel.checkOut = myString
            self.navigationController?.popViewController(animated: false)
            break
        case "departure":
            Flight_SearchModel.departureDate = myString
            self.navigationController?.popViewController(animated: false)
            
            break
        case "return":
            Flight_SearchModel.returnDate = myString
            self.navigationController?.popViewController(animated: false)
            break
        case "departureDateBus":
            Bus_SearchModel.departureDate = myString
            self.navigationController?.popViewController(animated: false)
            break
        default:
               self.navigationController?.popViewController(animated: false)
            break
            
            
        }
        
        
    }

    @IBAction func nextBtnClk(_ sender: Any) {
        if ((sender as AnyObject).tag == 1)
        {
            koyomi.display(in: .next)
        }
        else
        {
            koyomi.display(in: .previous)
        }
        
        let currentDateString = koyomi.currentDateString()
        dateLbl.text = currentDateString

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

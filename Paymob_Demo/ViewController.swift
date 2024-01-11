//
//  ViewController.swift
//  Paymob_Demo
//
//  Created by Admin on 09/01/2024.
//

import UIKit
import AcceptSDK

class ViewController: UIViewController {
 
    


    
    
    let accept = AcceptSDK()
    
    let bData = [  "apartment": "NA",
                   "email": "thehanzalaraza@gmail.com",
                   "floor": "NA",
                   "first_name": "NA",
                   "street": "NA",
                   "building": "NA",
                   "phone_number": "+923472499880",
                   "shipping_method": "Online",
                   "postal_code": "NA",
                   "city": "Karachi",
                   "country": "Pakistan",
                   "last_name": "raza",
                   "state": "NA"
    ]
    
    
    // Replace this string with your payment ke
    
    let realKey = "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SjFjMlZ5WDJsa0lqb3hNVEk1TWpjc0ltRnRiM1Z1ZEY5alpXNTBjeUk2TVRBd0xDSmpkWEp5Wlc1amVTSTZJbEJMVWlJc0ltbHVkR1ZuY21GMGFXOXVYMmxrSWpveE1qQTVOamNzSW05eVpHVnlYMmxrSWpveE1UQXlPREk1TVN3aVltbHNiR2x1WjE5a1lYUmhJanA3SW1acGNuTjBYMjVoYldVaU9pSlpZWE5wY2lJc0lteGhjM1JmYm1GdFpTSTZJazB1SUVsemJHRnRJaXdpYzNSeVpXVjBJam9pUlhSb1lXNGdUR0Z1WkNJc0ltSjFhV3hrYVc1bklqb2lPREF5T0NJc0ltWnNiMjl5SWpvaVRrRWlMQ0poY0dGeWRHMWxiblFpT2lKT1FTSXNJbU5wZEhraU9pSktZWE5yYjJ4emEybGlkWEpuYUNJc0luTjBZWFJsSWpvaVRrRWlMQ0pqYjNWdWRISjVJam9pVUVGTElpd2laVzFoYVd3aU9pSmpjMEJqWVhSeWNHc3VZMjl0SWl3aWNHaHZibVZmYm5WdFltVnlJam9pS3preU16SXlNall5TmpjeE5DSXNJbkJ2YzNSaGJGOWpiMlJsSWpvaU1ERTRPVGdpTENKbGVIUnlZVjlrWlhOamNtbHdkR2x2YmlJNklrNUJJbjBzSW14dlkydGZiM0prWlhKZmQyaGxibDl3WVdsa0lqcG1ZV3h6WlN3aVpYaDBjbUVpT250OUxDSnphVzVuYkdWZmNHRjViV1Z1ZEY5aGRIUmxiWEIwSWpwbVlXeHpaU3dpWlhod0lqb3hOekEwT1Rjd09UZzFMQ0p3Yld0ZmFYQWlPaUl4TVRBdU9UTXVNakUyTGpFNE5DSjkuSXo4X3NqMGpJcnhfTGtIMy1iZEVnZTdTby01cWF4bmxCUlgwelE2TkRudUE1Y2k4WDhKR2V3dF95c0VybWVsZHZyaF9HY2p2UDRoOHpCV2s1VnBaLWc="

    
    func doPay(){
//        do {
//                   try accept.presentPayVC(vC: self, paymentKey: realKey, country: .Pakistan, saveCardDefault:
//                   true, showSaveCard: true, showAlerts: true)
//               } catch AcceptSDKError.MissingArgumentError(let errorMessage) {
//                   print(errorMessage)
//               }  catch let error {
//                   print(error.localizedDescription)
//               }
//        do {
//        try accept.presentPayVC(vC: self, paymentKey: realKey,  saveCardDefault: true,
//        showSaveCard: true, showAlerts: true)
//        } catch AcceptSDKError.MissingArgumentError(let errorMessage) {
//                   print(errorMessage)
//               }  catch let error {
//                   print(error.localizedDescription)
//               }
        
        
        do {
                   try accept.presentPayVC(vC: self, paymentKey: realKey, saveCardDefault:
                   true, showSaveCard: true, showAlerts: true)
               } catch AcceptSDKError.MissingArgumentError(let errorMessage) {
                   print(errorMessage)
               }  catch let error {
                   print(error.localizedDescription)
               }
    
        
//        do {
//            
//            try accept.presentPayVC(vC: self, paymentKey: realKey, saveCardDefault:
//                      true, showSaveCard: true, showAlerts: true)
////            try accept.presentPayVC(vC: <#T##UIViewController#>, paymentKey: <#T##String#>, saveCardDefault: <#T##Bool#>, showSaveCard: <#T##Bool#>, showAlerts: <#T##Bool#>)
//        } catch AcceptSDKError.MissingArgumentError(let errorMessage) {
//            print(errorMessage)
//        }  catch let error {
//            print(error.localizedDescription)
//        }

    }
    
//    func doPayReal(){
//        do {
//            try accept.presentPayVC(vC: <#T##UIViewController#>, paymentKey: <#T##String#>, saveCardDefault: <#T##Bool#>, showSaveCard: <#T##Bool#>, showAlerts: <#T##Bool#>)
//        }
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        accept.delegate = self
        
        doPay()
    }


}


extension ViewController : AcceptSDKDelegate {
    func userDidCancel() {
        print("userDidCancel")
    }
    
    func paymentAttemptFailed(_ error: AcceptSDKError, detailedDescription: String) {
        print("paymentAttemptFailed")
        print(error.localizedDescription)
        print(detailedDescription)

    }
    
    func transactionRejected(_ payData: PayResponse) {
        print("transactionRejected")

    }
    
    func transactionAccepted(_ payData: PayResponse) {
        print("transactionAccepted")

    }
    
    func transactionAccepted(_ payData: PayResponse, savedCardData: SaveCardResponse) {
        print("transactionAcceptedWithSavedCard")

    }
    
    func userDidCancel3dSecurePayment(_ pendingPayData: PayResponse) {
        print("userDidCancel3dSecurePayment")

    }
    
    
}


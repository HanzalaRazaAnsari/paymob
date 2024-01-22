//
//  ViewController.swift
//  Paymob_Demo
//
//  Created by Admin on 09/01/2024.
//

import UIKit
import AcceptSDK
import Alamofire

class ViewController: UIViewController {
 
    let accept = AcceptSDK()
    
    var orderID = Int()
    var accessToken = String()
    var profile : Profile?
    
    
    
    
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
    
    var realKey = String()

    
    func doPay(){
        
        do {
                   try accept.presentPayVC(vC: self, paymentKey: realKey, saveCardDefault:
                   true, showSaveCard: true, showAlerts: true)
               } catch AcceptSDKError.MissingArgumentError(let errorMessage) {
                   print(errorMessage)
               }  catch let error {
                   print(error.localizedDescription)
               }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        accept.delegate = self
        initialTokenRequest()
//        doPay()
    }
    
    
    
    func initialTokenRequest() {
        // API endpoint URL
        let apiUrl = "https://pakistan.paymob.com/api/auth/tokens"

        // API parameters
        let apiKey = "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TVRBNE5qZzRMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuaXdBVThFUUdWcmkzTnFJd2t3dV9HMmdFcEwxWUZNLWR1Z2xGVHdLZzhpRkNxd21TZmUzNndhM2pqNWNWVjNsZ1FUMVV6R3dobW9kelZTUzg3VGw1eGc="

        // Headers
        let headers: HTTPHeaders = ["Content-Type": "application/json"]

        // Parameters
        let parameters: [String: Any] = ["api_key": apiKey]

        // Make the Alamofire GET request
        AF.request(apiUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default , headers: headers)
            .responseDecodable(of: InitialTokenResp.self) { response in
                switch response.result {
                case .success(let value):
                    // Access the parsed response using the InitialTokenResp model
                    print("API Response: \(value)")
                    
                    if let token = value.token {
                        self.accessToken = token
                    }
                    
                    if let profile = value.profile {
                        self.profile = profile
                    }
                    
                    self.orderRegistration()
                    
                    print("Token: \(value.token ?? "")")
                    
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
    }
    
    

    
    func orderRegistration(){
        
        let requestBody: [String: Any] = [
            "auth_token": self.accessToken,
            "delivery_needed": false,
            "amount_cents": 100,
            "currency": "PKR"
        ]
        
        let apiUrl = "https://pakistan.paymob.com/api/ecommerce/orders"
        
        // Headers for the POST request
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        // Make the Alamofire POST request
        AF.request(apiUrl, method: .post, parameters: requestBody, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: OrderRegistrationRequest.self) { response in
                switch response.result {
                case .success(let value):
                    // Access the parsed response using the OrderRegistrationRequest model
                    print("API Response: \(value)")
                    
                    // Access specific properties from the response
                    print("Order ID: \(value.id ?? 0)")
                    
                    if let id = value.id {
                        self.orderID = id
                    }
//                    print("Created At: \(value.createdAt ?? "")")
//                    print("Merchant Name: \(value.merchant?.companyName ?? "")")
                    // Add more property access as needed
                    
                    self.getPaymentKey()
                    
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    
                    // Additional error details for debugging
                    if let data = response.data {
                        let errorResponse = String(data: data, encoding: .utf8)
                        print("Error Response: \(errorResponse ?? "No data")")
                    }
                    print("HTTP Status Code: \(response.response?.statusCode ?? -1)")
                }
                
            }
    }
    
    
    
    func getPaymentPayload() -> PaymentKeyPayload {
        let billingData = BillingData(apartment: "NA", email: profile?.user?.email, floor: "NA", firstName: profile?.user?.firstName, street: "NA", building: "NA", phoneNumber: profile?.phones?.first, shippingMethod: "NA", postalCode: "NA", city: profile?.city, country: profile?.country, lastName: profile?.user?.lastName, state: "NA")
        
        return PaymentKeyPayload(authToken: self.accessToken, amountCents: "100", expiration: 3600, orderID: String(orderID), billingData: billingData, currency: "PKR", integrationID: 120967, lockOrderWhenPaid: "false")
    }
    func getPaymentKey(){
        
        let apiUrl = "https://pakistan.paymob.com/api/acceptance/payment_keys"
        
        // Headers for the POST request
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        
        // Make the Alamofire POST request
        AF.request(apiUrl, method: .post, parameters: getPaymentPayload(), encoder: JSONParameterEncoder.default,headers: headers)
            .responseDecodable(of: InitialTokenResp.self) { response in
                switch response.result {
                case .success(let value):
                    // Access the parsed response using your response model
                    print("API Response: \(value)")
                    
                    if let payment = value.token {
                        self.realKey = payment
                    }
                    
                    self.doPay()
                    // Access specific properties from the response
                    // Modify this part based on your response model structure
                    
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    
                    // Additional error details for debugging
                    if let data = response.data {
                        let errorResponse = String(data: data, encoding: .utf8)
                        print("Error Response: \(errorResponse ?? "No data")")
                    }
                    print("HTTP Status Code: \(response.response?.statusCode ?? -1)")
                }
            }
        
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


//
//  OrderRegistrationRequest.swift
//  Paymob_Demo
//
//  Created by Admin on 11/01/2024.
//

import Foundation

public class OrderRegistrationRequest: Codable {
    public var id: Int?
//    public var createdAt: String?
//    public var deliveryNeeded: Bool?
//    public var merchant: Merchant?
//    public var collector: String?
//    public var amountCents: Int?
//    public var shippingData: String?
//    public var currency: String?
//    public var isPaymentLocked: Bool?
//    public var isReturn: Bool?
//    public var isCancel: Bool?
//    public var isReturned: Bool?
//    public var isCanceled: Bool?
//    public var merchantOrderID: String?
//    public var walletNotification: String?
//    public var paidAmountCents: Int?
//    public var notifyUserWithEmail: Bool?
//    public var items: [String]?
//    public var orderURL: String?
//    public var commissionFees: Int?
//    public var deliveryFeesCents: Int?
//    public var deliveryVatCents: Int?
//    public var paymentMethod: String?
//    public var merchantStaffTag: String?
//    public var apiSource: String?
//    public var token: String?
//    public var url: String?

    enum CodingKeys: String, CodingKey {
        case id
//        case createdAt
//        case deliveryNeeded
//        case merchant
//        case collector
//        case amountCents
//        case shippingData
//        case currency
//        case isPaymentLocked
//        case isReturn
//        case isCancel
//        case isReturned
//        case isCanceled
//        case merchantOrderID
//        case walletNotification
//        case paidAmountCents
//        case notifyUserWithEmail
//        case items
//        case orderURL
//        case commissionFees
//        case deliveryFeesCents
//        case deliveryVatCents
//        case paymentMethod
//        case merchantStaffTag
//        case apiSource
//        case token
//        case url
    }

//    public init(id: Int?, createdAt: String?, deliveryNeeded: Bool?, merchant: Merchant?, collector: String?, amountCents: Int?, shippingData: String?, currency: String?, isPaymentLocked: Bool?, isReturn: Bool?, isCancel: Bool?, isReturned: Bool?, isCanceled: Bool?, merchantOrderID: String?, walletNotification: String?, paidAmountCents: Int?, notifyUserWithEmail: Bool?, items: [String]?, orderURL: String?, commissionFees: Int?, deliveryFeesCents: Int?, deliveryVatCents: Int?, paymentMethod: String?, merchantStaffTag: String?, apiSource: String?, token: String?, url: String?) {
//        self.id = id
//        self.createdAt = createdAt
//        self.deliveryNeeded = deliveryNeeded
//        self.merchant = merchant
//        self.collector = collector
//        self.amountCents = amountCents
//        self.shippingData = shippingData
//        self.currency = currency
//        self.isPaymentLocked = isPaymentLocked
//        self.isReturn = isReturn
//        self.isCancel = isCancel
//        self.isReturned = isReturned
//        self.isCanceled = isCanceled
//        self.merchantOrderID = merchantOrderID
//        self.walletNotification = walletNotification
//        self.paidAmountCents = paidAmountCents
//        self.notifyUserWithEmail = notifyUserWithEmail
//        self.items = items
//        self.orderURL = orderURL
//        self.commissionFees = commissionFees
//        self.deliveryFeesCents = deliveryFeesCents
//        self.deliveryVatCents = deliveryVatCents
//        self.paymentMethod = paymentMethod
//        self.merchantStaffTag = merchantStaffTag
//        self.apiSource = apiSource
//        self.token = token
//        self.url = url
//    }
}

// MARK: - Merchant
public class Merchant: Codable {
    public var id: Int?
    public var createdAt: String?
    public var phones: [String]?
    public var companyEmails: [String]?
    public var companyName: String?
    public var state: String?
    public var country: String?
    public var city: String?
    public var postalCode: String?
    public var street: String?

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt
        case phones
        case companyEmails
        case companyName
        case state
        case country
        case city
        case postalCode
        case street
    }

    public init(id: Int?, createdAt: String?, phones: [String]?, companyEmails: [String]?, companyName: String?, state: String?, country: String?, city: String?, postalCode: String?, street: String?) {
        self.id = id
        self.createdAt = createdAt
        self.phones = phones
        self.companyEmails = companyEmails
        self.companyName = companyName
        self.state = state
        self.country = country
        self.city = city
        self.postalCode = postalCode
        self.street = street
    }
}

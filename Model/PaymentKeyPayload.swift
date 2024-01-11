//
//  PaymentKeyPayload.swift
//  Paymob_Demo
//
//  Created by Admin on 11/01/2024.
//

import Foundation


public class PaymentKeyPayload: Codable {
    public var authToken: String?
    public var amountCents: String?
    public var expiration: Int?
    public var orderID: String?
    public var billingData: BillingData?
    public var currency: String?
    public var integrationID: Int?
    public var lockOrderWhenPaid: String?

    enum CodingKeys: String, CodingKey {
        case authToken
        case amountCents
        case expiration
        case orderID
        case billingData
        case currency
        case integrationID
        case lockOrderWhenPaid
    }

    public init(authToken: String?, amountCents: String?, expiration: Int?, orderID: String?, billingData: BillingData?, currency: String?, integrationID: Int?, lockOrderWhenPaid: String?) {
        self.authToken = authToken
        self.amountCents = amountCents
        self.expiration = expiration
        self.orderID = orderID
        self.billingData = billingData
        self.currency = currency
        self.integrationID = integrationID
        self.lockOrderWhenPaid = lockOrderWhenPaid
    }
}

// MARK: - BillingData
public class BillingData: Codable {
    public var apartment: String?
    public var email: String?
    public var floor: String?
    public var firstName: String?
    public var street: String?
    public var building: String?
    public var phoneNumber: String?
    public var shippingMethod: String?
    public var postalCode: String?
    public var city: String?
    public var country: String?
    public var lastName: String?
    public var state: String?

    enum CodingKeys: String, CodingKey {
        case apartment
        case email
        case floor
        case firstName
        case street
        case building
        case phoneNumber
        case shippingMethod
        case postalCode
        case city
        case country
        case lastName
        case state
    }

    public init(apartment: String?, email: String?, floor: String?, firstName: String?, street: String?, building: String?, phoneNumber: String?, shippingMethod: String?, postalCode: String?, city: String?, country: String?, lastName: String?, state: String?) {
        self.apartment = apartment
        self.email = email
        self.floor = floor
        self.firstName = firstName
        self.street = street
        self.building = building
        self.phoneNumber = phoneNumber
        self.shippingMethod = shippingMethod
        self.postalCode = postalCode
        self.city = city
        self.country = country
        self.lastName = lastName
        self.state = state
    }
}

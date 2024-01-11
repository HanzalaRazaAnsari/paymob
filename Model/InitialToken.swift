//
//  InitialToken.swift
//  Paymob_Demo
//
//  Created by Admin on 11/01/2024.
//

import Foundation


class InitialTokenResp: Codable {
    
    public var profile: Profile?
    public var token: String?
    
    enum CodingKeys: String, CodingKey {
        case profile
        case token
    }
    
}

public class Profile: Codable {
    public var id: Int?
    public var user: User?
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
        case user
        case phones
        case companyEmails
        case companyName
        case state
        case country
        case city
        case postalCode
        case street
    }
}
    
    
    public class User: Codable {
        public var id: Int?
        public var username: String?
        public var firstName: String?
        public var lastName: String?
        public var email: String?

        enum CodingKeys: String, CodingKey {
            case id
            case username
            case firstName
            case lastName
            case email
        }
    }

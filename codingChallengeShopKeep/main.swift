//
//  main.swift
//  codingChallengeShopKeep
//
//  Created by Elizabeth Peraza  on 7/10/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import Foundation

struct PhoneNumber: CustomStringConvertible {
  let countryCode: String
  let areaCode: String
  let body: String
  
  var description: String {
    let formattedPhoneNumber = "\(self.countryCode)\(self.areaCode)\(self.body)"
    return formattedPhoneNumber
  }
  
  public func printAValidNumber(phoneNumber: PhoneNumber){
    print(countryCode + areaCode + body)
  }
  
  static func parse(phoneNumber: String) -> PhoneNumber? {
    var phone = phoneNumber
    var countryCode = ""
    var areaCode = ""
    var phoneBody = ""
    
    if phone.count == 10 || phone.count == 11 {
      
      if phone.count == 10 {
        phone.insert("0", at: phone.startIndex)
      }
      for (index, character) in phone.enumerated() {
        if index == 0 {
          countryCode.append(character)
          
        } else if index < 4 {
          areaCode.append(character)
        } else {
          phoneBody.append(character)
        }
      }
    } else {
      return nil
    }
    let validPhoneNumber = PhoneNumber(countryCode: countryCode, areaCode: areaCode, body: phoneBody)
    return validPhoneNumber
  }
  
}

var phoneNumbers = ["16461234567", "3471234567", "12345", "7649583726394823"]

func isThisAValidPhoneNumber(array: [String]) -> [PhoneNumber]{
  var arrayOfPhoneNumber = [PhoneNumber]()
  for number in array {
    if let validNumber = PhoneNumber.parse(phoneNumber: number) {
      arrayOfPhoneNumber.append(validNumber)
    }
  }
  return arrayOfPhoneNumber
}

let listOfValidPhoneNumbers = isThisAValidPhoneNumber(array: phoneNumbers)
print(listOfValidPhoneNumbers)

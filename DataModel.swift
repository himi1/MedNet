//
//  DataModel.swift
//  MedNet
//
//  Created by Himanshi Bhardwaj on 3/25/17.
//  Copyright © 2017 HPP. All rights reserved.
//

import Foundation

typealias MedicalRequest = (
    status: Int?,
    requestType: String?,
    reason: String?)

typealias Phone = (
    id: Int64?,
    countryCode: Int64?,
    areaCode: Int64?,
    phoneNo: Int64?
)

typealias MedNetUser = (
    id: Int64?,
    firstName: String?,
    lastName: String?,
    phoneNo: Int64?
)

/****examples****/

enum Positions: String {
    case Pitcher = "Pitcher"
    case Catcher = "Catcher"
    case FirstBase = "First Base"
    case SecondBase = "Second Base"
    case ThirdBase = "Third Base"
    case Shortstop = "Shortstop"
    case LeftField = "Left Field"
    case CenterField = "Center Field"
    case RightField = "Right field"
    case DesignatedHitter = "Designated Hitter"
}

typealias Team = (
    teamId: Int64?,
    city: String?,
    nickName: String?,
    abbreviation: String?
)



typealias Player = (
    playerId: Int64?,
    firstName: String?,
    lastName: String?,
    number: Int?,
    teamId: Int64?,
    position: Positions?
)

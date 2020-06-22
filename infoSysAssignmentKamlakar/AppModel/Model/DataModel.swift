//
//  DataModel.swift
//  infoSysAssignmentKamlakar
//
//  Created by ideaqu1 on 22/06/20.
//  Copyright © 2020 kamlakar. All rights reserved.
//

import Foundation

// MARK: - Model
struct DataModel: Codable {
    let title: String
    let rows: [Row]
}

// MARK: - Model Item
struct Row: Codable {
    let title, rowDescription: String?
    let imageHref: String?

    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }
}


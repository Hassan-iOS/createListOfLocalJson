//
//  SettingsModel.swift
//  createListOfLocalJson
//
//  Created by Hassan Mostafa on 03/03/2022.
//

import Foundation

struct SettingsModel: Decodable {
    let id: Int
    let title: String
    let image: String
    let VC: String
    let Storyboard: String
}

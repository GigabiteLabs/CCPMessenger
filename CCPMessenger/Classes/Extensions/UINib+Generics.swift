// UINib+Generics.swift
//
// Created by GigabiteLabs on 7/11/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import Foundation

internal extension UINib {
    class func sourceNib(_ nibName: CCPNibs) -> UINib {
        let bundle = Bundle(for: CCPType.self).podResource(name: "CCPMessenger")
        return UINib.init(nibName: nibName.rawValue, bundle: bundle)
    }
}

// UIView+Generics.swift
//
// Created by GigabiteLabs on 7/12/20
// Swift Version: 5.0
// Copyright © 2020 GigabiteLabs. All rights reserved.
//

import Foundation

//internal extension UIView {
//    /// Returns Nib of the cell
//    class func sourceNib(_ name: CCPNibs) -> UINib {
//        let bundle = Bundle(for: CCPType.self).podResource(name: "CCPMessenger")
//        print("bundle for view: \(bundle)")
//        do {
//            let contents = try FileManager.default.contentsOfDirectory(atPath: bundle.bundlePath)
//            print(contents)
//        } catch {
//            print(error)
//        }
//        let nib = UINib(nibName: name.rawValue, bundle: bundle)
//        return nib
//    }
//}
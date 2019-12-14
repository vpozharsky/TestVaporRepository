//
//  Cupcake.swift
//  App
//
//  Created by Vadim Pozharsky on 15.12.2019.
//

import FluentSQLite
import Foundation
import Vapor

struct Cupcake: Content, SQLiteModel, Migration  {
    var id: Int?
    var name: String
    var discription: String
    var price: Int
}

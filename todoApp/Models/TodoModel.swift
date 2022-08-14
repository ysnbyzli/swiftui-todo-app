//
//  TodoModel.swift
//  todoApp
//
//  Created by Yasin Beyazlı on 13.08.2022.
//

import Foundation

struct TodoModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    var isCompleted: Bool
}

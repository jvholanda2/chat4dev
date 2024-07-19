//
//  Coordinator.swift
//  chat4dev
//
//  Created by João Vitor Alves Holanda on 17/07/24.
//

import Foundation
import SwiftUI

protocol Coordinator: Identifiable, Hashable, AnyObject, ObservableObject {
  var path: NavigationPath { get set }

  func push<Flow: Hashable>(_ flow: Flow)
  func pop(_ k: Int)
  func popToRoot()
}

extension Hashable where Self: Identifiable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(self.id)
  }
}

//
//  EnviornmentalObjectPracticeApp.swift
//  EnviornmentalObjectPractice
//
//  Created by sonam sodani on 2024-04-04.
//

import SwiftUI

@main
struct EnviornmentalObjectPracticeApp: App {
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

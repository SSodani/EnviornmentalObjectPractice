//
//  ContentView.swift
//  EnviornmentalObjectPractice
//
//  Created by sonam sodani on 2024-04-04.
//

import SwiftUI

struct User {
    let fullName: String
    var email: String
    var address: String
    
    var inititals: String? {
        let formatter = PersonNameComponentsFormatter()
        guard let components = formatter.personNameComponents(from: fullName) else {
            return nil }
        formatter.style = .abbreviated
        return formatter.string(from: components)
    }
}

class ViewModel: ObservableObject {
    @Published var user: User
    
    init() {
        self.user = User(fullName: "John Doe", email: "doe.john@gmail.com", address: "15 Main Street")
    }
}

struct ContentView: View {
    
    @EnvironmentObject var viewModel: ViewModel
   // @State var viewModel = ViewModel()
    
    private var user: User {
        return viewModel.user
    }
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    EditProfileView()
                        .environmentObject(viewModel)
                        
                } label: {
                    HStack {
                        Text(user.inititals ?? "")
                            .font(.headline)
                        //.fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 48, height: 48)
                            .background(Color(.systemGray))
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                                .tint(.gray)
                            
                            Text(user.address)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                            
                        }
                        Spacer()
                    }
                }
                
                
                Spacer()
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            
        }
        
    }
}

#Preview {
    ContentView()
}

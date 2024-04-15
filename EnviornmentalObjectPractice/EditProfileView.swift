//
//  EditProfileView.swift
//  EnviornmentalObjectPractice
//
//  Created by sonam sodani on 2024-04-04.
//

import SwiftUI

struct EditProfileView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    
    private var user:User {
        return self.viewModel.user
    }
    var body: some View {
        List {
            Section("Edit Options") {
                Text(user.fullName)
                NavigationLink {
                    EditEmailView()
                    
                }label: {
                    Text(user.email)
                }
                
                NavigationLink {
                    EditAddressView()
                }label: {
                    Text(user.address)
                }
            }
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    EditProfileView()
}


struct EditEmailView: View {
    @State private var email = ""
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
    
    
    private var user:User {
        return self.viewModel.user
    }
    
    var body: some View {
        VStack {
            TextField("Edit your email", text: $email)
                .font(.subheadline)
                .cornerRadius(10)
                .padding(.horizontal, 4)
            
            Divider()
            Spacer()
        }
        .navigationTitle("Edit Email")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    
                    viewModel.user.email = email
                    dismiss()
                }
                .fontWeight(.semibold)
            }
        }
    }
}


#Preview {
    EditEmailView()
}

struct EditAddressView: View {
    @State private var address = ""
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel: ViewModel
    
    
    
    private var user:User {
        return self.viewModel.user
    }
    
    var body: some View {
        VStack {
            TextField("",text: $address)
                .font(.subheadline)
                .cornerRadius(10)
                .padding(.horizontal, 4)
        }
        .navigationTitle("Edit Address")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .toolbar {
            ToolbarItem {
                Button("Done") {
                    viewModel.user.address = address
                    dismiss()
                }
                .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    EditAddressView()
}

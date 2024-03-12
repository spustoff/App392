//
//  Users_2.swift
//  App392
//
//  Created by Вячеслав on 3/11/24.
//

import SwiftUI
import StoreKit

struct Users_2: View {
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            Image("users_2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: .infinity, alignment: .bottom)
            
            VStack {
                
                VStack(alignment: .center, spacing: 5, content: {
                    
                    Text("Rate our app\nin the AppStore")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 28, weight: .semibold))
                    
                    Text("Make the app even better")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 18, weight: .semibold))
                })
                .multilineTextAlignment(.center)
                .padding()
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Users_3()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        .padding()
                })
            }
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Users_2()
}

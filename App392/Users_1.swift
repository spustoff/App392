//
//  Users_1.swift
//  App392
//
//  Created by Вячеслав on 3/11/24.
//

import SwiftUI

struct Users_1: View {
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            Image("users_1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: .infinity, alignment: .bottom)
            
            VStack {
                
                VStack(alignment: .center, spacing: 5, content: {
                    
                    Text("Win your money")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 28, weight: .semibold))
                    
                    Text("Get the chance to get\nextreme bonuses")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 18, weight: .semibold))
                })
                .multilineTextAlignment(.center)
                .padding()
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Users_2()
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
    }
}

#Preview {
    Users_1()
}

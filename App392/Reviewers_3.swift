//
//  Reviewers_3.swift
//  App392
//
//  Created by Вячеслав on 3/11/24.
//

import SwiftUI

struct Reviewers_3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Image("splash_bg")
                .resizable()
                .ignoresSafeArea()
            
            Image("reviewers_3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: .infinity, alignment: .bottom)
            
            VStack {
                
                Text("Be in touch with your games and make advance")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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
    Reviewers_3()
}

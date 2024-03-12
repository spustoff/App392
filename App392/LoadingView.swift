//
//  LoadingView.swift
//  App392
//
//  Created by Вячеслав on 3/11/24.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        ZStack {
            
            Image("splash_bg")
                .resizable()
                .ignoresSafeArea()
            
            Image("logo_big")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 350)
            
            ProgressView()
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding()
        }
    }
}

#Preview {
    LoadingView()
}

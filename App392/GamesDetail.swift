//
//  GamesDetail.swift
//  App392
//
//  Created by Вячеслав on 3/11/24.
//

import SwiftUI

struct GamesDetail: View {
    
    let index: GameModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg_light")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(index.name ?? "")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                .background(Color("bg_dark").ignoresSafeArea())
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(spacing: 20) {
                        
                        Image(index.img ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 150)
                        
                        Text("Information")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 10, content: {
                                
                                Text("Date")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text((index.date ?? Date()).convertDate(format: "MMM d"))
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg_dark")))
                            
                            VStack(alignment: .leading, spacing: 10, content: {
                                
                                Text("Time")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text((index.time ?? Date()).convertDate(format: "HH:mm"))
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg_dark")))
                        }
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 10, content: {
                                
                                Text("Status")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text(index.status ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg_dark")))
                            
                            VStack(alignment: .leading, spacing: 10, content: {
                                
                                Text("Type")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text(index.type ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg_dark")))
                        }
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Name")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 14, weight: .regular))
                            
                            Text(index.name ?? "")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .semibold))
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg_dark")))
                        
                        Text("Statistics")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 30) {
                            
                            HStack {
                                
                                Text("Kills:")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                                
                                Text("\(index.kills)")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            
                            HStack {
                                
                                Text("Assists:")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                                
                                Text("\(index.assists)")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            
                            HStack {
                                
                                Text("Deaths:")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                                
                                Text("\(index.deaths)")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 16, weight: .semibold))
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg_dark")))
                    }
                    .padding()
                }
            }
        }
    }
}

//#Preview {
//    GamesDetail()
//}

//
//  InventoryView.swift
//  App392
//
//  Created by Вячеслав on 3/11/24.
//

import SwiftUI

struct InventoryView: View {
    
    @StateObject var viewModel = InventoryViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg_light")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Inventory")
                    .foregroundColor(Color("primary"))
                    .font(.system(size: 25, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color("bg_dark").ignoresSafeArea())
                
                HStack {
                    
                    ForEach(viewModel.types, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.current_type = index
                            viewModel.fetchInventories()
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .padding(5)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")).opacity(viewModel.current_type == index ? 1 : 0))
                        })
                    }
                }
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg_dark")))
                .padding([.horizontal, .bottom])
                
                if viewModel.inventories.isEmpty {
                    
                    VStack(alignment: .center, spacing: 10, content: {
                        
                        Text("Empty")
                            .foregroundColor(.black)
                            .font(.system(size: 19, weight: .semibold))
                        
                        Text("You don’t have any \(viewModel.current_type) yet")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.inventories, id: \.self) { index in
                            
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 5, content: {
                                        
                                        Text("$\(index.price)")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Text(index.name ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .semibold))
                                    })
                                    
                                    Spacer()
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.3)))
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
            }
            
            VStack {
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.isAdd = true
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                            .frame(width: 55, height: 55)
                            .background(Circle().fill(Color("primary")))
                            .padding()
                    })
                }
            }
        }
        .onAppear {
            
            viewModel.fetchInventories()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            InventoryAdd(viewModel: viewModel)
        })
    }
}

#Preview {
    InventoryView()
}

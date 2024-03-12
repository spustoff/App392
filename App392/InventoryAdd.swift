//
//  InventoryAdd.swift
//  App392
//
//  Created by Вячеслав on 3/11/24.
//

import SwiftUI

struct InventoryAdd: View {
    
    @StateObject var viewModel: InventoryViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg_light")
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.3))
                    .frame(width: 40, height: 5)
                    .padding(.vertical)
                
                ZStack {
                    
                    Text("Add Item")
                        .foregroundColor(.black)
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
                .padding([.horizontal, .bottom])
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        Menu {
                            
                            ForEach(viewModel.types, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.type = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                })
                            }
                            
                        } label: {
                            
                            HStack {
                                
                                Text("Type")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text(viewModel.type.isEmpty ? "Select" : viewModel.type)
                                    .foregroundColor(viewModel.type.isEmpty ? .gray : .black)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                        }
                        .padding(.bottom)
                        
                        HStack {
                            
                            Text("Name")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.name.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.name)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                        
                        HStack {
                            
                            Text("Price")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter price")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.price.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.price)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 2))
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addInventory()
                    viewModel.fetchInventories()
                    
                    router.wrappedValue.dismiss()
                    
                    viewModel.type = ""
                    viewModel.name = ""
                    viewModel.price = ""
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.type.isEmpty || viewModel.name.isEmpty || viewModel.price.isEmpty ? 0.5 : 1)
                .disabled(viewModel.type.isEmpty || viewModel.name.isEmpty || viewModel.price.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    InventoryAdd(viewModel: InventoryViewModel())
}

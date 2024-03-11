//
//  IntroView.swift
//  APIBackedMobileApp
//
//  Created by Donovan Felton on 2/19/24.
//


import SwiftUI

struct IntroView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    
    var body: some View {
        if isActive{
            QuoteView()
        }
        else{
            ZStack{
                Color(.black).edgesIgnoringSafeArea(.all)
                VStack{
                    VStack{
                        
                        Image("DeezerImage")
                            .font(.system(size: 80))
                            .foregroundColor(.black)
                            .padding()
                    
                        
                    }
                    
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration:1.5)){
                            self.size = 1.5
                            self.opacity = 1.0
                            
                        }
                    }
                    
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.7){
                    withAnimation{
                        self.isActive = true
                    }
                }

                
            }
        }
        
    }
}

#Preview {
    IntroView()
}

        
    

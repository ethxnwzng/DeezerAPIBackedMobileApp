//
//  IntroView2.swift
//  APIBackedMobileApp
//
//  Created by Donovan Felton on 2/20/24.
//

import SwiftUI


struct QuoteView: View {
    @State private var isActive2 = false
    let lightPurple = Color(red: 0.7, green: 0.5, blue: 0.8)
    var body: some View {
        let array = ["Where words fail, music speaks. - Hans Christian Andersen",
                     "One good thing about music, when it hits you, you feel no pain. - Bob Marley",
                     "Music is the universal language of mankind.” ― Henry Wadsworth Longfellow",
                     "If you believe in yourself anything is possible - Miley Cyrus",
                     "Follow your dreams. Just make sure to have fun too. - Chris Brown"]
        let randomName = array.randomElement()!
        if isActive2 {
            ContentView()
            //ENTER UI HERE
        } else {
            ZStack {
                Color(.purple).edgesIgnoringSafeArea(.all)
                    .overlay(
                        RectangleBorder(top: 20)
                            .stroke(Color.black, lineWidth: 2)
                            .fill(lightPurple)
                            .overlay(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.black, Color.blue,]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                                .mask(
                                    Text(randomName)
                                        .font(Font.custom("Baskerville-Bold", size: 22))
                                )
                                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                        )
                    )
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    withAnimation {
                        self.isActive2 = true
                    }
                }
            }
        }
    }
}
struct RectangleBorder: Shape {
    let top: CGFloat
    func path(in rect: CGRect) -> Path {
        var border = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let halfW = rect.width / 2.1
        let halfH = rect.height / 9
        let inset = min(halfW, halfH,top)
        border.addRoundedRect(in: CGRect(x: center.x - halfW, y: center.y - halfH, width: 2 * halfW, height: 2 * halfH), cornerSize: CGSize(width: inset, height: inset))
        return border
    }
}


#Preview {
    QuoteView()
    
}

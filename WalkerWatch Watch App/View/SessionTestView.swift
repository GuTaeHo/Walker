//
//  SessionTestView.swift
//  Walker
//
//  Created by 구태호 on 4/30/25.
//

import SwiftUI

struct SessionTestView: View {
    @State private var count = 0
    
    var body: some View {
        ScrollView {
            Text("\(count)")
                .font(.system(size: 40))
            
            VStack {
                HStack(spacing: 16) {
                    Button(action: {
                        if count > 0 {
                            count -= 1
                        }
                    }) {
                        Text("-")
                    }
                    
                    Button(action: {
                        count += 1
                    }) {
                        Text("+")
                    }
                }
                
                Spacer()
                    .frame(height: 16)
                
                Button(action: {
                    WatchSessionManager.shared.sendDataToPhone(data: ["SendCountToPhone" : "\(count)"])
                }) {
                    Text("현재 카운트 전송")
                }
            }
        }
    }
}

#Preview {
    SessionTestView()
}

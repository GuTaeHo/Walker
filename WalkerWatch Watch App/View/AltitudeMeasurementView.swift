//
//  AltitudeMeasurementView.swift
//  WalkerWatch Watch App
//
//  Created by 구태호 on 4/29/25.
//

import SwiftUI
import WatchConnectivity

    
struct AltitudeMeasurementView: View {
    /// (시작 고도 기준) 등반 고도
    @State private var differenceAltitude: Double = 0.0
    /// (해수면 기준) 현재 고도
    @State private var absoluteAltitude: Double = 0.0
    @State var count = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Label(title: {
                    // 등반 고도
                    Text("\(count)m")
                        .font(.system(size: 40))
                }, icon: {
                    Image(systemName: "figure.hiking")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 36)
                })
                // 현재 고도
                Label(title: {
                    Text("\(count)m")
                        .font(.system(size: 40))
                }, icon: {
                    Image(systemName: "location.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                })
                
                Spacer()
                    .frame(height: 24)
                
                HStack(spacing: 8) {
                    Button(action: {
                        if count > 0 {
                            count -= 1
                        }
                    }) {
                        Text("-")
                            .font(.system(size: 30))
                    }
                    Button(action: {
                        count += 1
                    }) {
                        Text("+")
                            .font(.system(size: 30))
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AltitudeMeasurementView()
}

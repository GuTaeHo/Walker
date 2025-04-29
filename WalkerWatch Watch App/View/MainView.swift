//
//  MainView.swift
//  Walker
//
//  Created by 구태호 on 4/30/25.
//

import SwiftUI


struct MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AltitudeMeasurementView(), label: {
                    Text("고도 측정")
                })
                NavigationLink(destination: SessionTestView(), label: {
                    Text("전송 테스트")
                })
            }
        }
    }
}

#Preview {
    MainView()
}

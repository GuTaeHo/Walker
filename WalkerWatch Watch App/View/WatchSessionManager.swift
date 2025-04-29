//
//  WatchSessionManager.swift
//  Walker
//
//  Created by 구태호 on 4/30/25.
//

import WatchConnectivity


class WatchSessionManager: NSObject, WCSessionDelegate {
    static let shared = WatchSessionManager()
    
    private override init() {
        super.init()
        activateSession()
    }
    
    private func activateSession() {
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }
    
    func sendDataToPhone(data: [String: Any]) {
        if WCSession.default.isReachable {
            WCSession.default.sendMessage(data, replyHandler: nil, errorHandler: { error in
                print("Error sending to phone: \(error)")
            })
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        print("activationDidCompleteWith: \(activationState)")
    }
    
    // iPhone 으로부터 데이터 수신
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("Received message from iPhone: \(message)")
    }
}

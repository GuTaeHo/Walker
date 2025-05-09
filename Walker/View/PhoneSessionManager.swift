//
//  PhoneSessionManager.swift
//  Walker
//
//  Created by 구태호 on 4/30/25.
//

import WatchConnectivity

class PhoneSessionManager: NSObject, WCSessionDelegate {
    static let shared = PhoneSessionManager()
    
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
    
    func sendDataToWatch(data: [String: Any]) {
        if WCSession.default.isReachable {
            WCSession.default.sendMessage(data, replyHandler: nil, errorHandler: { error in
                print("PhoneSessionManager: Error sending to watch: \(error)")
            })
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        print("PhoneSessionManager: activationDidCompleteWith: \(activationState)")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("PhoneSessionManager: sessionDidBecomeInactive: \(session)")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("PhoneSessionManager: sessionDidDeactivate: \(session)")
    }
    
    // Watch로부터 데이터 수신
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("PhoneSessionManager: didReceiveMessage from watch: \(message)")
    }
}

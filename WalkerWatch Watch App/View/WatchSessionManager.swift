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
            WCSession.default.sendMessage(data, replyHandler: { response in
                print("WatchSessionManager: replyHandler: \(response)")
            }, errorHandler: { error in
                print("WatchSessionManager: Error sending to phone: \(error)")
            })
        } else {
            print("isReachable false: iPhone 앱이 활성화되지 않았습니다.")
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        switch activationState {
        case .notActivated:
            print("WatchSessionManager: activationDidCompleteWith: notActivated")
        case .inactive:
            print("WatchSessionManager: activationDidCompleteWith: inactive")
        case .activated:
            print("WatchSessionManager: activationDidCompleteWith: activated")
        @unknown default:
            print("WatchSessionManager: activationDidCompleteWith: future feature")
        }
    }
    
    // iPhone 으로부터 데이터 수신
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("WatchSessionManager: Received message from iPhone: \(message)")
    }
}

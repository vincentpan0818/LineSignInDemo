//
//  LineSignInManager.swift
//  LineSignInDemo
//
//  Created by Vincent Pan on 2022/2/24.
//

import Foundation
import LineSDK
import UIKit

class LineSignInManager {
    static let shared = LineSignInManager()
    //ChannelID
    private let aud = "1656919329"
    
    func delegateInit(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        LoginManager.shared.setup(channelID: aud, universalLinkURL: nil)
    }
    
    func openUrl(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return LoginManager.shared.application(app, open: url)
    }

    func sceneInit(openURLContexts URLContexts: Set<UIOpenURLContext>) {
        _ = LoginManager.shared.application(.shared, open: URLContexts.first?.url)
    }
    
    func signIn(presentViewController: UIViewController) {
        LoginManager.shared.login(permissions: [.profile, .openID, .email], in: presentViewController) { result in
            switch result {
            case .success(let loginResult):
                guard let token = loginResult.accessToken.IDTokenRaw else { return }
//                guard let profile = loginResult.userProfile else { return }
                
                print("測試aud: \(String(describing: self.aud))")
//                print("測試displayName: \(String(describing: profile.displayName))")
//                print("測試pictureURL: \(String(describing: profile.pictureURL))")
                print("測試Token: \(String(describing: token))")
                
            case .failure(let error):
                print("測試",error)
            }
        }
    }
    
    

    func signOut() {
        LoginManager.shared.logout { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

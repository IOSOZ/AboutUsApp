//
//  UserData.swift
//  AboutUsApp
//
//  Created by Олег Зуев on 07.06.2025.
//

import Foundation

class SiteInfo {
    var siteAdress: String
    var userName: String
    var password: String
    
    var siteName: String? {
        extractSiteName(from: siteAdress)
    }
    
    init(siteAdress: String, userName: String, password: String) {
        self.siteAdress = siteAdress
        self.userName = userName
        self.password = password
    }
}

// MARK: - extractSiteName
extension SiteInfo {
    private func extractSiteName(from url: String) -> String? {
        let pattern = "(?:https?://)?(?:www\\.)?([a-zA-Z0-9\\-]+)"
        if let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) {
            let range = NSRange(url.startIndex..., in: url)
            if let match = regex.firstMatch(in: url, options: [], range: range),
               let siteRange = Range(match.range(at: 1), in: url) {
                return String(url[siteRange])
            }
        }
        return nil
    }

}

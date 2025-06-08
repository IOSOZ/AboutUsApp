//
//  DataStore.swift
//  AboutUsApp
//
//  Created by Олег Зуев on 07.06.2025.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    
    private var sites: [SiteInfo] = [
        SiteInfo(siteAdress: "www.swiftbook.org", userName: "IOSZver", password: "123qwe"),
        SiteInfo(siteAdress: "www.google.com", userName: "User2", password: "pass456"),
        SiteInfo(siteAdress: "www.apple.com", userName: "User3", password: "hello789")
    ]
    
    func getAllSites() -> [SiteInfo] {
        return sites
    }
    
    func addSite(_ site: SiteInfo) {
        sites.append(site)
    }
    
    func deleteSiteWith(index: Int) {
        guard index >= 0 && index < sites.count else { return }
        sites.remove(at: index)
    }
}



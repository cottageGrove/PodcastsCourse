//
//  APIService.swift
//  PodcastsCourse
//
//  Created by Rafae on 2018-05-06.
//  Copyright © 2018 Rafae. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    
    let baseiTunesSearchURL = "https://itunes.apple.com/search"
    
    //singleton
    static let shared = APIService()
    
    func fetchPodcasts(searchText: String, completionHandler: @escaping ([Podcast]) -> ()) {
//        print(searchText)
        
        print("Searching for podcasts")
        
        let parameters = ["term" : searchText, "media" : "podcast"]
        
        
        Alamofire.request(baseiTunesSearchURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let err = dataResponse.error {
                print("Failed to contact yahoo", err)
                return
            }
            
            guard let data = dataResponse.data else {return}
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)

                print(searchResult.resultCount)
                completionHandler(searchResult.results)
//              self.podcasts = searchResult.results
//              self.tableView.reloadData()
            } catch let decodeErr {
                print("Failed to decode", decodeErr)
            }
        }
    }
    
    struct SearchResults: Decodable {
        let resultCount : Int
        let results: [Podcast]
    }
}

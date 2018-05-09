//
//  Podcast.swift
//  PodcastsCourse
//
//  Created by Rafae on 2018-05-04.
//  Copyright © 2018 Rafae. All rights reserved.
//

import Foundation

struct Podcast : Decodable{
    var trackName: String?
    let artistName: String?
    var artworkUrl600: String?
    var trackCount: Int?
    var feedUrl: String?
}

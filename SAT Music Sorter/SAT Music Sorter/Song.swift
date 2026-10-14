//
//  Song.swift
//  SAT Music Sorter
//
//  Created by Sienna Pearson on 3/8/2026.
//

import Foundation

class Song: Codable {
    
    var songName: String
    var songLength: Float
    var artist: String
    var year: Int
    
    init(
        songName: String,
        songLength: Float,
        artist: String,
        year: Int
    )
    {
        self.songName = songName
        self.songLength = songLength
        self.artist = artist
        self.year = year
    }
    
    /**
     Method: details
     just shows the details for the song
     */
    
    func details() -> String {
        "\(String(format: "%0.2f", songLength)) - \(songName) by \(artist) - \(year)"
    }
 
    
}

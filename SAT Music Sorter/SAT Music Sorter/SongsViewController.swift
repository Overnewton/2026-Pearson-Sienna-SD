//
//  ViewController.swift
//  SAT Music Sorter
//
//  Created by Sienna Pearson on 22/6/2026.
//

import UIKit

class SongsViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    /**
     To do:
     - Create new song
     - Add to playlists array
     - Display in table view
     - Calculate average song length and full length of playlist
     - Internal documentation
     - test as you go
     */
    
    //INPUTS
    @IBOutlet weak var tblSongs: UITableView!
    @IBOutlet weak var txtSongName: UITextField!
    @IBOutlet weak var txtSongLength: UITextField!
    @IBOutlet weak var txtSongArtist: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    
    //OUTPUTS
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblPlaylistLength: UILabel!
    
    
    
    //GLOBAL VARIABLES
    var playlist: [Song] = []
    
    
    
    
    
    
    //BUTTONS
    @IBAction func btnAddSongs(_ sender: Any) {
        
        //Song length existence check
        if txtSongLength.text != "" {
            
            //year range check
            if Int(txtYear.text!)! > 1600 && Int(txtYear.text!)! < 2026 {
                
                //connects text fields to class properties.
                let newSong : Song = Song(
                    songName: txtSongName.text!,
                    songLength: Float(txtSongLength.text!)!,
                    artist: txtSongArtist.text!,
                    year: Int(txtYear.text!)!)
                
                //add song to playlist
                playlist.append(newSong)
                
                //reloads playlist data
                tblSongs.reloadData()
                
                //confirmation message
                lblMessage.text = "Song added to playlist"
                
                var total: Float = 0
                
                for song in playlist {
                    total += song.songLength
                }
                
                //message displaying the total time
                lblPlaylistLength.text = String("Playlist length: \(String(format: "%0.2f", total)) minutes")
                
                //it's shown in decimal form rather than actual time
                
                
                
                //Test creating song and adding to playlist
                print("new song test :3 \(newSong.artist) \(newSong.songLength) \(newSong.songName) \(newSong.year)")
                
                print("new song in array test :> \(playlist[0].artist)")
            }
            else {
                lblMessage.text = "Invalid Year"
            }
        }
        else {
            lblMessage.text = "Please enter a length"
        }
        
    }
    
    
    //function to calculate the total playlist length
    func calculate() {
        var total: Float = 0
        
        for song in playlist {
            total += song.songLength
        }
        
        //message displaying the total time
        lblPlaylistLength.text = "Playlist length: \(total) minutes"
        
        //it's shown in decimal form rather than actual time
    }
    
    
    //Tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //ensure the cell identifier has been labelled "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //display main details from mainDetails() method
        cell.textLabel?.text = String(
            playlist[indexPath.row].details()
        )
        
        return cell
    }
    
    override func viewDidLoad() {
        
        tblSongs.delegate = self
        tblSongs.dataSource = self
        
        super.viewDidLoad()
        
       
        // Do any additional setup after loading the view.
    }


}


import Foundation
import SwiftyJSON

class Movie {
    public var id: Int = 0
    public var movieType: String = ""
    public var name: String = ""
    public var keyWords: String = ""
    public var description: String = ""
    public var year : Int = 0
    public var trend: Bool = false
    public var timing: Int = 0
    public var director: String = ""
    public var producer: String = ""
    public var poster_link: String = ""
    public var video_link: String = ""
    public var watchCount: Int = 0
    public var seasonCount: Int = 0
    public var seriesCount: Int = 0
    public var genres: String = ""
    public var categories: String = ""
    
    
    init(json: JSON) {
        if let temp = json["id"].int {
            self.id = temp
        }
        if let temp = json["movieType"].string {
            self.movieType = temp
        }
        if let temp = json["name"].string {
            self.name = temp
        }
        if let temp = json["keyWords"].string {
            self.keyWords = temp
        }
        if let temp = json["description"].string {
            self.description = temp
        }
        if let temp = json["year"].int {
            self.year = temp
        }
        if let temp = json["trend"].bool {
            self.trend = temp
        }
        if let temp = json["timing"].int {
            self.timing = temp
        }
        if let temp = json["director"].string {
            self.director = temp
        }
        if let temp = json["producer"].string {
            self.producer = temp
        }
        if let temp = json["poster"]["link"].string {
            self.poster_link = temp
        }
        if let temp = json["video_link"].string {
            self.video_link = temp
        }
        if let temp = json["watchCount"].int {
            self.watchCount = temp
        }
        if let temp = json["seasonCount"].int {
            self.seasonCount = temp
        }
        if let temp = json["seriesCount"].int {
            self.seriesCount = temp
        }
        if let temp = json["genres"][0]["name"].string {
            self.genres = temp
        }
        if let temp = json["categories"][0]["name"].string {
            self.categories = temp
        }
    }
}

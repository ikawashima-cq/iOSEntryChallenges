struct Events: Codable {
    var resultsStart, resultsReturned, resultsAvailable: Int
    var events: [Event]

    enum CodingKeys: String, CodingKey {
        case resultsStart = "results_start"
        case resultsReturned = "results_returned"
        case resultsAvailable = "results_available"
        case events
    }
}

// MARK: - Event
struct Event: Codable {
    var eventID: Int?
    var title: String
    var eventDescription: String
    var eventCatch: String
    var eventURL: String
    var startedAt: String?
    var endedAt: String?
    var limit: Int?
    var hashTag: String
    var eventType: EventType
    var waiting: Int
    var accepted: Int
    var updatedAt: String?
    var ownerID: Int
    var ownerNickname: String
    var ownerDisplayName: String
    var place: String?
    var address: String?
    var lat: String?
    var lon: String?
    var series: Series?

    enum CodingKeys: String, CodingKey {
        case eventID = "event_id"
        case title
        case eventCatch = "catch"
        case eventDescription = "description"
        case eventURL = "event_url"
        case startedAt = "started_at"
        case endedAt = "ended_at"
        case limit
        case hashTag = "hash_tag"
        case eventType = "event_type"
        case accepted
        case waiting
        case updatedAt = "updated_at"
        case ownerID = "owner_id"
        case ownerNickname = "owner_nickname"
        case ownerDisplayName = "owner_display_name"
        case place
        case address
        case lat
        case lon
        case series
    }
}

enum EventType: String, Codable {
     case participation  // connpassで参加受付あり
     case advertisement  // 告知のみ
}

// MARK: - Series
struct Series: Codable {
    var id: Int
    var title: String
    var url: String
}

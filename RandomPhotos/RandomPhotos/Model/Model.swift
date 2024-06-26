import Foundation

struct APIResponse: Codable {
    let total: Int
    let total_pages: Int
    let results: [Result]
}

struct Result: Codable {
    let id: String
    let urls: URLS
}

struct URLS: Codable {
    let full: String
}
struct Photo {
    let imageName: String
    let authorName: String
    let creationDate: Date
    let location: String
    let downloadCount: Int
}


/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ImageDataResponse : Codable {
	let id : String?
	let title : String?
	let language : String?
	let thumbnail : Thumbnail?
	let mediaType : Int?
	let coverageURL : String?
	let publishedAt : String?
	let publishedBy : String?
	let backupDetails : BackupDetails?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case title = "title"
		case language = "language"
		case thumbnail = "thumbnail"
		case mediaType = "mediaType"
		case coverageURL = "coverageURL"
		case publishedAt = "publishedAt"
		case publishedBy = "publishedBy"
		case backupDetails = "backupDetails"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		language = try values.decodeIfPresent(String.self, forKey: .language)
		thumbnail = try values.decodeIfPresent(Thumbnail.self, forKey: .thumbnail)
		mediaType = try values.decodeIfPresent(Int.self, forKey: .mediaType)
		coverageURL = try values.decodeIfPresent(String.self, forKey: .coverageURL)
		publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
		publishedBy = try values.decodeIfPresent(String.self, forKey: .publishedBy)
		backupDetails = try values.decodeIfPresent(BackupDetails.self, forKey: .backupDetails)
	}

}

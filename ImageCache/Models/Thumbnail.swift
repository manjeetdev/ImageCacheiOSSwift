/* 
Copyright (c) 2024 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Thumbnail : Codable {
	let id : String?
	let version : Int?
	let domain : String?
	let basePath : String?
	let key : String?
	let qualities : [Int]?
	let aspectRatio : Double?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case version = "version"
		case domain = "domain"
		case basePath = "basePath"
		case key = "key"
		case qualities = "qualities"
		case aspectRatio = "aspectRatio"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		version = try values.decodeIfPresent(Int.self, forKey: .version)
		domain = try values.decodeIfPresent(String.self, forKey: .domain)
		basePath = try values.decodeIfPresent(String.self, forKey: .basePath)
		key = try values.decodeIfPresent(String.self, forKey: .key)
		qualities = try values.decodeIfPresent([Int].self, forKey: .qualities)
		aspectRatio = try values.decodeIfPresent(Double.self, forKey: .aspectRatio)
	}

}
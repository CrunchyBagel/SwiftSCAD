import Foundation

public extension Array {
	func paired() -> [(Element, Element)] {
		guard count >= 2 else { return [] }
		return (0..<count-1).map { (self[$0], self[$0+1]) }
	}
}

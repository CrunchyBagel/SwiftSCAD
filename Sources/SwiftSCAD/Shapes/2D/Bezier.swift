import Foundation

struct BezierCurve {
	let points: [Vector2D]

	init(points: [Vector2D]) {
		precondition(points.count >= 2)
		self.points = points
	}

	func point(at fraction: Double) -> Vector2D {
		var workingPoints = self.points
		while workingPoints.count > 1 {
			workingPoints = workingPoints.paired().map { p1, p2 in
				p1.point(alongLineTo: p2, at: fraction)
			}
		}
		return workingPoints[0]
	}

	func points(in range: Range<Double>, maxSegmentLength: Double) -> [Vector2D] {
		let startPoint = point(at: range.lowerBound)
		let endPoint = point(at: range.upperBound)
		let midFraction = (range.lowerBound + range.upperBound) / 2
		let midPoint = point(at: midFraction)

		let distance1 = startPoint.distance(to: midPoint)
		let distance2 = midPoint.distance(to: endPoint)
		guard distance1 > maxSegmentLength && distance2 > maxSegmentLength else {
			return []
		}

		return points(in: range.lowerBound..<midFraction, maxSegmentLength: maxSegmentLength)
			+ [midPoint]
			+ points(in: midFraction..<range.upperBound, maxSegmentLength: maxSegmentLength)
	}

	func points(maxSegmentLength: Double = 0.1) -> [Vector2D] {
		return [point(at: 0)] + points(in: 0..<1, maxSegmentLength: maxSegmentLength) + [point(at: 1)]
	}

	func points(segmentCount: Int) -> [Vector2D] {
		let segmentLength = 1.0 / Double(segmentCount)
		return (0...segmentCount).map { f in
			point(at: Double(f) * segmentLength)
		}
	}
}

public struct BezierPath: Geometry2D {
	let startPoint: Vector2D
	let curves: [BezierCurve]

	var endPoint: Vector2D {
		curves.last?.points.last ?? startPoint
	}

	private init(startPoint: Vector2D, curves: [BezierCurve]) {
		self.startPoint = startPoint
		self.curves = curves
	}

	public init(startPoint: Vector2D) {
		self.init(startPoint: startPoint, curves: [])
	}

	func adding(curve: BezierCurve) -> BezierPath {
		let newCurves = curves + [curve]
		return BezierPath(startPoint: startPoint, curves: newCurves)
	}

	public func line(to point: Vector2D) -> BezierPath {
		adding(curve: BezierCurve(points: [endPoint, point]))
	}

	public func quadratic(controlPoint: Vector2D, end: Vector2D) -> BezierPath {
		adding(curve: BezierCurve(points: [endPoint, controlPoint, end]))
	}

	public func cubic(controlPoint1: Vector2D, controlPoint2: Vector2D, end: Vector2D) -> BezierPath {
		adding(curve: BezierCurve(points: [endPoint, controlPoint1, controlPoint2, end]))
	}

	func points(maxSegmentLength: Double = 0.1) -> [Vector2D] {
		return [startPoint] + curves.map { curve in
			Array(curve.points(maxSegmentLength: maxSegmentLength)[1...])
		}.joined()
	}

	func points(segmentCount: Int) -> [Vector2D] {
		let segmentPerCurve = Int(ceil(Double(segmentCount) / Double(curves.count)))

		return [startPoint] + curves.map { curve in
			Array(curve.points(segmentCount: segmentPerCurve)[1...])
		}.joined()
	}

	public func points(facets: Environment.Facets) -> [Vector2D] {
		switch facets {
		case .fixed (let count):
			return points(segmentCount: count)
		case .dynamic(_, let minSize):
			return points(maxSegmentLength: minSize)
		}
	}

	public func scadString(environment: Environment) -> String {
		return Polygon(points(facets: environment.facets))
			.scadString(environment: environment)
	}
}

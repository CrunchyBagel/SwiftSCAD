import Foundation

/// Represents a two-dimensional shape defined by a series of connected points.
/// It supports initialization from an array of `Vector2D` points or a `BezierPath`.
///
/// - Example:
///   - Creating a Polygon from points:
///     ```
///     let polygonFromPoints = Polygon([Vector2D(x: 0, y: 0), Vector2D(x: 10, y: 0), Vector2D(x: 5, y: 10)])
///     ```
///   - Creating a Polygon from a Bezier path:
///     ```
///     let bezierPath = BezierPath(startPoint: .zero)
///                      .addingCubicCurve(controlPoint1: [10, 65], controlPoint2: [55, -20], end: [60, 40])
///     let polygonFromBezierPath = Polygon(bezierPath)
///     ```

public struct Polygon: CoreGeometry2D {
    private let pointsProvider: any PolygonPointsProvider

    internal init(provider: any PolygonPointsProvider) {
        pointsProvider = provider
    }

    /// Creates a new `Polygon` instance with the specified points.
    ///
    /// - Parameter points: An array of `Vector2D` that defines the vertices of the polygon.
    public init(_ points: [Vector2D]) {
        self.init(provider: points)
    }

    /// Creates a new `Polygon` instance with the specified 2D Bezier path.
    ///
    /// - Parameter bezierPath: A `BezierPath2D` that defines the shape of the polygon.
    public init(_ bezierPath: BezierPath2D) {
        self.init(provider: bezierPath)
    }

    /// Returns the points defining the polygon within a given environment.
    /// - Parameter environment: The environment context.
    /// - Returns: An array of `Vector2D` representing the polygon's vertices.
    public func points(in environment: Environment) -> [Vector2D] {
        pointsProvider.points(in: environment)
    }

    func call(in environment: Environment) -> SCADCall {
        return SCADCall(
            name: "polygon",
            params: ["points": points(in: environment)]
        )
    }
}

public extension Polygon {
    /// Applies a transformation function to each vertex of the polygon.
    /// - Parameter transformation: A closure that takes a `Vector2D` and returns a transformed `Vector2D`.
    /// - Returns: A new `Polygon` instance with transformed vertices.
    func applying(_ transformation: @escaping (Vector2D) -> Vector2D) -> Polygon {
        Polygon(provider: TransformedPolygonPoints(innerProvider: pointsProvider, transformation: transformation))
    }

    /// Transforms the polygon using an affine transformation.
    /// - Parameter transform: An `AffineTransform2D` to apply to the polygon.
    /// - Returns: A new `Polygon` instance with transformed vertices.
    func transformed(_ transform: AffineTransform2D) -> Polygon {
        applying { transform.apply(to: $0) }
    }

    /// Calculates the bounding rectangle of the polygon within a given environment.
    /// - Parameter environment: The environment context.
    /// - Returns: A `BoundingRect` representing the smallest rectangle enclosing the polygon.
    func boundingRect(in environment: Environment) -> BoundingRect {
        .init(points(in: environment))
    }
}
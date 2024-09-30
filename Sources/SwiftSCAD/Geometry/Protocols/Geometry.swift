import Foundation

/// Two-dimensional geometry
public protocol Geometry2D {
    typealias Bounds = Boundary<Vector2D>

    func invocation(in environment: Environment) -> Invocation
    func boundary(in environment: Environment) -> Bounds
    func anchors(in environment: Environment) -> [Anchor: AffineTransform3D]
    func elements(in environment: Environment) -> [ObjectIdentifier: any ResultElement]
}

/// Three-dimensional geometry
public protocol Geometry3D {
    typealias Bounds = Boundary<Vector3D>

    func invocation(in environment: Environment) -> Invocation
    func boundary(in environment: Environment) -> Bounds
    func anchors(in environment: Environment) -> [Anchor: AffineTransform3D]
    func elements(in environment: Environment) -> [ObjectIdentifier: any ResultElement]
}

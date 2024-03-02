import Foundation

struct Intersection3D: CoreGeometry3D {
    let children: [any Geometry3D]

    func call(in environment: Environment) -> SCADCall {
        SCADCall(name: "intersection", body: GeometrySequence(children: children))
    }
}

public extension Geometry3D {
    /// Intersect this geometry with other geometry
    ///
    /// ## Example
    /// ```swift
    /// Box([10, 10, 5])
    ///     .intersection {
    ///        Cylinder(diameter: 4, height: 3)
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///   - with: The other geometry to intersect with this
    /// - Returns: The intersection (overlap) of this geometry and the input

    func intersection(@UnionBuilder3D with other: () -> any Geometry3D) -> any Geometry3D {
        Intersection3D(children: [self, other()])
    }

    func intersection(_ other: any Geometry3D...) -> any Geometry3D {
        Intersection3D(children: [self] + other)
    }
}


struct Intersection2D: CoreGeometry2D {
    let children: [any Geometry2D]

    func call(in environment: Environment) -> SCADCall {
        SCADCall(name: "intersection", body: GeometrySequence(children: children))
    }
}

public extension Geometry2D {
    /// Intersect this geometry with other geometry
    ///
    /// ## Example
    /// ```swift
    /// Rectangle([10, 10])
    ///     .intersection {
    ///        Circle(diameter: 4)
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///   - with: The other geometry to intersect with this
    /// - Returns: The intersection (overlap) of this geometry and the input

    func intersection(@UnionBuilder2D with other: () -> any Geometry2D) -> any Geometry2D {
        Intersection2D(children: [self, other()])
    }

    func intersection(_ other: any Geometry2D...) -> any Geometry2D {
        Intersection2D(children: [self] + other)
    }
}

public extension Sequence {
    func mapIntersection(@UnionBuilder3D _ transform: (Element) throws -> any Geometry3D) rethrows -> any Geometry3D {
        Intersection3D(children: try map(transform))
    }
    
    func mapIntersection(@UnionBuilder2D _ transform: (Element) throws -> any Geometry2D) rethrows -> any Geometry2D {
        Intersection2D(children: try map(transform))
    }
}

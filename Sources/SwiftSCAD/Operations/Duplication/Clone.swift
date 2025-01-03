import Foundation

public extension Geometry2D {
    /// Creates a composite geometry that includes this geometry and a transformed clone of it.
    ///
    /// This method applies a specified transformation to a clone of the current geometry and combines the original with the transformed clone. It is useful for combining multiple states of a geometry within a single model.
    ///
    /// - Parameter transform: A closure that takes the original geometry and returns a transformed version of it. The transformation can include translations, rotations, scaling, or any custom modifications.
    /// - Returns: A new geometry that combines the original and the transformed clone.
    ///
    /// Example usage:
    /// ```
    /// let originalShape = Rectangle([10, 5])
    /// let compositeShape = originalShape.cloned { $0.rotated(45°) }
    /// ```
    /// In this example, `compositeShape` includes both the original rectangle and a version that has been translated 15 units along the x-axis.
    func cloned(@GeometryBuilder2D _ transform: (any Geometry2D) -> any Geometry2D) -> any Geometry2D {
        adding(transform(self))
    }

    func clonedAt(x: Double = 0, y: Double = 0) -> any Geometry2D {
        cloned { $0.translated(x: x, y: y) }
    }
}

public extension Geometry3D {
    /// Creates a composite geometry that includes this geometry and a transformed clone of it.
    ///
    /// This method applies a specified transformation to a clone of the current geometry and combines the original with the transformed clone. It is useful for combining multiple states of a geometry within a single model.
    ///
    /// - Parameter transform: A closure that takes the original geometry and returns a transformed version of it. The transformation can include translations, rotations, scaling, or any custom modifications.
    /// - Returns: A new geometry that combines the original and the transformed clone.
    ///
    /// Example usage:
    /// ```
    /// let cube = Box([2, 2, 2])
    /// let compositeGeometry = cube.cloned { $0.rotated(x: 45°) }
    /// ```
    /// This example produces `compositeGeometry`, which includes the original cube and a translated copy, demonstrating the transformation visually.
    func cloned(@GeometryBuilder3D _ transform: (any Geometry3D) -> any Geometry3D) -> any Geometry3D {
        adding(transform(self))
    }

    func clonedAt(x: Double = 0, y: Double = 0, z: Double = 0) -> any Geometry3D {
        cloned { $0.translated(x: x, y: y, z: z) }
    }
}

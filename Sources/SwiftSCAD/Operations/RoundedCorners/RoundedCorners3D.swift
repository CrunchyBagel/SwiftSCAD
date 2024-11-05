import Foundation

internal extension Geometry3D {
    func roundingBoxCorners(radius: Double, mode: RoundedBoxMask3D.Mode) -> any Geometry3D {
        let epsilon = 0.001
        return measuringBounds { child, box in
            child.intersecting {
                let box = box.requireNonNil()
                RoundedBoxMask3D(size: box.size + 2 * epsilon, cornerRadius: radius, mode: mode)
                    .translated(box.center)
            }
        }
    }
}

public extension Geometry3D {
    /// Rounds the corners of the geometry using its bounding box dimensions along a specified axis.
    ///
    /// This method assumes that the geometry is a box or something similar and rounds its corners as if it were a box.
    ///
    /// - Parameters:
    ///   - corners: The corners of the geometry to round. Defaults to `.all`.
    ///   - axis: The axis along which to round the corners.
    ///     - For the Z axis, the corners are as seen from positive Z, looking down at the origin with positive X pointing right and positive Y pointing up.
    ///     - For the X axis, the corners are as seen from the origin, with the positive Y axis pointing left and Z pointing up.
    ///     - For the Y axis, the corners are as seen from the origin, with the positive X axis pointing right and Z pointing up.
    ///   - radius: The radius of the rounding.
    ///   - style: The style of the rounded corners. Defaults to `.circular`.
    ///
    /// - Returns: A new `Geometry3D` object with rounded corners applied to the geometry.
    ///
    /// This method uses the bounding box of the geometry to determine the appropriate size for rounding.
    /// It is intended for geometries that are box-like or similar enough for this approximation to be effective.

    func roundingBoxCorners(_ corners: RectangleCorners = .all, axis: Axis3D, radius: Double, style: RoundedCornerStyle = .circular) -> any Geometry3D {
        roundingBoxCorners(axis: axis, .init(radius, corners: corners), style: style)
    }

    /// Rounds all eight corners of the geometry using its bounding box dimensions.
    ///
    /// This method assumes that the geometry is a box or something similar and rounds all its corners as if it were a box.
    ///
    /// - Parameter radius: The radius of the rounding applied to each corner.
    ///
    /// - Returns: A new `Geometry3D` object with all eight corners of the geometry rounded in a spherical fashion.
    ///
    /// This method uses the bounding box of the geometry to determine the appropriate size for the rounding mask.
    /// It is intended for geometries that are box-like or similar enough for this approximation to be effective.
    ///
    /// The rounding is done in a spherical manner, affecting all eight corners of the bounding box uniformly.
    
    func roundingBoxCorners(radius: Double) -> any Geometry3D {
        roundingBoxCorners(radius: radius, mode: .full)
    }

    func roundingBoxCorners(radius: Double, side: Box.Side) -> any Geometry3D {
        self
            .rotated(from: side.direction, to: .up)
            .roundingBoxCorners(radius: radius, mode: .top)
            .rotated(from: .up, to: side.direction)
    }
}

internal extension Geometry3D {
    func roundingBoxCorners(axis: Axis3D, _ radii: RectangleCornerRadii, style: RoundedCornerStyle = .circular) -> any Geometry3D {
        let adjustments = [90°, 0°, 180°]

        return self
            .rotated(from: axis.direction * -1, to: .up)
            .rotated(z: adjustments[axis.index])
            .measuringBounds { body, box in
                let box = box.requireNonNil()
                body.intersecting {
                    RoundedRectangleMask(box.size.xy, style: style, radii: radii)
                        .extruded(height: box.size.z)
                        .translated(box.minimum)
                }
            }
            .rotated(z: -adjustments[axis.index])
            .rotated(from: .up, to: axis.direction * -1)
    }
}

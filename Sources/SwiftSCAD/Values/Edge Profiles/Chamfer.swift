import Foundation

internal struct Chamfer {
    let width: Double
    let height: Double
}

extension Chamfer: EdgeProfileShape {
    var shape: any Geometry2D {
        baseMask(width: width, height: height)
    }

    func inset(at z: Double) -> Double {
        (z / height) * width
    }

    func convexMask(shape: any Geometry2D, extrusionHeight: Double) -> any Geometry3D {
        shape.extruded(height: max(extrusionHeight - height, 0.01))
            .adding {
                shape
                    .offset(amount: -width, style: .round)
                    .extruded(height: 0.01)
                    .translated(z: extrusionHeight - 0.01)
            }
            .convexHull()
    }
}
import Foundation

extension Boundary {
    fileprivate var visualizationPointColor: Color {
        Color.named(.red, alpha: 1)
    }

    fileprivate var visualizationStandardPointSize: Double { 0.1 }
}

extension Boundary3D {
    func visualized(scale: Double) -> any Geometry3D {
        points.mapUnion {
            Box(visualizationStandardPointSize * scale, center: .all)
                .translated($0)
        }
        .colored(visualizationPointColor)
        .background()
    }
}

extension Boundary2D {
    func visualized(scale: Double) -> any Geometry2D {
        points.mapUnion {
            Rectangle(visualizationStandardPointSize * scale, center: .all)
                .translated($0)
        }
        .colored(visualizationPointColor)
        .background()
    }
}

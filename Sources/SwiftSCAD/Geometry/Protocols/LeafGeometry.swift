import Foundation

internal protocol LeafGeometry2D: Geometry2D {
    var moduleName: String { get }
    var moduleParameters: CodeFragment.Parameters { get }
    var boundary: Bounds { get }
}

extension LeafGeometry2D {
    public func codeFragment(in environment: Environment) -> CodeFragment {
        .init(module: moduleName, parameters: moduleParameters, body: [])
    }

    public func elements(in environment: Environment) -> [ObjectIdentifier: any ResultElement] {
        [:]
    }

    public func boundary(in environment: Environment) -> Bounds {
        boundary
    }
}

internal protocol LeafGeometry3D: Geometry3D {
    var moduleName: String { get }
    var moduleParameters: CodeFragment.Parameters { get }
    var boundary: Bounds { get }
    var supportsPreviewConvexity: Bool { get }
}

extension LeafGeometry3D {
    public func codeFragment(in environment: Environment) -> CodeFragment {
        var params = moduleParameters
        if let convexity = environment.previewConvexity, supportsPreviewConvexity {
            params["convexity"] = convexity
        }

        return .init(module: moduleName, parameters: params, body: [])
    }

    public func elements(in environment: Environment) -> [ObjectIdentifier: any ResultElement] {
        [:]
    }

    public func boundary(in environment: Environment) -> Bounds {
        boundary
    }

    var supportsPreviewConvexity: Bool { false }
}

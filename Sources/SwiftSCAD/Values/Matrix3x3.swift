import Foundation

// If Accelerate is available, we use SIMD types for our matrices.
// Otherwise, we implement the basic operations we need ourselves

#if canImport(simd)

import simd
internal typealias Matrix3x3 = simd_double3x3

internal extension simd_double3x3 {
    typealias Row = SIMD3<Double>
    typealias Column = SIMD3<Double>
    static let identity = matrix_identity_double3x3
}

#else
internal typealias Matrix3x3 = BasicMatrix3x3
#endif


internal struct BasicMatrix3x3: Equatable {
    typealias Row = [Double]
    typealias Column = [Double]

    var values: [[Double]]

    init(rows: [[Double]]) {
        values = rows
    }

    subscript(_ row: Int, _ column: Int) -> Double {
        get { values[row][column] }
        set { values[row][column] = newValue }
    }

    static let identity = Self(rows: [
        [1, 0, 0],
        [0, 1, 0],
        [0, 0, 1]
    ])

    static func *(_ lhs: BasicMatrix3x3, _ rhs: BasicMatrix3x3) -> BasicMatrix3x3 {
        BasicMatrix3x3(rows:
            (0..<3).map { row in
                (0..<3).map { column in
                    (0..<3).map { i in
                        rhs[row, i] * lhs[i, column]
                    }.reduce(0, +)
                }
            }
        )
    }

    static func *(_ lhs: Column, _ rhs: BasicMatrix3x3) -> Row {
        (0..<3).map { index in
            rhs.values[index].enumerated().map { column, value in
                value * lhs[column]
            }.reduce(0, +)
        }
    }
}

internal extension [Double] {
    init(_ a: Double, _ b: Double, _ c: Double) {
        self = [a, b, c]
    }
}

//
//  File.swift
//  
//
//  Created by Tomas Franzén on 2021-07-03.
//

import Foundation

public struct Teardrop: Shape2D {
	public let style: Style
	public let angle: Angle
	public let diameter: Double

	public init(diameter: Double, angle: Angle = 45, style: Style = .full) {
		precondition(angle > 0 && angle < 90, "Angle must be between 0 and 90 degrees")
		self.diameter = diameter
		self.angle = angle
		self.style = style
	}

	public var body: Geometry2D {
		let x = cos(angle) * diameter/2
		let y = sin(angle) * diameter/2
		let diagonal = diameter / sin(angle)

		let base = Union {
			Circle(diameter: diameter)
			Intersection {
				Rectangle([diagonal, diagonal])
					.rotate(-angle.degrees)
					.translate(x: -x, y: y)
				Rectangle([diagonal, diagonal])
					.rotate(angle.degrees + 90)
					.translate(x: x, y: y)
			}
		}

		if style == .bridged {
			return Intersection {
				base
				Rectangle([diameter, diameter], center: .xy)
			}
		} else {
			return base
		}
	}

	public enum Style {
		case full
		case bridged
	}
}

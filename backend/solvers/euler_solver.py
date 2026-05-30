class EulerSolver:

    @staticmethod
    def solve(function, x0, y0, h, x_end):

        x_values = []
        y_values = []

        steps = []

        x = x0
        y = y0

        step_number = 1

        while x <= x_end:

            x_values.append(round(x, 6))
            y_values.append(round(y, 6))

            derivative = function(x, y)

            next_y = y + h * derivative

            steps.append(
                {
                    "step": step_number,
                    "x": round(x, 6),
                    "y": round(y, 6),
                    "f_xy": round(float(derivative), 6),
                    "next_y": round(float(next_y), 6)
                }
            )

            y = next_y
            x = x + h

            step_number += 1

        return {
            "x_values": x_values,
            "y_values": y_values,
            "steps": steps
        }
class RK4Solver:

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

            k1 = function(x, y)

            k2 = function(
                x + h / 2,
                y + h * k1 / 2
            )

            k3 = function(
                x + h / 2,
                y + h * k2 / 2
            )

            k4 = function(
                x + h,
                y + h * k3
            )

            next_y = y + (h / 6) * (
                k1 +
                2 * k2 +
                2 * k3 +
                k4
            )

            steps.append(
                {
                    "step": step_number,
                    "x": round(x, 6),
                    "y": round(y, 6),
                    "k1": round(float(k1), 6),
                    "k2": round(float(k2), 6),
                    "k3": round(float(k3), 6),
                    "k4": round(float(k4), 6),
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
class RK4Solver:

    @staticmethod
    def solve(function, x0, y0, h, x_end):

        x_values = []
        y_values = []

        x = x0
        y = y0

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

            y = y + (h / 6) * (
                k1 +
                2 * k2 +
                2 * k3 +
                k4
            )

            x = x + h

        return {
            "x_values": x_values,
            "y_values": y_values
        }
class EulerSolver:

    @staticmethod
    def solve(function, x0, y0, h, x_end):

        x_values = []
        y_values = []

        x = x0
        y = y0

        while x <= x_end:

            x_values.append(round(x, 6))
            y_values.append(round(y, 6))

            y = y + h * function(x, y)
            x = x + h

        return {
            "x_values": x_values,
            "y_values": y_values
        }
from sympy import symbols, sympify, lambdify


class EquationParser:

    @staticmethod
    def parse(
        equation: str,
        parameters: dict | None = None
    ):

        parameters = parameters or {}

        x, y = symbols("x y")

        parameter_symbols = {
            name: symbols(name)
            for name in parameters.keys()
        }

        expression = sympify(
            equation,
            locals=parameter_symbols
        )

        symbol_list = [x, y]

        for name in parameters.keys():
            symbol_list.append(
                parameter_symbols[name]
            )

        raw_function = lambdify(
            symbol_list,
            expression,
            "numpy"
        )

        def wrapped_function(x_value, y_value):

            args = [
                x_value,
                y_value
            ]

            for value in parameters.values():
                args.append(value)

            return raw_function(*args)

        return wrapped_function
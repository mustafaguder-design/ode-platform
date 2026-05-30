from sympy import symbols, sympify, lambdify


class EquationParser:

    @staticmethod
    def parse(equation: str):

        x, y = symbols("x y")

        expression = sympify(equation)

        function = lambdify((x, y), expression, "numpy")

        return function
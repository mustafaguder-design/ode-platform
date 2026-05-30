from backend.parser.equation_parser import EquationParser

from backend.solvers.euler_solver import EulerSolver
from backend.solvers.rk4_solver import RK4Solver


class SolverService:

    @staticmethod
    def solve(data):

        function = EquationParser.parse(
            data.equation,
            data.parameters
        )

        method = data.method.lower()

        if method == "euler":

            result = EulerSolver.solve(
                function=function,
                x0=data.x0,
                y0=data.y0,
                h=data.h,
                x_end=data.x_end
            )

            return {
                "method": "euler",
                "equation": data.equation,
                "parameters": data.parameters,
                "result": result
            }

        elif method == "rk4":

            result = RK4Solver.solve(
                function=function,
                x0=data.x0,
                y0=data.y0,
                h=data.h,
                x_end=data.x_end
            )

            return {
                "method": "rk4",
                "equation": data.equation,
                "parameters": data.parameters,
                "result": result
            }

        elif method == "compare":

            euler_result = EulerSolver.solve(
                function=function,
                x0=data.x0,
                y0=data.y0,
                h=data.h,
                x_end=data.x_end
            )

            rk4_result = RK4Solver.solve(
                function=function,
                x0=data.x0,
                y0=data.y0,
                h=data.h,
                x_end=data.x_end
            )

            euler_final = euler_result["y_values"][-1]
            rk4_final = rk4_result["y_values"][-1]

            absolute_difference = abs(
                rk4_final - euler_final
            )

            relative_difference = 0

            if rk4_final != 0:

                relative_difference = (
                    absolute_difference /
                    abs(rk4_final)
                ) * 100

            return {
                "method": "compare",
                "equation": data.equation,
                "parameters": data.parameters,

                "euler": euler_result,
                "rk4": rk4_result,

                "analysis": {
                    "euler_final": round(
                        float(euler_final),
                        6
                    ),

                    "rk4_final": round(
                        float(rk4_final),
                        6
                    ),

                    "absolute_difference": round(
                        float(absolute_difference),
                        6
                    ),

                    "relative_difference_percent": round(
                        float(relative_difference),
                        4
                    )
                }
            }

        raise ValueError(
            "Invalid method. Use euler, rk4 or compare."
        )
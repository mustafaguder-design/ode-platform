from fastapi import FastAPI, HTTPException

from backend.models.solve_request import SolveRequest
from backend.parser.equation_parser import EquationParser

from backend.solvers.euler_solver import EulerSolver
from backend.solvers.rk4_solver import RK4Solver

app = FastAPI()


@app.get("/")
def root():
    return {
        "message": "ODE Platform Backend Running"
    }


@app.post("/solve")
def solve(data: SolveRequest):

    try:

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

            return {
                "method": "compare",
                "equation": data.equation,
                "parameters": data.parameters,
                "euler": euler_result,
                "rk4": rk4_result
            }

        else:

            raise HTTPException(
                status_code=400,
                detail="Invalid method. Use euler, rk4 or compare."
            )

    except Exception as e:

        raise HTTPException(
            status_code=400,
            detail=str(e)
        )


@app.get("/test-parser")
def test_parser():

    f = EquationParser.parse("x+y")

    result = f(1, 2)

    return {
        "result": float(result)
    }


@app.get("/test-euler")
def test_euler():

    f = EquationParser.parse("x+y")

    return EulerSolver.solve(
        function=f,
        x0=0,
        y0=1,
        h=0.1,
        x_end=1
    )


@app.get("/test-rk4")
def test_rk4():

    f = EquationParser.parse("x+y")

    return RK4Solver.solve(
        function=f,
        x0=0,
        y0=1,
        h=0.1,
        x_end=1
    )
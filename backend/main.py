from fastapi import FastAPI

from backend.models.solve_request import SolveRequest
from backend.parser.equation_parser import EquationParser
from backend.solvers.euler_solver import EulerSolver

app = FastAPI()


@app.get("/")
def root():
    return {
        "message": "ODE Platform Backend Running"
    }


@app.post("/solve")
def solve(data: SolveRequest):

    return {
        "status": "success",
        "equation": data.equation,
        "x0": data.x0,
        "y0": data.y0,
        "h": data.h,
        "x_end": data.x_end,
        "method": data.method
    }


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

    result = EulerSolver.solve(
        function=f,
        x0=0,
        y0=1,
        h=0.1,
        x_end=1
    )

    return result
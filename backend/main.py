from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware

from backend.models.solve_request import SolveRequest
from backend.services.solver_service import SolverService

from backend.parser.equation_parser import EquationParser

from backend.solvers.euler_solver import EulerSolver
from backend.solvers.rk4_solver import RK4Solver

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
def root():
    return {
        "message": "ODE Platform Backend Running"
    }


@app.post("/solve")
def solve(data: SolveRequest):

    try:

        return SolverService.solve(data)

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
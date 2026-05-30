from pydantic import BaseModel


class SolveRequest(BaseModel):
    equation: str
    x0: float
    y0: float
    h: float
    x_end: float
    method: str
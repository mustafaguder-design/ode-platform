from typing import Dict

from pydantic import BaseModel, Field


class SolveRequest(BaseModel):

    equation: str = Field(
        ...,
        min_length=1
    )

    parameters: Dict[str, float] = {}

    x0: float

    y0: float

    h: float = Field(
        ...,
        gt=0
    )

    x_end: float

    method: str = Field(
        ...,
        min_length=1
    )
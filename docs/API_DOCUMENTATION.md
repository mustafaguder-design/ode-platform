# ODE Platform API Documentation

## Overview

This document describes the REST API provided by the ODE Platform backend.

Base URL:

```text
http://127.0.0.1:8000
```

Development URL:

```text
http://127.0.0.1:8000/docs
```

---

# Endpoint List

## Root Endpoint

### Request

```http
GET /
```

### Response

```json
{
  "message": "ODE Platform Backend Running"
}
```

---

# Solve Differential Equation

## Endpoint

```http
POST /solve
```

This endpoint numerically solves an ordinary differential equation.

---

# Request Body

## Fields

| Field      | Type   | Description           |
| ---------- | ------ | --------------------- |
| equation   | string | Differential equation |
| parameters | object | Parameter dictionary  |
| x0         | float  | Initial x value       |
| y0         | float  | Initial y value       |
| h          | float  | Step size             |
| x_end      | float  | End value of x        |
| method     | string | Numerical method      |

---

# Supported Methods

```text
euler
rk4
compare
```

---

# Example Request

```json
{
  "equation": "a*y+b*x",
  "parameters": {
    "a": 2,
    "b": 5
  },
  "x0": 0,
  "y0": 1,
  "h": 0.1,
  "x_end": 1,
  "method": "compare"
}
```

---

# Equation Examples

## Simple Equation

```text
x+y
```

---

## Trigonometric Equation

```text
sin(x)+y
```

---

## Parameterized Equation

```text
a*y
```

Parameters:

```json
{
  "a": 2
}
```

---

## Multiple Parameters

```text
a*y+b*x
```

Parameters:

```json
{
  "a": 2,
  "b": 5
}
```

---

# Euler Response

```json
{
  "method": "euler",
  "equation": "x+y",
  "result": {
    "x_values": [],
    "y_values": [],
    "steps": []
  }
}
```

---

# RK4 Response

```json
{
  "method": "rk4",
  "equation": "x+y",
  "result": {
    "x_values": [],
    "y_values": [],
    "steps": []
  }
}
```

---

# Compare Response

```json
{
  "method": "compare",
  "equation": "x+y",

  "euler": {},

  "rk4": {},

  "analysis": {
    "euler_final": 0,
    "rk4_final": 0,
    "absolute_difference": 0,
    "relative_difference_percent": 0
  }
}
```

---

# Step Information

## Euler Step

```json
{
  "step": 1,
  "x": 0,
  "y": 1,
  "f_xy": 1,
  "next_y": 1.1
}
```

---

## RK4 Step

```json
{
  "step": 1,
  "x": 0,
  "y": 1,
  "k1": 1,
  "k2": 1.1,
  "k3": 1.105,
  "k4": 1.2105,
  "next_y": 1.110342
}
```

---

# Validation Rules

## Equation

Must not be empty.

---

## Step Size

```text
h > 0
```

Required.

---

## Method

Allowed values:

```text
euler
rk4
compare
```

---

# Error Response Example

```json
{
  "detail": "Invalid method. Use euler, rk4 or compare."
}
```

---

# Frontend Integration Notes

Recommended workflow:

```text
User Input
      ↓
POST /solve
      ↓
Receive JSON
      ↓
Display Graph
      ↓
Display Step-by-Step Solution
      ↓
Display Error Analysis
```

---

# Graph Data

Use:

```json
{
  "x_values": [],
  "y_values": []
}
```

to plot numerical solution curves.

---

# Educational Features

The API supports:

* Numerical approximation
* Method comparison
* Step-by-step calculations
* Error analysis
* Parameterized equations

making it suitable for educational and research purposes.

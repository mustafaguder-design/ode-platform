# ODE Platform

An Interactive Software Platform for Numerical Solution and Visualization of Ordinary Differential Equations

## Project Overview

ODE Platform is an educational and analytical software system developed for the numerical solution of ordinary differential equations (ODEs).

The platform allows users to:

* Define differential equations
* Set initial conditions
* Define custom parameters
* Solve equations numerically
* Compare different numerical methods
* Analyze solution accuracy
* View step-by-step calculations

The project is designed as both an educational tool and an analytical platform for students, instructors, and researchers.

---

## Implemented Numerical Methods

### Euler Method

A first-order numerical method used to approximate solutions of ordinary differential equations.

Features:

* Numerical approximation
* Step-by-step calculations
* Educational visualization support

---

### Runge-Kutta 4th Order Method (RK4)

A higher-accuracy numerical method widely used in scientific computing.

Features:

* High precision approximation
* Detailed intermediate calculations (k1, k2, k3, k4)
* Error comparison support

---

## Current Features

### Differential Equation Input

Examples:

```text
x + y
sin(x) + y
a * y
a * y + b * x
```

---

### Initial Conditions

Users can define:

```text
x0
y0
```

---

### Parameter Support

Example:

```text
a * y + b * x
```

Parameters:

```json
{
  "a": 2,
  "b": 5
}
```

---

### Numerical Solvers

Supported methods:

* Euler Method
* Runge-Kutta 4 (RK4)

---

### Compare Mode

The platform can solve the same equation using both methods simultaneously and compare the results.

Output includes:

* Euler solution
* RK4 solution
* Absolute difference
* Relative difference percentage

---

### Step-by-Step Solution Process

Euler example:

```text
Step 1
x = 0
y = 1
f(x,y) = 1
next_y = 1.1
```

RK4 example:

```text
k1
k2
k3
k4
```

Intermediate calculations are stored and returned by the API.

---

### Validation System

Input validation includes:

* Empty equation detection
* Invalid method detection
* Invalid step size detection
* Request validation

---

## Backend Architecture

```text
FastAPI
   │
   ▼
Solver Service
   │
   ▼
Equation Parser
   │
   ▼
Euler Solver / RK4 Solver
```

---

## Technologies Used

Backend:

* Python
* FastAPI
* SymPy
* NumPy

Version Control:

* Git
* GitHub

Frontend (planned):

* Flutter
* Android
* Web

---

## API Endpoint

### Solve Differential Equation

```http
POST /solve
```

Example request:

```json
{
  "equation": "a*y",
  "parameters": {
    "a": 2
  },
  "x0": 0,
  "y0": 1,
  "h": 0.1,
  "x_end": 1,
  "method": "compare"
}
```

---

## Team Structure

### Backend Development

* Numerical methods
* API development
* Equation parser
* Validation system

### Frontend Development

* Flutter interface
* Graph visualization
* User interaction

### Documentation & Testing

* User documentation
* API documentation
* Testing and validation

---

## Future Improvements

* Advanced numerical methods
* Graph export
* CSV export
* Analytical solution comparison
* User history
* Cloud deployment

---

## Academic Purpose

This project was developed as a Software Engineering Graduation Project and aims to combine:

* Differential Equations
* Numerical Analysis
* Calculus
* Software Engineering
* Interactive Learning Systems

into a single educational platform.

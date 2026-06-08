# ODE Platform Frontend

## Overview

This Flutter application provides a user-friendly interface for solving Ordinary Differential Equations (ODEs) using numerical methods.

The frontend communicates with a FastAPI backend and visualizes the numerical solutions through interactive graphs.

## Features

* Euler Method Solver
* Runge-Kutta 4th Order (RK4) Solver
* Compare Mode (Euler vs RK4)
* Interactive Graph Visualization
* Step-by-Step Solution Display
* Responsive User Interface

## Technologies

* Flutter
* Dart
* fl_chart
* HTTP Package

## Project Structure

```text
lib/
├── screens/
├── widgets/
├── services/
└── main.dart
```

## Running the Application

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run -d chrome
```

## Backend Requirement

The FastAPI backend must be running on:

```text
http://127.0.0.1:8000
```

before starting the frontend application.


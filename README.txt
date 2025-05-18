# Angle and Distance Calculation Utilities

This Python module provides simple utility functions to calculate:

- The angle formed at a point `b` by three points `a`, `b`, and `c`.
- The distance between two landmarks, scaled to a specified range.

## Functions

### `get_angle(a, b, c)`

Calculates the absolute angle (in degrees) at point `b` formed by points `a` and `c`.

- **Parameters:**
  - `a`, `b`, `c`: Tuples or lists with `(x, y)` coordinates.
  
- **Returns:**
  - Angle in degrees (float).

### `get_distance(landmark_list)`

Calculates the Euclidean distance between the first two points in the given list, then scales it linearly from `[0, 1]` to `[0, 1000]`.

- **Parameters:**
  - `landmark_list`: List of tuples/lists with `(x, y)` coordinates. Must contain at least two points.
  
- **Returns:**
  - Scaled distance as a float. Returns `None` if the list contains fewer than 2 points.

## Requirements

- Python 3.x
- NumPy

## Installation

Install NumPy if not already installed:

```bash
pip install numpy

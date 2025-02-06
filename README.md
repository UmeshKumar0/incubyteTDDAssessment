String Calculator - TDD Kata

📌 Overview

This project implements a String Calculator using Test-Driven Development (TDD) in Flutter.

🚀 Features

Handles empty string input ("") → returns 0

Supports comma-separated numbers ("1,2") → returns 3

Allows new line as a delimiter ("1\n2,3") → returns 6

Supports custom delimiters ("//;\n1;2") → returns 3

Throws an exception for negative numbers ("1,-2,-3") → "Negative numbers not allowed: -2, -3"

📱 Simple UI

A basic Flutter UI has been implemented to interact with the String Calculator. Users can enter numbers and see the computed sum.

🖼️ UI Preview

 (Replace with actual image link)

📜 Method Signature

int add(String numbers)

🔬 Running Tests

Run tests using:

flutter test

🔗 Resources

Flutter Testing Guide

Happy Coding! 🎯

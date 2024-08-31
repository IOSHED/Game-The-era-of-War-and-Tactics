@echo off
setlocal

REM exit to root
cd ..

REM Check if git is installed
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Git is not installed. Please install Git and try again.
    exit /b 1
)

REM Create a virtual environment for pre-commit
python -m venv venv
if %errorlevel% neq 0 (
    echo Python is not installed or there was an error creating the virtual environment. Please ensure Python is installed and try again.
    exit /b 1
)

REM Activate the virtual environment
call venv\Scripts\activate

REM Install pre-commit
pip install pre-commit
if %errorlevel% neq 0 (
    echo There was an error installing pre-commit. Please check your Python and pip installations and try again.
    exit /b 1
)

REM Install the pre-commit hooks
pre-commit install
if %errorlevel% neq 0 (
    echo There was an error installing the pre-commit hooks. Please try again.
    exit /b 1
)

REM Build all crates of Rust
cargo build

echo Setup complete. You can now start working on the project.

endlocal

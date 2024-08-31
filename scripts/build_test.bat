@echo off
setlocal

REM exit to root
cd ..

REM build
cargo build
cargo run

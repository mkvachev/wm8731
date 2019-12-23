@echo off
cls

if exist sim rd /S /Q sim
if not exist sim md sim

cd sim
vsim -do ..%1
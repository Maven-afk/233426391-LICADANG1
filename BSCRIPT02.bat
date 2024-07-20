@echo off
setlocal enabledelayedexpansion

:menu
echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
set /p choice=Enter your choice (1/2/3): 

if "%choice%"=="1" goto circle
if "%choice%"=="2" goto triangle
if "%choice%"=="3" goto quadrilateral
echo Invalid choice. Please select 1, 2, or 3.
goto menu

:circle
set /p radius=Enter the radius of the circle: 
set /a area=31415926*radius*radius/10000000
echo The area of the circle is !area!
goto end

:triangle
set /p side1=Enter the length of the first side: 
set /p side2=Enter the length of the second side: 
set /p side3=Enter the length of the third side: 

set /a s=(side1+side2+side3)/2
set /a area=s*(s-side1)*(s-side2)*(s-side3)
for /f "tokens=*" %%A in ('powershell -command "[math]::sqrt(!area!)"') do set area=%%A
echo The area of the triangle is !area!

if "%side1%"=="%side2%" if "%side2%"=="%side3%" (
    echo The triangle is equilateral.
) else if "%side1%"=="%side2%" if not "%side2%"=="%side3%" (
    echo The triangle is isosceles.
) else if "%side1%"=="%side3%" if not "%side2%"=="%side3%" (
    echo The triangle is isosceles.
) else if "%side2%"=="%side3%" if not "%side1%"=="%side2%" (
    echo The triangle is isosceles.
) else (
    echo The triangle is scalene.
)
goto end

:quadrilateral
set /p length=Enter the length: 
set /p width=Enter the width: 
set /a area=length*width
echo The area of the quadrilateral is !area!

if "%length%"=="%width%" (
    echo The quadrilateral is a square.
) else (
    echo The quadrilateral is a rectangle.
)
goto end

:end
echo Thank you for using the shape calculator.
pause

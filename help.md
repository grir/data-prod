---
title: "help"
output: html_document
---
### Description
This application demonstrates how to use [Monte Carlo simulataions](http://en.wikipedia.org/wiki/Monte_Carlo_method#Use_in_mathematics) to estimate an area of simple planar shapes. We choose an ellipse and a triangle belonging to the square [-1,1]x[-1,1]. Then we generate *N* random points from mentioned square and estimate the areas of the shapes using ratios between the number of the point belonging to the approriate shape and *N*.
Any  user can change the parameters of both shapes and compare estimated values of the areas with ones calculated using exact formulae.


### How to use application

1. You can change the seed value of RNG using your value.  In this case you must "check"  "*Use seed*".
2. To change the number of random points *N* use the slider "*Number of points*".
3. Another sliders give the possibility to change the parameters of the ellipse (both semi-axes) and of the triangle (the coordinates of all three verteces).
4. The appplication re-calculates the areas and replots the graph after any modifications of its parameters.


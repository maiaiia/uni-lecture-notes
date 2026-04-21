---
Class: "[[AI]]"
date: 2026-04-21
type:
---
# Convolutional Neural Networks

- depth dimension: the number of color channels (1 for b&w -- brightness; 3 for color -- rgb)
- filter (kernel) 
	- a "feature detector" that "slides over the image like a magnifying glass". it "sits" over a "chunk" of an image and does 1-to-1 multiplication
	- uses the *dot product*, because, in math, the dot product measures similarity. if the pixels in the image match the pattern of weights in the filter, the resulting number will be very large
- rule: filter must have the same depth as the input it's looking at
- activation map: produced as the filter convolves across the entire image, producing a new number for every single position it stops at
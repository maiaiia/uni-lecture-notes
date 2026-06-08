---
Class: "[[AI]]"
date:
type:
---
# Neural Networks
- inspired by how neurons work in a human brain

## General Stuff
Neural networks have multiple layers:
- input layer
- hidden layers
- output layer

Each layer is made of multiple **nodes**. The transition between 2 adjacent layers is done via a function. The final function applied between the last hidden layer and the output layer is called an **activation function**.

## Perceptron
>[!Definition]
> The perceptron is the *first model of a neuron*. It was originally designed to take a number of binary inputs and produce one binary output.
> 

A perceptron has: 
- an input layer
- a hidden layer of node weights
- a transfer function
- an activation function  
- an output layer

Perceptrons use different **weights** (associated to each node) to represent the *importance* of each input. The sum of the values should be greater than a **threshold value** before a *decision* is made (like true or false - 0 or 1).

>[!Info] Original algorithm
>- Set a threshold value $\theta$
>- Multiply all inputs with its weights
>- Sum all the results
>- Activate the output (via the activation function $\phi$)

>[!Warning]
>Non-linear separable data cannot be classified

### Training
Perceptron's rule $\rightarrow$ perceptron's algorithm
1. Start by some random weights
2. Determine the quality of the model created for these weights for a **single input data**
3. Re-compute the weights based on the model's quality
4. Repeat steps 2 and 3 until a maximum quality is obtained 

![[perceptron-learning.png]]

where $\eta$ is the **learning rate**
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
> The perceptron is the *first model of a neuron*. It was originally designed to take a number of binary inputs and produce one binary outputs.
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
## Artificial Neural Networks
This section will cover *feed forward* neural networks. They are the simplest type of ANNs. Information moves in one direction (i.e. forward) only.

- **nodes** 
	- have *inputs* and *outputs*
	- perform a simple computing through an *activation function*
	- are connected by *weighted links*
		- these define the network structure
		- links influence the computations that get performed
- **layers**
	- **input** layer
		- contains $m$ nodes (the number of attributes of the data)
	- **output** layer
		- contains $r$ nodes (the number of possible outputs)
	- **intermediate** layers have
		- different structures
		- different sizes

ANNs are suitable for problems where:
- the data can be represented by attribute-value pairs
- the objective function can be:
	- single or multi-criteria
	- discrete or continuous (real values)
- training data can be noised
- there may be a large training time

### Training - [[Partial derivatives and Differentiability in Rn#Partial derivatives|Gradient]] Descent
- Based on the error associated to the entire set of training data.
- weights are modified in the direction of the steepest slope of error reduction for the entire set of data: $E(w)$ is the error; the steepest slope is $\nabla E(w)$

Delta's rule $\rightarrow$ algorithm of **gradient descent** 
1. Start by some random weights 
2. Determine the quality of the model created for these weights for **all input data**
3. Re-compute the weights based on the model's quality
4. Repeat steps 2 and 3 until a maximum quality is obtained 

## Comparison


| Notion        | Perceptron's algorithm                                    | Gradient descent algorithm (delta rule) |
| :------------ | --------------------------------------------------------- | --------------------------------------- |
| Convergence   | After a finite number of steps (until perfect separation) | Asymptotic (to a minimal error)         |
| Problem set   | Data that can be linearly separated                       | Any data                                |
| Neuron output | Discrete and with a threshold                             | Continuous and without a threshold      |
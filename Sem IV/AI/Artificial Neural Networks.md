---
Class: "[[AI]]"
date:
type:
---
# Artificial Neural Networks
## Feed-forward Neural Networks
They are the simplest type of ANNs:
- the [[NeuralNetworks#Perceptron|perceptrons]] are arranged in layers: input, hidden, output layers
- the data flow goes in one direction
	- each perceptron is connected with every perceptron on the next layer
	- there is no connection between the perceptrons in the same layer

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

>[!Info]
>Feed forward networks are generally used for classification problems

### Design choices for feed-forward ANNs

- **Activation function**
- **Loss function**
- **Output units**
- **Architecture**

#### activation function

Linear models can fit data efficiently, but they provide limited model capacity. This is where activation functions come into play.

Activation functions:
- provide *non-linearity*
- ensure *gradients remain large* through hidden unit

Common choices are:
- sigmoid
- ReLU, leaky ReLU, generalised ReLU, MaxOut
- Softplus
- Tanh
- Swish

>[!TODO]
>Table in lab - activation function per problem type

![[Screenshot 2026-06-08 at 00.20.25.png]]

### Training - [[Partial derivatives and Differentiability in Rn#Partial derivatives|Gradient]] Descent
- Based on the error associated to the entire set of training data.
- weights are modified in the direction of the steepest slope of error reduction for the entire set of data: $E(w)$ is the error; the steepest slope is $\nabla E(w)$

Delta's rule $\rightarrow$ algorithm of **gradient descent** 
1. Start by some random weights 
2. Determine the quality of the model created for these weights for **all input data**
3. Re-compute the weights based on the model's quality
4. Repeat steps 2 and 3 until a maximum quality is obtained 

### Comparison with a basic perceptron

| Notion        | Perceptron's algorithm                                    | Gradient descent algorithm (delta rule) |
| :------------ | --------------------------------------------------------- | --------------------------------------- |
| Convergence   | After a finite number of steps (until perfect separation) | Asymptotic (to a minimal error)         |
| Problem set   | Data that can be linearly separated                       | Any data                                |
| Neuron output | Discrete and with a threshold                             | Continuous and without a threshold      |



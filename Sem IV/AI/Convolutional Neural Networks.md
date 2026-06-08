---
Class: "[[AI]]"
date: 2026-04-21
type:
---
# Convolutional Neural Networks

>[!Definition]
>Convolutional Neural Networks are deep neural networks widely used in *computer vision* tasks such as
>- image classification
>- image retrieval and similarity-based search
>- object detection and recognition in scenes

So CNNs are designed specifically for processing data that has spacial structure (most commonly images). The idea is that instead of connecting every neuron to every pixel (which would be enormous), small learnable filters are slid across the image to detect local patterns.
## Tensors in deep learning

>[!Definition]
>In deep learning, a **tensor** is simply a *multidimensional array*

 ConvNets ingest and process images as tensors.

## Convolution Layer Hyperparameters

 >[!Definition]
 >A **convolutional layer** is typically defined by:
 >- number of filters
 >- kernel size
 >- stride
 >- padding
 >- activation function
 >- optional bias term

The word *convolution* comes from math. For two continuous functions $x(t)$ and $w(t)$, convolution is defined as sliding one over the other and multiplying at every position. For discrete data (like pixels), you sum instead of integrate.

Mathematically, convolution flips the kernel (i.e. mirrors it), then slides it. But in almost all CNN code, what's actually computed is **cross-correlation**, which does the same sliding, but without the flip.

| Attribute       | Meaning                                                                                                         |
| --------------- | --------------------------------------------------------------------------------------------------------------- |
| Kernel (filter) | small grid of numbers that slides across the image                                                              |
| Stride          | number of pixels by which the kernel moves at each step                                                         |
| Padding         | adding extra values around the border of the input                                                              |
| Bias term       | a scalar added to every output value the kernel produces in order to shift the activations before they hit ReLU |

>[!Info]
>The **output size** of a convolution layer is: $$H_{out}=\bigg[\cfrac{H_{in}-K_h+2P_h}{S_h}+1\bigg]$$ where 
>- $H_{in}\times W_{in}$ is the input size
>- $K_h \times K_w$ is the kernel size
>- $P_h, P_w$ is the padding size
>- $S_h, S_w$ is the stride

### The Kernel
>[!Definition]
>A **kernel** (also called a **filter**) is a small grid of numbers that slides across the image. 

At each position, the kernel computes a weighted sum of the pixels underneath it. The result is a single number written into the output, called the **feature map**.

### Padding

>[!Definition]
>**Padding** means adding extra values around the border of the *input*.

This is done in order to: 
- control output size
- allow border pixels to influence the output more fairly
- help preserve spatial information near image boundaries

There are 2 common choices of padding:
- **valid padding**: no padding
- **same padding**: padding chosen so that the spatial size is preserved for stride 1

### Receptive field and depth

>[!Definition]
>The **receptive field** of a neuron is the region of the original image that can influence the neuron's input.

Example for a $3 \times 3$ kernel:

| Number of layers | Number of pixels seen |
| ---------------- | --------------------- |
| 1                | $3 \times 3$          |
| 2                | $5 \times 5$          |
| 3                | $7 \times 7$          |
>[!Tip]
>Early layers see local things like edges. Deeper layers see bigger things like shapes, then parts, then whole objects
### The bias term

>[!Definition]
>A **bias** is a single scalar added to every output value that kernel produces. The bias shifts the activations before they hit the ReLU. It's learned during training, just like the kernel weights.

### The activation function: why it is necessary

Just like with regular NNs, activation functions are used to *introduce non-linearity* (as a convolution is a linear operation). This allows the network to learn complex patterns, hierarchical features, and non-linear decision boundaries.

## Sparse Connectivity & Parameter Sharing

Comparison of regular fully-connected networks and CNNs
E.g. a 265x265 color image ($\approx$ 200000 pixels); a kernel of size $3x3$

Sparse connectivity: Each output neuron only looks at a small local region of the field (i.e. its *receptive field*). In a regular, fully-connected layer, you'd have each neuron connected to all neurons in the next layer. (so 9 weights per neuron instead of 200000)

Parameter sharing: The same kernel is used at every position in the image. So instead of each position having its own 9 weights, every position shares the same 9, reducing the number of parameters.

Result: a conv layer might have a few hundred parameters where a fully-connected layer would need billions

## Multi-channel convolution

Images often have *multiple channels*:
- e.g. grayscale image: $H \times W \times 1$
- RGB images: $H \times W \times 3$

>[!Important] Rule
>Kernels must have the same depth as the input!

So, for a grayscale image, a kernel needs to have the shape $K_h \times K_w \times 1$, while for an RGB image it needs to be $K_h \times K_w \times 3$. So, a $3 \times 3$ kernel on an RGB image is actually $3 \times 3 \times 3 = 27$ numbers.

As stated before, one filter produces one output feature map. Using many filters produces many *output channels*. This is useful for detecting multiple features (e.g. a kernel for vertical edges, another for horizontal edges, another for corners).

## Translation Equivariance

Convolutional layers are **translation equivariant**: if the input shifts, the feature map also shifts. The detected features move with the object

## Pooling

After convolutions, a **pooling** layer is typically applied to reduce the spatial size of the feature maps. There are 2 main types of pooling:
- **Max pooling**: divide the feature map into small windows. In each window, only keep the maximum value.
- **Average pooling**: same idea, but take the average instead.

Pooling is used to reduce computation, making representation more compact and introducing some [[#Translation Equivariance]] (if a feature moves slightly, the max value in that window might stay the same, so the pooled output doesn't change). In other words, this means that the network cares about *whether* a feature is present, not exactly *where* it is.

>[!Info]
>Pooling is not mandatory and is actually often skipped by modern architectures and replaced by **strided convolutions**. A conv layer with stride 2 can both extract features *and* halve the spatial size in one step. The difference here is that pooling is fixed (no learned weights), while strided convolution is learned.
## Training 
Training a CNN goes essentially the same way as training any NN:
- compute the loss
- use the chain rule to compute how the loss changes with respect to every parameter
- back propagate to update the parameters using gradient descent

>[!Important]
>Gradients are propagated backward through the layers


**Gradient with respect to the filter**:
- the gradient for each kernel weight is computed as a sliding operation between the input and the upstream gradient (another cross-correlation-like operation)

**Gradient with respect to the input**:
- when you compute how the loss flows back *into* the input, you convolve the upstream gradient with the filter

>[!Tip]
>For max pooling over an $N \times N$ region, during backpropagation the gradient is passed only to teh input element that achieved the maximum value in the forward pass


## Batches
>[!Definition]
>In deep learning, a **batch** is a small group of training examples processed together

A common shape in PyTorch is: (batch size, sequence length, input size).
For CNNs, the input is typically a 4D tensor: (batch size, channels, height, width)

 


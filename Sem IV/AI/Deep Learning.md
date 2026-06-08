---
Class: "[[AI]]"
date:
type: Lecture
---
# Deep Learning

## [[Convolutional Neural Networks]]

## Recurrent Neural Networks

>[!Definition]
>A recurrent neural network (RNN) reuses the same cell across time steps.

The main difference between this and a feed-forward network is that the latter sees inputs independently.

Hidden state acts as a compressed memory of previous inputs.

A model processes inputs while carrying context from past to future

Basic RNN Cell: $h_t = \phi(W_{xh}x_t + W_{hh}h_{t-1}+b_h)$, $y_t=W_{hy}h_t+b_y$
- $x_t$: input at time $t$
- $h_t$: hidden state
- $y_t$: output
- $\phi$: usually tanh or ReLU

 ![[Deep Learning 2026-06-08 11.05.35.excalidraw]]
```python
X = torch.randn(4, 6, 10) #batch size, sequence length, input size

rnn = torch.nn.RNN(
	input_size=10,
	hidden_size=8,
	num_layers=1,
	batch_first=True
)
output, h_n=rnn(x)
print(output.shape) #(4, 6, 8) --> batch size, sequence lentth, output size

```


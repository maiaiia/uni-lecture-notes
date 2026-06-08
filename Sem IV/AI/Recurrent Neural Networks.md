---
Class: "[[AI]]"
date: 2026-06-08
type: Lecture
---
# Recurrent Neural Networks

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

(i.e. combine what you just saw with what you remember, then squash it all with tanh)

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

>[!Important]
>For RNNs, the same weights are reused at every step.

## Training With Backpropagation Through Time

>[!Definition]
>BPTT unfolds the networks and propagates gradients backward

Full BPTT is expensive for long sequences
Truncated BPTT updates parameters on shorter windows to reduce memory cost.

The gradient is repeatedly multiplied by recurrent weights, which can shrink or explode.

## Vanishing and Exploding Gradients

- **Vanishing**: early inputs have almost no influence on the gradient
- **Exploding**: gradient norm becomes extremely large
- Long-term dependencies become hard to learn

>[!Info] Common remedies
>Gradient clipping, careful initialization, gated architectures, layered normalization



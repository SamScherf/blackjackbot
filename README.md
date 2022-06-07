# Neural Network Based Blackjack Bot
![issues](https://img.shields.io/github/issues/SamScherf/blackjackbot)
![forks](https://img.shields.io/github/forks/SamScherf/blackjackbot)
![stars](https://img.shields.io/github/stars/SamScherf/blackjackbot)
![license](https://img.shields.io/github/license/SamScherf/blackjackbot)

![poster](/graphics/poster.png?raw=true)

## Introduction
The problem we tackle is to use a neural network to learn how to play the card game blackjack. Blackjack is a mathematically-solved game in the sense that, for any given game state, it’s possible to compute the statistically best next move. As such, our goal is not to innovate novel blackjack strategy, but rather to use the game as a base to gain theoretical insights into the power of supervised learning, even on problems which are not traditionally suited to a supervised learning approach.  

## Methodology

In order to make this possible we use a simplified version of blackjack: as in the standard game, both player and dealer are dealt two cards from a single shuffled deck, with one of the dealer’s cards face up. In the standard game, players can then “hit” (request additional cards) as many times as desired with the goal of getting as close to a hand of 21 without exceeding it (“busting”, an instant loss). We simplify by only allowing players to either hit once or not at all, reducing the game to a true classification problem: either hitting or not. We also reduce the game to a single player (whose decisions our learning algorithm will control) and a dealer.  


## Implementation

We used 26 input features representing the number of each card face showing in the players hand and the dealers hand. The label for a given card configuration was assigned based on what the player would have chosen to do with perfect knowledge of the deck. There are some edge cases where the player was guaranteed to win or lose whether they chose to hit or not, and for these the label is effectively random, but otherwise the labels are a faithful representation of the “correct” move.  

## Results

We found that the best performing model was that which has 2 hidden layers comprised of 2 and 8 units respectively. These hyper parameters created a model with the following performance statics:

Classification Accuracy = 0.7019  
Precision = 0.6996  
Recall = 0.8036  
F1 = 0.7480  

The model also had the following ROC curve:
![ROC Curve](/results/images/roc_curve.png?raw=true)

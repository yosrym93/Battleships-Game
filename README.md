# Battleships

Battleships multiplayer game written in 8086 assembly.
The game is played over a serial connection between two PCs and using DOSBOX (an Ethernet cable can be used).

The game features 2 modes, a playing mode and a chat mode. The chat mode allows both players to exclusively chat (instant messaging). The playing mode allows for playing the game and chatting at the same time (with less chat capabilities).

The game starts with both players placing there ships (10 ships of different sizes) on a grid. The grid size is 10x10 for the first level of the game and 20x20 for the second level. Afterwards, both players take turns attacking the other player's ships, blindly.  A ship is destroyed if all its cells were attacked. The first player to destroy all the other player's ships wins. The game features 3 power ups that can be used before attacking (once each):
1- Attack Twice.
2- Destroy a random ship (completely random, it can be yours).
3- Reverse the other player's next attack (experimental).

Let the battle begin !

# Reversi-game
Reversi is a strategy board game for two players, played on an 8×8 uncheckered board. There are sixty-four identical game pieces called disks (often spelled "discs"), which are light on one side and dark on the other. Players take turns placing disks on the board with their assigned color facing up. During a play, any disks of the opponent's color that are in a straight line and bounded by the disk just placed and another disk of the current player's color are turned over to the current player's color.  The object of the game is to have the majority of disks turned to display your color when the last playable empty square is filled.

This game is a two player game 

Run the code by typing - 
                         
                         javac Game.java

                         java Game
                         
Each player inputs his turn as follows- 

If he wants to place a black disc at a position in the grid then he types 32b in the terminal for placing black disc at the 3rd row and 2nd column, such that the rows and columuns start form 0.                         


I have also implimented this game on ARMSim using ARM Architecture Machine Language and its description is as follows-

ARMSim simulator has a plug-in called “Embest Board Plug-in” which simulates a particular ARM processor board. It provides the following virtual input/output devices.
1. One 8-segment display (output). 
2. Two red LED lights (output).
3. Two black buttons (input).
4. Sixteen blue buttons arranged in a keyboard 4 x 4 grid (input).
5. One LCD display screen, which is a grid of 40 columns by 15 rows.

Each player in his turn clicks on the Blue keyboard for three times where the first two clicks are for the position where the player wants to place his disc and the third for the color of his disc (Black -> 1 and White -> 0).

The file to be executed is -  Game.s

All the other .s files are functions used in Game.s

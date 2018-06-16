This repository maintains the baseline and baseline with 1 vritual channel credit-based routers from Bonfire project. You can find the Bonfire project here:

https://github.com/Project-Bonfire/Bonfire

----------
- The size of the network can be X.Y where X and Y are integers in [2, 127].
- Each version (baseline and VC) has Network interface support (you can enable it with -NI paramiter)
----------

License:  	GNU GENERAL PUBLIC LICENSE Version 3

----------
People involved in this project:
- Siavoosh Payandeh Azad
- Behrad Niazmand
- Karl Janson


# FI Generation:

All parameters needed for FI generation can be found in scripts/include/package.py file.

To run the generation, run the following command. Modelsim environment might be required (not tested without it..):

python simulate.py -D 4 -credit_based_FC -FC -FI -Rand 0.1 -PS 8 8 -sim 100000 -end 110000

#!/usr/bin/python

import sys,combinations

#TODO: prendere l'elenco di numeri e del numero da confrontare da un csv
elements_list = [1,2,3];
matching_number = 0;
elements_total = len(elements_list)+1;
for current_goup in list(range(1, elements_total)):
    combinations.getAllCombination(elements_list, [], current_goup, 0, matching_number);

sys.exit(1);

#!/usr/bin/python

def execFunctionWithCombination(elementsList, combinationRetrieved, numberToCompare):
    """
    Funzione per eseguire delle funzioni specifiche sulla combinazione trovata
    combinationRetrieved: combination retrieved (es [1,1,2]) (default [])
    functionToExec: function to exec up this combination retrieved (es closure
    with print statement) (default print closure)
    return 1 on success
    """

    if(not elementsList or not combinationRetrieved):
        return 0;

    total = 0;
    matchElements = [];
    for key in combinationRetrieved:
        total += elementsList[key];
        matchElements.append(elementsList[key]);

    if(total == numberToCompare):
        print("questi elementi sommati: "+str(combinationRetrieved)+" ("+str(matchElements)+") matchano con il valore: "+str(numberToCompare));
        #TODO: scrivere il risultato in un file (ogni riga va appesa al file)

    return 1;

def getAllCombination(elementsList = [], combElements = [], group = 1, level = 0, numberToCompare = 0):
    """
    elementsList: an element list ([1,2,3,4,5,6]) (default empty [])
    combElements: combination of previous cycle (default empty [])
    group: number of elements in every combination (default: 1 es 2 -> [1,2] [1,1])
    level: nesting level (default: 0)
    Trovo tutti i possibili raggruppamenti in elementsList di group elementi
    es. elementsList = [1,2,3]
    group = 2
    result = [1,1] [1,2] [1,3] [2,1] [2,2] [2,3] [3,1] [3,2] [3,3]
    return 1 on success
    """

    #init della lista di possibili combinazioni
    if(not elementsList):
        return 0;

    #per prova ipotizzo che i gruppi siano 2, ora per test
    for k,v in enumerate(elementsList):

        #al numero corrente appendo la serie dei livelli precedenti
        combElements.append(k);

        if(level == (group-1)):
            #livello piu' basso, qui ho trovato una possibile combinazione
            #la stampo e brecko il ciclo
            #print("combinazione trovata: "+str(combElements));
            execFunctionWithCombination(elementsList, combElements, numberToCompare);
        else:
            #richiamo la funzione passandogli i raggruppamenti ottenuti
            getAllCombination(elementsList, combElements, group, level+1, numberToCompare);

        #levo l'ultimo elemento dalla lista di combinazioni per riottenere le
        #combinazioni del ciclo precedente

        combElements.pop();

    return 1;

print("Combinations init...\n");

#TODO: prendere l'elenco di numeri e del numero da confrontare da un csv

#TODO: ottimizzazione, provo a sommare le combinazioni correnti per ogni
#ciclo, se sono maggiori del numero cercato esco e procedo con la prossima
#combinazione

<?php
// Un semplice paniere che contiene una lista di prodotti aggiunti
// e la quantità di ciascun prodotto. Include un metodo che
// calcola il prezzo totale degli articoli nel paniere utilizzando
// una chiusura come callback.
class Cart{

	const PRICE_BUTTER  = 2.00;
	const PRICE_MILK    = 3.00;
	const PRICE_EGGS    = 6.95;

	protected $products = array();
    
	public function add($product, $quantity){

		$this->products[$product] = $quantity;
	}

	public function getQuantity($product){

		return isset($this->products[$product]) ? $this->products[$product] : FALSE;
	}

	public function getTotal($tax){

		$total = 0.00;

		$callback =
			function ($quantity, $product) use ($tax, &$total){

				$pricePerItem = constant(__CLASS__."::PRICE_".strtoupper($product));
				$total += ($pricePerItem * $quantity) * ($tax + 1.0);
			};

		array_walk($this->products, $callback);
		return round($total, 2);
	}
}

$my_cart = new Cart;

// Aggiunta di un elemento nel paniere
$my_cart->add('butter', 1);
$my_cart->add('milk', 3);
$my_cart->add('eggs', 6);

// Stampa del totale con una tassa aggiuntiva del 5%.
echo "The result is ".$my_cart->getTotal(0.05) . "\n";
// The result is 54.29

/*class Paniere{

	var $val1;
	var $val2;
	var $val3;
	var $total;

	public function Paniere(){

		$this->total = 0;
	}

	public function calculateTotalWithAllNumbers($numberToAdd, $fuckingCallback){

		#$total = $numberToAdd;


		#$fuckingCallback($this->val1);
		#$fuckingCallback($this->val2);
		return $fuckingCallback($numberToAdd);
	}
}

$mioPaniere = new Paniere;

$callback = function($currentNumber) use (&$total){

	$total += $currentNumber;
};

$mioPaniere->val1 = 3;
$mioPaniere->val2 = 4;
$mioPaniere->val3 = 5;

$mioPaniere->calculateTotalWithAllNumbers(1, $callback);
echo "tot: ".$mioPaniere->total;*/
/*
// definizione dell'array
$allenatori_inter = array('mancini', 'mourinho', 'benitez' , 'leonardo', 'gasperini', 'ranieri');
 
// applicazione del callback agli elementi dell'array
$allenatori_inter = array_map(function($valore){
// conversione delle stringhe in array
$caratteri = str_split($valore);
// conteggio dei caratteri
$conteggio  = array_count_values($caratteri);
// valore di ritorno
#echo "cont: ".print_r($conteggio, true);
return $conteggio;
}, $allenatori_inter);

// somma dei caratteri presenti nei valori dell’array
$allenatori_inter = array_reduce($allenatori_inter, function($valore_singolo, $valore) {
    // ciclo d'iterazione delle sommatorie
    foreach ($valore as $carattere => $addendo) {
    // controllo sui valori non definiti
        if (!isset($valore_singolo[$carattere])) {
            $valore_singolo[$carattere] = 0;
        }
    // creazione dell'array contenente i risultati
        $valore_singolo[$carattere] += $addendo;
    }
// valore di ritorno
    return $valore_singolo;
});

// ordinamento dei valori in ordine decrescente
arsort($allenatori_inter);
// stampa del contenuto
foreach($allenatori_inter as $lettera=>$somma)
{
echo $lettera . " " . $somma."<br />\n";
}*/
?>

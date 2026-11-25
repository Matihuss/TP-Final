!classDefinition: #Comedor category: #'TP - Comedor'!
Object
	subclass: #Comedor
	instanceVariableNames: 'stock stockDeMenuesEstudiantiles stockDeMenuesDelDia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP - Comedor'!

!Comedor methodsFor: 'accessing' stamp: 'V 24/Nov/2026, 1:42:33 am (UTC)'!
estadoDeAperturaDelDia: unDia hora: unaHora
	^((self diasDeApertura includes: unDia)
	and: [self horaDeApertura <= unaHora and: [unaHora < self horaDeCierre]])
		ifTrue: [#abierto]
		ifFalse: [#cerrado]! !

!Comedor methodsFor: 'accessing' stamp: 'MEHR 25/Nov/2026, 2:49:32 am (UTC)'!
reponerStockDeMenuesEstudiantiles: unaCantidad
	stockDeMenuesEstudiantiles := stockDeMenuesEstudiantiles + unaCantidad! !

!Comedor methodsFor: 'accessing' stamp: 'MEHR 25/Nov/2026, 2:33:26 am (UTC)'!
stockDeMenuesDelDia

	^stockDeMenuesDelDia! !

!Comedor methodsFor: 'accessing' stamp: 'MEHR 25/Nov/2026, 2:34:13 am (UTC)'!
stockDeMenuesEstudiantiles
	
	^stockDeMenuesEstudiantiles! !


!Comedor methodsFor: 'private' stamp: 'MEHR 23/Nov/2026, 9:36:03 pm (UTC)'!
diasDeApertura
	^#(#lunes #martes #miercoles #jueves #viernes)! !

!Comedor methodsFor: 'private' stamp: 'MEHR 23/Nov/2026, 9:19:45 pm (UTC)'!
horaDeApertura
	^8! !

!Comedor methodsFor: 'private' stamp: 'MEHR 23/Nov/2026, 9:19:53 pm (UTC)'!
horaDeCierre
	^20! !


!Comedor methodsFor: 'as yet unclassified' stamp: 'V 24/Nov/2026, 9:07:18 pm (UTC)'!
registrarLegajo: unLegajo 
	^ Tarjeta new legajo: unLegajo saldo: 0 * peso! !


!Comedor methodsFor: 'initialization' stamp: 'MEHR 25/Nov/2026, 2:20:02 am (UTC)'!
initialize
	stockDeMenuesEstudiantiles := 3.
	stockDeMenuesDelDia := 4! !


!classDefinition: #MenuDelDia category: #'TP - Comedor'!
Object
	subclass: #MenuDelDia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP - Comedor'!

!MenuDelDia methodsFor: 'accessing' stamp: 'MEHR 23/Nov/2026, 10:12:01 pm (UTC)'!
precio
	^3600 * peso.! !

!MenuDelDia methodsFor: 'accessing' stamp: 'MEHR 25/Nov/2026, 3:48:40 am (UTC)'!
precioParaPersonal
	^self precio * (80/100)! !


!classDefinition: #MenuEstudiantil category: #'TP - Comedor'!
Object
	subclass: #MenuEstudiantil
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP - Comedor'!

!MenuEstudiantil methodsFor: 'accessing' stamp: 'MEHR 23/Nov/2026, 10:08:50 pm (UTC)'!
precio
	^3000 * peso! !


!classDefinition: #Pedido category: #'TP - Comedor'!
Object
	subclass: #Pedido
	instanceVariableNames: 'productos precio comensal medioDePago precioFinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP - Comedor'!

!Pedido methodsFor: 'initialization' stamp: 'MEHR 25/Nov/2026, 3:45:02 am (UTC)'!
inicializarDe: unComensal pagadoCon: unMedioDePago
	comensal := unComensal.
	medioDePago := unMedioDePago! !

!Pedido methodsFor: 'initialization' stamp: 'MEHR 25/Nov/2026, 3:52:30 am (UTC)'!
initialize
	productos := #().
	precio := 0 * peso.
	precioFinal := 0 * peso! !


!Pedido methodsFor: 'accessing' stamp: 'MEHR 25/Nov/2026, 3:47:58 am (UTC)'!
agregar: unProducto
	productos := productos copyWith: unProducto.
	precio := precio + unProducto precio.
	precioFinal := precioFinal + (comensal precioConTarjetaDe: unProducto)! !

!Pedido methodsFor: 'accessing' stamp: 'MEHR 25/Nov/2026, 3:34:20 am (UTC)'!
precio
	
	^precio! !

!Pedido methodsFor: 'accessing' stamp: 'MEHR 25/Nov/2026, 3:59:04 am (UTC)'!
precioFinal
	
	^precioFinal! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pedido class' category: #'TP - Comedor'!
Pedido class
	instanceVariableNames: ''!

!Pedido class methodsFor: 'instance creation' stamp: 'MEHR 25/Nov/2026, 3:44:42 am (UTC)'!
de: unComensal pagadoCon: unMedioDePago
	^self new inicializarDe: unComensal pagadoCon: unMedioDePago! !


!classDefinition: #Personal category: #'TP - Comedor'!
Object
	subclass: #Personal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP - Comedor'!

!Personal methodsFor: 'accessing' stamp: 'MEHR 25/Nov/2026, 3:48:24 am (UTC)'!
precioConTarjetaDe: unProducto
	^unProducto precioParaPersonal! !


!classDefinition: #ProductoDeGondola category: #'TP - Comedor'!
Object
	subclass: #ProductoDeGondola
	instanceVariableNames: 'precio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP - Comedor'!

!ProductoDeGondola methodsFor: 'as yet unclassified' stamp: 'V 24/Nov/2026, 2:51:24 am (UTC)'!
inicializarConPrecio: unPrecio 
	precio := unPrecio! !

!ProductoDeGondola methodsFor: 'as yet unclassified' stamp: 'V 24/Nov/2026, 2:52:48 am (UTC)'!
precio
	^precio! !


!ProductoDeGondola methodsFor: 'accessing' stamp: 'MEHR 25/Nov/2026, 4:03:03 am (UTC)'!
precioParaPersonal
	^self precio * (80/100)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ProductoDeGondola class' category: #'TP - Comedor'!
ProductoDeGondola class
	instanceVariableNames: ''!

!ProductoDeGondola class methodsFor: 'as yet unclassified' stamp: 'V 24/Nov/2026, 2:47:16 am (UTC)'!
conPrecio: unPrecio
	^ self new inicializarConPrecio: unPrecio! !


!classDefinition: #Tarjeta category: #'TP - Comedor'!
Object
	subclass: #Tarjeta
	instanceVariableNames: 'legajo saldo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP - Comedor'!

!Tarjeta methodsFor: 'as yet unclassified' stamp: 'V 24/Nov/2026, 9:07:59 pm (UTC)'!
legajo: unLegajo saldo: unSaldo 
	legajo := unLegajo.
	saldo := unSaldo! !

!Tarjeta methodsFor: 'as yet unclassified' stamp: 'V 24/Nov/2026, 9:06:19 pm (UTC)'!
saldo
	^ saldo! !


!classDefinition: #ComedorTest category: #'TP - Comedor'!
TestCase
	subclass: #ComedorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP - Comedor'!

!ComedorTest methodsFor: 'tests' stamp: 'MEHR 23/Nov/2026, 8:58:10 pm (UTC)'!
test001_ElComedorUnLunesALas10EstaAbierto

 | unComedor |
unComedor := Comedor new.

 Assert that: (unComedor estadoDeAperturaDelDia: #lunes hora: 10) isEqualTo: #abierto! !

!ComedorTest methodsFor: 'tests' stamp: 'MEHR 23/Nov/2026, 9:06:06 pm (UTC)'!
test002_ElComedorUnLunesALas7EstaCerrado

 | unComedor |
unComedor := Comedor new.

 Assert that: (unComedor estadoDeAperturaDelDia: #lunes hora: 7) isEqualTo: #cerrado! !

!ComedorTest methodsFor: 'tests' stamp: 'MEHR 23/Nov/2026, 9:36:36 pm (UTC)'!
test003_ElComedorUnSabadoALas12EstaCerrado

 | unComedor |
unComedor := Comedor new.

 Assert that: (unComedor estadoDeAperturaDelDia: #sabado hora: 12) isEqualTo: #cerrado! !

!ComedorTest methodsFor: 'tests' stamp: 'MEHR 23/Nov/2026, 10:08:25 pm (UTC)'!
test004_ElMenuEstudiantilVale3000

 | unMenuEstudiantil |

 unMenuEstudiantil := MenuEstudiantil new.

Assert that: unMenuEstudiantil precio isEqualTo: 3000 * peso! !

!ComedorTest methodsFor: 'tests' stamp: 'MEHR 23/Nov/2026, 10:09:45 pm (UTC)'!
test005_ElMenuDelDiaVale3600

 | unMenuDelDia |

 unMenuDelDia := MenuDelDia new.

Assert that: unMenuDelDia precio isEqualTo: 3600 * peso! !

!ComedorTest methodsFor: 'tests' stamp: 'V 24/Nov/2026, 2:55:37 am (UTC)'!
test006_ElPrecioDeUnProductoDeGondola_DependeDelProducto

 | alfajorDeGondola bizcochosSalados unaGaseosa |

alfajorDeGondola := ProductoDeGondola conPrecio: 1000 * peso.
bizcochosSalados := ProductoDeGondola conPrecio: 1200 * peso.
unaGaseosa := ProductoDeGondola conPrecio: 1500 * peso.

Assert that: alfajorDeGondola precio isEqualTo: 1000 * peso.
Assert that: bizcochosSalados precio isEqualTo: 1200 * peso.
Assert that: unaGaseosa precio isEqualTo: 1500 * peso! !

!ComedorTest methodsFor: 'tests' stamp: 'V 24/Nov/2026, 8:58:55 pm (UTC)'!
test007_ElSaldoDeLaTarjetaAlRegistrarseEsDe0Pesos
 
 | unComedor unaTarjeta |
unComedor := Comedor new.

 unaTarjeta := unComedor registrarLegajo: 100. 
 
  Assert that: unaTarjeta saldo isEqualTo: 0 * peso.! !

!ComedorTest methodsFor: 'tests' stamp: 'MEHR 25/Nov/2026, 2:33:44 am (UTC)'!
test008_ElComedorComienzaConUnStockDe3MenuesEstudiantiles

 | unComedor |
unComedor := Comedor new.

 Assert that: unComedor stockDeMenuesEstudiantiles isEqualTo: 3! !

!ComedorTest methodsFor: 'tests' stamp: 'MEHR 25/Nov/2026, 2:32:32 am (UTC)'!
test009_ElComedorComienzaConUnStockDe4MenuesDelDia

  | unComedor |
unComedor := Comedor new.

 Assert that: unComedor stockDeMenuesDelDia isEqualTo: 4! !

!ComedorTest methodsFor: 'tests' stamp: 'MEHR 25/Nov/2026, 2:47:00 am (UTC)'!
test010_ElComedorReponeElStockDeMenuesEstudiantiles

	| unComedor |

	unComedor := Comedor new.

	unComedor reponerStockDeMenuesEstudiantiles: 5.

	Assert that: unComedor stockDeMenuesEstudiantiles isEqualTo: 8! !

!ComedorTest methodsFor: 'tests' stamp: 'MEHR 25/Nov/2026, 4:02:24 am (UTC)'!
test011_ElPrecioDeUnPedidoEsLaSumaDeLosPreciosDeSusProductos

	| unComedor unaTarjeta unPedido |

	unComedor := Comedor new.
	unaTarjeta := unComedor registrarLegajo: 100.

	unPedido := Pedido de: Personal new pagadoCon: unaTarjeta.
	unPedido agregar: MenuDelDia new.
	unPedido agregar: (ProductoDeGondola conPrecio: 1000 * peso).

	Assert that: unPedido precio isEqualTo: 4600 * peso! !

!ComedorTest methodsFor: 'tests' stamp: 'MEHR 25/Nov/2026, 3:44:02 am (UTC)'!
test012_UnPersonalPagaElMenuDelDiaConTarjetaConUn20PorCientoDeDescuento

	| unComedor unaTarjeta unPedido |

	unComedor := Comedor new.
	unaTarjeta := unComedor registrarLegajo: 100.

	unPedido := Pedido de: Personal new pagadoCon: unaTarjeta.
	unPedido agregar: MenuDelDia new.

	Assert that: unPedido precioFinal isEqualTo: 2880 * peso! !

!classDefinition: #Comedor category: #'TP - Comedor'!
Object
	subclass: #Comedor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP - Comedor'!

!Comedor methodsFor: 'accessing' stamp: 'MEHR 23/Nov/2026, 9:18:06 pm (UTC)'!
estadoDeAperturaDelDia: unDia hora: unaHora
	^((self diasDeApertura includes: unDia)
	and: [unaHora >= self horaDeApertura and: [unaHora < self horaDeCierre]])
		ifTrue: [#abierto]
		ifFalse: [#cerrado]! !


!Comedor methodsFor: 'private' stamp: 'MEHR 23/Nov/2026, 9:36:03 pm (UTC)'!
diasDeApertura
	^#(#lunes #martes #miercoles #jueves #viernes)! !

!Comedor methodsFor: 'private' stamp: 'MEHR 23/Nov/2026, 9:19:45 pm (UTC)'!
horaDeApertura
	^8! !

!Comedor methodsFor: 'private' stamp: 'MEHR 23/Nov/2026, 9:19:53 pm (UTC)'!
horaDeCierre
	^20! !


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


!classDefinition: #ProductoDeGondola category: #'TP - Comedor'!
Object
	subclass: #ProductoDeGondola
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP - Comedor'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ProductoDeGondola class' category: #'TP - Comedor'!
ProductoDeGondola class
	instanceVariableNames: 'precio'!

!ProductoDeGondola class methodsFor: 'as yet unclassified' stamp: 'MEHR 23/Nov/2026, 10:25:21 pm (UTC)'!
conPrecio: unPrecio
	precio := unPrecio.! !

!ProductoDeGondola class methodsFor: 'as yet unclassified' stamp: 'MEHR 23/Nov/2026, 10:25:58 pm (UTC)'!
precio
	^precio! !


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

!ComedorTest methodsFor: 'tests' stamp: 'MEHR 23/Nov/2026, 10:24:32 pm (UTC)'!
test006_ElPrecioDeUnProductoDeGondola_DependeDelProducto

 | alfajorDeGondola |

 alfajorDeGondola := ProductoDeGondola conPrecio: 1000 * peso.

Assert that: alfajorDeGondola precio isEqualTo: 1000 * peso! !

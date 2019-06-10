esCandidatoDel(frank, rojo).
esCandidatoDel(claire,rojo).
esCandidatoDel(garret,azul).
esCandidatoDel(jackie, amarillo).
esCandidatoDel(linda, azul).
esCandidatoDel(catherine,rojo).
esCandidatoDel(seth, amarillo).
esCandidatoDel(hester, amarillo).

edad(frank,50).
edad(claire, 52).
edad(gareth,64).
edad(peter,26).
edad(jackie, 38).
edad(linda, 30).
edad(catherine, 59).
edad(heather, EdadHeather):-
	EdadHeather is (2019 - 1969).


sePostulaEn(azul, buenosAires).
sePostulaEn(azul, chaco).
sePostulaEn(azul, tierraDelFuego).
sePostulaEn(azul, sanLuis).
sePostulaEn(azul, neuquen).
sePostulaEn(rojo, buenosAires).
sePostulaEn(rojo, cordoba).
sePostulaEn(rojo, chubut).
sePostulaEn(rojo, tierraDelFuego).
sePostulaEn(rojo, sanLuis).
sePostulaEn(amarillo, chaco).
sePostulaEn(amarillo, formosa).
sePostulaEn(amarillo, tucuman).
sePostulaEn(amarillo, salta).
sePostulaEn(amarillo, santaCruz).
sePostulaEn(amarillo, laPampa).
sePostulaEn(amarillo, corrientes).
sePostulaEn(amarillo, misiones).
sePostulaEn(amarillo, buenosAires).


habitantes(buenosAires, 15355000).
habitantes(chaco, 1143201).
habitantes(tierraDelFuego, 160720).
habitantes(sanLuis, 489255).
habitantes(neuquen, 637913).
habitantes(santaFe, 3397532).
habitantes(cordoba, 3567654).
habitantes(chubut, 577466).
habitantes(formosa, 527895).
habitantes(tucuman, 1687305).
habitantes(salta, 1333365).
habitantes(santaCruz, 279964).
habitantes(laPampa, 349299).
habitantes(corrientes, 992595).
habitantes(misiones, 1189446).

% intencionDeVotoEn(Provincia, Partido, Porcentaje)
intencionDeVotoEn(buenosAires, rojo, 40).
intencionDeVotoEn(buenosAires, azul, 30).
intencionDeVotoEn(buenosAires, amarillo, 30).
intencionDeVotoEn(chaco, rojo, 50).
intencionDeVotoEn(chaco, azul, 20).
intencionDeVotoEn(chaco, amarillo, 0).
intencionDeVotoEn(tierraDelFuego, rojo, 40).
intencionDeVotoEn(tierraDelFuego, azul, 20).
intencionDeVotoEn(tierraDelFuego, amarillo, 10).
intencionDeVotoEn(sanLuis, rojo, 50).
intencionDeVotoEn(sanLuis, azul, 20).
intencionDeVotoEn(sanLuis, amarillo, 0).
intencionDeVotoEn(neuquen, rojo, 80).
intencionDeVotoEn(neuquen, azul, 10).
intencionDeVotoEn(neuquen, amarillo, 0).
intencionDeVotoEn(santaFe, rojo, 20).
intencionDeVotoEn(santaFe, azul, 40).
intencionDeVotoEn(santaFe, amarillo, 40).
intencionDeVotoEn(cordoba, rojo, 10).
intencionDeVotoEn(cordoba, azul, 60).
intencionDeVotoEn(cordoba, amarillo, 20).
intencionDeVotoEn(chubut, rojo, 15).
intencionDeVotoEn(chubut, azul, 15).
intencionDeVotoEn(chubut, amarillo, 15).
intencionDeVotoEn(formosa, rojo, 0).
intencionDeVotoEn(formosa, azul, 0).
intencionDeVotoEn(formosa, amarillo, 0).
intencionDeVotoEn(tucuman, rojo, 40).
intencionDeVotoEn(tucuman, azul, 40).
intencionDeVotoEn(tucuman, amarillo, 20).
intencionDeVotoEn(salta, rojo, 30).
intencionDeVotoEn(salta, azul, 60).
intencionDeVotoEn(salta, amarillo, 10).
intencionDeVotoEn(santaCruz, rojo, 10).
intencionDeVotoEn(santaCruz, azul, 20).
intencionDeVotoEn(santaCruz, amarillo, 30).
intencionDeVotoEn(laPampa, rojo, 25).
intencionDeVotoEn(laPampa, azul, 25).
intencionDeVotoEn(laPampa, amarillo, 40).
intencionDeVotoEn(corrientes, rojo, 30).
intencionDeVotoEn(corrientes, azul, 30).
intencionDeVotoEn(corrientes, amarillo, 10).
intencionDeVotoEn(misiones, rojo, 90).
intencionDeVotoEn(misiones, azul, 0).
intencionDeVotoEn(misiones, amarillo, 0).

% PUNTO 2 PROVINCIA PICANTE

masDe1Candidato(Provincia):-
  sePostulaEn(Candidato,Provincia),
  sePostulaEn(Candidato2,Provincia),
  Candidato \= Candidato2.


masDeUnMillonDeHabitantes(Provincia):-
  habitantes(Provincia, CantHabitantes),
  CantHabitantes > 1000000.

esPicante(Provincia):-
  masDeUnMillonDeHabitantes(Provincia),
  masDe1Candidato(Provincia).


% PUNTO 3 PASO

compiteEnProvincia(UnCandidato, UnaProvincia):-
	esCandidatoDel(UnCandidato, UnPartido),
	sePostulaEn(UnPartido, UnaProvincia).

tieneMasVotos(Candidato1, Candidato2,UnaProvincia):-
  esCandidatoDel(Candidato1,Partido1),
  esCandidatoDel(Candidato2,Partido2),
  intencionDeVotoEn(UnaProvincia,Partido1,Porcentaje1),
  intencionDeVotoEn(UnaProvincia,Partido2,Porcentaje2),
  Porcentaje1 > Porcentaje2.

leGanaA(Candidato1, Candidato2, UnaProvincia):-
	compiteEnProvincia(Candidato1, UnaProvincia),
	compiteEnProvincia(Candidato2, UnaProvincia),
	tieneMasVotos(Candidato1,Candidato2,UnaProvincia).

leGanaA(Candidato1,Candidato2,UnaProvincia):-
  esCandidatoDel(Candidato1,UnPartido),
  esCandidatoDel(Candidato2,UnPartido),
  compiteEnProvincia(Candidato1,UnaProvincia).

leGanaA(Candidato1,Candidato2,UnaProvincia):-
  compiteEnProvincia(Candidato1,UnaProvincia).


% PUNTO 4 EL GRAN CANDIDATO

esMasJovenQue(UnCandidato,OtroCandidato):-
    edad(UnCandidato,Edad1),
    edad(OtroCandidato,Edad2),
    Edad2 >= Edad1.

candidatoMasJovenDelPartido(UnCandidato):-
	esCandidatoDel(UnCandidato,UnPartido),
	forall(esCandidatoDel(OtroCandidato,UnPartido), esMasJovenQue(UnCandidato,OtroCandidato)).

elGranCandidato(UnCandidato):-
    forall(compiteEnProvincia(UnCandidato,UnaProvincia),leGanaA(UnCandidato,_,UnaProvincia)),
    candidatoMasJovenDelPartido(UnCandidato).

% podemos asegurarnos de esto usando la consulta existencia elGranCandidato(UnCandidato). Se relaciona con el concepto de inversibilidad. 


% PUNTO 5 MALAS CONSULTORAS

ganaElPartidoEnLaProvincia(UnPartido,UnaProvincia):-
  esCandidatoDel(UnCandidato,UnPartido),
  forall(esCandidatoDel(UnCandidato,UnPartido),leGanaA(UnCandidato,OtroCandidato,UnaProvincia)).

ajusteConsultora(UnPartido,UnaProvincia,VerdaderoPorcentajeDeVotos):-
  ganaElPartidoEnLaProvincia(UnPartido,UnaProvincia),
  intencionDeVotoEn(UnaProvincia,UnPartido,PorcentajeDeVotos),
  VerdaderoPorcentajeDeVotos is PorcentajeDeVotos - 20.

ajusteConsultora(UnPartido,UnaProvincia,VerdaderoPorcentajeDeVotos):-
  not(ganaElPartidoEnLaProvincia(UnPartido,UnaProvincia)),
  intencionDeVotoEn(UnaProvincia,UnPartido,PorcentajeDeVotos),
  VerdaderoPorcentajeDeVotos is PorcentajeDeVotos + 5.

% PUNTO 6 PROMESAS DE CAMPAÑAS

% inflacion(cotaInferior, cotaSuperior)
% construir(listaDeObras)
% nuevosPuestosDeTrabajo(cantidad)

promete(azul, edilicio(hospital, 1000)).
promete(azul, edilicio(jardin, 100)).
promete(azul, edilicio(escuela, 5)).
promete(amarillo, edilicio(hospital, 100)).
promete(amarillo, edilicio(universidad, 1)).
promete(amarillo, edilicio(comisaria, 200)).
promete(rojo, nuevosPuestosDeTrabajo(800000)).
promete(amarillo, nuevosPuestosDeTrabajo(10000)).
promete(azul, inflacion(2,4)).
promete(amarillo, inflacion(1,15)).
promete(rojo, inflacion(10,30)).


% PUNTO 7 AJUSTES DE BOCA DE URNA

influenciaDePromesas(inflacion(CotaInferior,CotaSuperior), Variacion):-
  Variacion is (-(CotaSuperior + CotaInferior)/2).

influenciaDePromesas(nuevosPuestosDeTrabajo(CantidadDePuestos), Variacion):-
  CantidadDePuestos > 50000,
  Variacion is (3).
influenciaDePromesas(nuevosPuestosDeTrabajo(CantidadDePuestos), Variacion):-
  CantidadDePuestos < 50001,
  Variacion is (0).

influenciaDePromesas(edilicio(hospital,_), Variacion):-
  Variacion is (2).

influenciaDePromesas(edilicio(jardin,Cantidad), Variacion):-
  Variacion is (Cantidad * 0.1).

influenciaDePromesas(edilicio(escuela,Cantidad), Variacion):-
  Variacion is (Cantidad * 0.1).

influenciaDePromesas(edilicio(universidad,_), Variacion):-
  Variacion is (0).

influenciaDePromesas(edilicio(,), Variacion):-
  Variacion is (0).

% PUNTO 8 NUEVOS VOTOS

crecimientos(UnPartido, UnCrecimiento):-
  promete(UnPartido, UnaPromesa),
  influenciaDePromesas(UnaPromesa, Variacion),
  UnCrecimiento is (Variacion).

 promedioDeCrecimiento(UnPartido, Sumatoria):-
  findall(UnCrecimiento, crecimientos(UnPartido, UnCrecimiento), Crecimientos),
  sumlist(Crecimientos, Total),
  Sumatoria is Total.

  %no queda claro en la consigna si es el promedio o la sumatoria
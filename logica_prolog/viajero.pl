
% ============================
% Archivo principal: VIAJERO.PL
% ============================

% Cargar todas las bases de conocimiento divididas por ciudad
:- consult('base_conocimiento_madrid.pl').
:- consult('base_conocimiento_barcelona.pl').
:- consult('base_conocimiento_valencia.pl').
:- consult('base_conocimiento_sevilla.pl').
:- consult('base_conocimiento_bilbao.pl').

% Cargar los predicados de rutas
:- consult('predicados_rutas.pl').

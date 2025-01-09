SELECT * FROM databaseobesity.obesitydataset;
select distinct NObeyesdad from databaseobesity.obesitydataset;
select count(distinct NObeyesdad) from databaseobesity.obesitydataset;
select distinct CALC from databaseobesity.obesitydataset;
select distinct CAEC from databaseobesity.obesitydataset;
select distinct MTRANS from databaseobesity.obesitydataset;
-- 0000000000000000000000000000000000000000000000000000000000000000000000
-- Sélectionnez les niveaux d'obésité et le nombre de participants dans chaque niveau.
-- select
select NObeyesdad, count(*) as nbr_participants
from databaseobesity.obesitydataset
group by NObeyesdad;
-- Sélectionnez les niveaux d'obésité pour les participants de plus de 30 ans.
select NObeyesdad, count(*) as nbr_participants
from databaseobesity.obesitydataset
where Age > 30
group by NObeyesdad;
-- Sélectionnez les niveaux d'obésité pour les participants qui mangent fréquemment des aliments caloriques élevés.
select distinct FAVC from  databaseobesity.obesitydataset;
select NObeyesdad, count(*) as nbr_participants
from databaseobesity.obesitydataset
where FAVC = 'no'
group by NObeyesdad;
-- Sélectionnez les niveaux d'obésité pour les participants qui ne fument pas et qui mangent fréquemment des légumes.
select distinct SMOKE from databaseobesity.obesitydataset;
select distinct FCVC from databaseobesity.obesitydataset;
select NObeyesdad,  count(*) as nbr_participants
from databaseobesity.obesitydataset
where SMOKE = 'no'
and FCVC = 3
group by NObeyesdad;
-- Sélectionnez l'âge moyen des participants en fonction de leur niveau d'obésité
select avg(Age), NObeyesdad
from databaseobesity.obesitydataset
group by NObeyesdad;
-- Sélectionnez les niveaux d'obésité pour les participants qui boivent plus de 2 litres d'eau par jour.
select distinct CH2O from databaseobesity.obesitydataset;
select NObeyesdad,  count(*) as nbr_participants
from databaseobesity.obesitydataset
where CH2O > 2
group by NObeyesdad;
-- Sélectionnez les niveaux d'obésité pour les participants qui ont un historique familial de surpoids et qui ont une activité physique fréquente.
select NObeyesdad, count(*) as nbr_participants
from databaseobesity.obesitydataset
where family_history_with_overweight = 'yes'
and FAF > 2
group by NObeyesdad;

-- Sélectionnez les niveaux d'obésité pour les participants en fonction de leur moyen de transport habituel.
select NObeyesdad, MTRANS
from databaseobesity.obesitydataset
where avg(MTRANS)
group by NObeyesdad;
SELECT population FROM world

  --Introducing the world table of countries--
  WHERE name = 'Germany';

  --Scandinavia--
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

  --Just the right size--
  WHERE area BETWEEN 200000 AND 250000;
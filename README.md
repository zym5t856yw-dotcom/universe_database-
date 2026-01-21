# Universe Database

PostgreSQL relational database modeling galaxies, stars, planets, and moons. Created as part of FreeCodeCamp’s Relational Database certification.

## Files
- `universe.sql` – original dump generated in the FreeCodeCamp Linux environment
- `universe_local.sql` – local-compatible version for Windows/macOS PostgreSQL installs

## Tables
- `galaxy`
- `star`
- `planet`
- `moon`
- `planet_types`

## Setup
- psql -U postgres -f universe_local.sql
- psql -U postgres -d universe


## Example query
SELECT p.name AS planet, s.name AS star
FROM planet p
JOIN star s ON p.star_id = s.star_id;

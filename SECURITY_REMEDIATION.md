# Security configuration

Set DB_PASSWORD and JWT_SECRET in the backend process environment.
JWT_SECRET must be an independent, cryptographically random value of at least 32 bytes.
The application intentionally has no fallback database password or JWT signing secret.

Changing JWT_SECRET invalidates existing login tokens. Users must log in again.
Rotate any database password reused from earlier versions outside GitHub.

Earlier commits can still contain removed credentials. Removing values from the current
branch does not erase Git history, forks, caches, or previously downloaded copies.

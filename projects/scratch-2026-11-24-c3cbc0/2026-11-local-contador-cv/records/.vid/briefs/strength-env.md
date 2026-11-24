## Test environment

The ledger runs ONLY inside Docker: `sh checks/test.sh` → docker compose -f
docker-compose.test.yml. No test process ever receives real credentials.
The harness itself (a headless browser driving `site/index.html`) arrives
with the code skeleton.

External boundaries: none (ARCHITECTURE.md: the page calls no outside service; no seam rows).

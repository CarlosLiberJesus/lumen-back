# Bewhy.org Best Practices Manual

## Project Overview

- **Mission**: Map Portugal’s civic history—citizens, institutions, governments—from 1736 (Monarquia Absoluta) onward.
- **Scope**: Backend kernel first—`instituicoes`, `governos`, `cidadaos`, `instituicao_cargos`, `cidadao_cargos`. No laws/parliament yet.
- **Sources**: Wikipedia (bulk pop-info), Wikidata (bios, images), Diário da República (official truth later).

## Data Model Principles

- **Temporal Core**: One `instituicao` (e.g., "Conselho de Ministros") spawns temporal kids (`instituicao_governo`, `instituicao_presidencial`) per term. `instituicao_cargos` defines roles, tied to jurisdictions, with multiple holders via `cidadao_cargos`.
- **FK Order**: Seed `republicas` first, then `instituicoes`/`governos`/`presidenciais`, then `instituicao_cargos`, finally `cidadao_cargos`.
- **Normalization**: Use `nome_completo` in `cidadaos` for full names; `nome` for short. `sinopse` for summaries.
- **Attachments**: Store images as URLs in `*_anexos.anexo` (e.g., Wikidata `P18`). `anexo_tipos` tags source/format.

## Coding Standards

- **Laravel Way**: Use Eloquent (`firstOrCreate`), commands (`php artisan scrape:xxx`), UUIDs via `Str::uuid()`.
- **Output**: Console logs only (`$this->info("Inserted X")`)—no `Log::` yet.
- **Error Handling**: Basic `try-catch` for Guzzle—keep it light, expand later.

## Naming Conventions

- **Tables**: Portuguese plural (e.g., `cidadaos`, `governos`)—reflects domain.
- **Fields**: CamelCase for Eloquent (e.g., `nomeCompleto`), snake_case in DB (e.g., `nome_completo`).
- **Scrapers**: `Scrape{Entity}` (e.g., `ScrapeRepublicas`, `ScrapeWikidataCitizens`).

## Scraper Guidelines

- **Modular**: One scraper per source—Wikidata (bios), Wikipedia (lists), DR (laws later).
- **Insert Logic**: `firstOrCreate` to avoid dups—manual seeds are dead.
- **Data Flow**: Fetch → Normalize (e.g., dates to `YYYY-MM-DD`) → Insert.
- **Images**: Link to Commons URLs (e.g., `https://commons.wikimedia.org/wiki/File:X.jpg`) in `anexo`.
- **Order**: Respect FKs—e.g., `republicas` before `presidenciais`.

## Test Generations

- Don't delete any previous written test

## Continue Documentation

- `/docs/project_structure.md`
- `/docs/ai_context_guide.md`

# Project Structure Documentation

## Core Directories

### Models

Key models that represent your data entities:

```
app/Models/
├── Cidadao.php              # Citizens
├── Governo.php              # Governments
├── Instituicao.php          # Institutions
├── InstituicaoCargo.php     # Institution positions
├── CidadaoCargo.php         # Citizen positions
├── Republica.php            # Republic periods
├── Anexo.php                # Attachments (images, etc.)
└── AnexoTipo.php            # Attachment types
```

### Controllers

Main controllers handling API requests:

```
app/Http/Controllers/
├── CidadaoController.php
├── GovernoController.php
├── InstituicaoController.php
└── ...
```

### Migrations

Database structure definitions:

```
database/migrations/
├── 2023_01_01_000001_create_republicas_table.php
├── 2023_01_01_000002_create_instituicoes_table.php
├── 2023_01_01_000003_create_governos_table.php
├── 2023_01_01_000004_create_cidadaos_table.php
└── ...
```

### Scrapers

Data collection scripts:

```
app/Console/Commands/
├── ScrapeRepublicas.php
├── ScrapeWikidataCitizens.php
├── ScrapeWikipediaGovernments.php
└── ...
```

## Key Relationships

- **Instituicao → InstituicaoGoverno/InstituicaoPresidencial**: Temporal instances
- **InstituicaoCargo → CidadaoCargo**: Position definitions and holders
- **Cidadao → CidadaoCargo**: Citizens holding positions
- **Anexo → Various Entities**: Attachments linked to different entities

## API Routes

```
routes/api.php
```

Key endpoints:

- `GET /api/cidadaos` - List citizens
- `GET /api/governos` - List governments
- `GET /api/instituicoes` - List institutions
- `GET /api/cidadao-cargos` - List position holders
- ...

## Command Reference

```
# Run scrapers
php artisan scrape:republicas
php artisan scrape:wikidata-citizens
php artisan scrape:wikipedia-governments

# Database operations
php artisan migrate
php artisan db:seed
```

## Database Schema

### Core Tables

- `cidadaos` - Citizens with biographical data
- `governos` - Government periods
- `instituicoes` - Institutions (ministries, etc.)
- `instituicao_cargos` - Positions within institutions
- `cidadao_cargos` - Citizens holding positions
- `republicas` - Republic periods
- `anexos` - Attachments (images, documents)
- `anexo_tipos` - Types of attachments

### Key Fields

- `nome_completo` - Full names
- `nome` - Comum Known Name
- `sinopse` - Summaries
- `data_inicio`/`data_fim` - Start/end dates
- `anexo` - URLs to attachments

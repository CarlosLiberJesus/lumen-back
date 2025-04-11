# AI Context Guide

This document helps you determine which files to include when using AI assistants with this project.

## Priority Files for Context

Include these files first for maximum understanding:

1. **Project Documentation**

   - `best_practices.md`
   - `/docs/project_structure.md`
   - `/docs/ai_context_guide.md`

2. **Core Models** (choose the most relevant to your current task)

   - `/app/Models/Cidadao.php`
   - `/app/Models/Governo.php`
   - `/app/Models/Instituicao.php`
   - `/app/Models/InstituicaoCargo.php`
   - `/app/Models/CidadaoCargo.php`

3. **Key Migrations** (for understanding the database schema)

   - The earliest migrations that create your core tables

4. **Current Working Files**
   - Any files you're actively working on or discussing

## Context Selection Strategy

When working with AI assistants:

1. **Task-Focused Selection**: Include files directly related to your current task
2. **Minimal but Sufficient**: Don't include the entire codebase - focus on what's relevant
3. **Include Documentation**: Always include the documentation files for context
4. **Recent Changes**: Include files you've recently modified

## Example Context Selections

### For Scraper Development

- `/docs/best_practices.md`
- `/docs/project_structure.md`
- `/app/Console/Commands/ScrapeWikidataCitizens.php` (or similar existing scraper)
- `/app/Models/Cidadao.php` (or relevant model)

### For API Development

- `best_practices.md`
- `/docs/project_structure.md`
- `/app/Http/Controllers/CidadaoController.php` (or relevant controller)
- `/routes/api.php`
- `/app/Models/Cidadao.php` (or relevant model)

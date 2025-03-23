# Bewhy.org Visualization Workflow

## Database Schema

- **Primary Tool**: dbdiagram.io
- **URL**: https://dbdiagram.io/d/LUMEN_DATABASE-67deb65875d75cc84411607d
- **Update Process**:
  1. Run `mysqldump -d -u username -p lumen_db > dump.sql` to update schema
  2. Import to dbdiagram.io when schema changes
  3. Export PNG version to `/docs/schema.png` for documentation

## System Architecture

- **Primary Tool**: draw.io/diagrams.net
- **Files Location**: `/docs/diagrams/`
- **Key Diagrams**:
  1. `data_flow.drawio` - Scraper → DB → API flow
  2. `entity_hierarchy.drawio` - República → Presidências → Governos → etc.
  3. `temporal_model.drawio` - How institutions spawn temporal children

## Relationship Visualizations

- **Tool**: Obsidian for knowledge graphs
- **Process**:
  1. Create notes for key entities
  2. Link relationships between them
  3. Use graph view to identify patterns/gaps

## Integration with Development

- Add screenshots of current diagrams to README.md
- Update diagrams when making significant model changes
- Reference diagram sections in code comments for complex relationships

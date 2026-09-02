# Adventure Works | Analytics Engineering

Projeto de Analytics Engineering desenvolvido utilizando a base **Adventure Works**, com foco na construção de um pipeline analítico estruturado, testado e documentado.

O projeto transforma dados transacionais em um modelo dimensional preparado para análise de vendas e consumo em ferramentas de Business Intelligence.

---

#  Objetivo do Projeto

O objetivo deste projeto é construir uma solução completa de Analytics Engineering capaz de transformar os dados transacionais da Adventure Works em um modelo analítico confiável.

A solução foi desenvolvida utilizando:

- Databricks
- dbt
- SQL
- GitHub
- Power BI

O projeto contempla:

- Organização dos dados em camadas
- Modelagem dimensional
- Construção de dimensões e fatos
- Testes de qualidade dos dados
- Testes de integridade referencial
- Documentação dos modelos
- Validação de métricas de negócio
- Dashboard analítico

---

# Arquitetura do Projeto

A arquitetura foi organizada seguindo uma abordagem em camadas:

```text
                    ┌─────────────────────┐
                    │       SOURCES       │
                    │   Adventure Works   │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │       STAGING       │
                    │ Padronização dos    │
                    │ dados de origem     │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │    INTERMEDIATE     │
                    │ Transformações e    │
                    │ regras de negócio   │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │       MARTS         │
                    │ Dimensões e Fatos   │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │         BI          │
                    │      Power BI       │
                    └─────────────────────┘
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

---

# Tecnologias

O projeto foi desenvolvido utilizando as seguintes tecnologias:

- **Databricks** — plataforma utilizada para armazenamento e processamento dos dados
- **dbt (Data Build Tool)** — transformação, modelagem, documentação e testes dos dados
- **SQL** — desenvolvimento das transformações analíticas
- **GitHub** — versionamento e organização do projeto
- **Power BI** — construção dos dashboards e análises de negócio

---

# Principais Entregas

Durante o desenvolvimento do projeto foram implementados:

- Organização dos dados nas camadas **Sources → Staging → Intermediate → Marts**
- Construção de um **modelo dimensional** para análise de vendas
- Desenvolvimento de **dimensões e fato de vendas**
- Implementação de **testes de qualidade e integridade dos dados**
- Validação automatizada de uma métrica crítica de negócio
- Documentação dos modelos utilizando **dbt Docs**
- Desenvolvimento de dashboards analíticos no **Power BI**

---

# Qualidade e Validação

A qualidade dos dados foi validada utilizando testes automatizados do dbt, incluindo validações de:

- Valores nulos (`not_null`)
- Unicidade de chaves (`unique`)
- Integridade referencial (`relationships`)
- Combinações únicas de colunas
- Validação de métricas de negócio

Também foi implementado um teste específico para validar uma métrica crítica informada pelo negócio.

### Validação das vendas brutas de 2011

O valor esperado para as vendas brutas de 2011 é:

> **R$ 12.646.112,16**

O teste foi implementado para falhar caso o valor calculado seja diferente do resultado esperado.

Na validação final do projeto:

- **10 testes de Sources aprovados**
- **144 testes aprovados**
- **0 erros**
# 📊 Dashboard de Desempenho Escolar - Luziânia

Este projeto é uma ferramenta de Business Intelligence (BI) de ciclo rápido, desenvolvida para transformar planilhas de notas em insights visuais imediatos. O objetivo é auxiliar a gestão pedagógica na tomada de decisões baseada em dados reais.

---

## 🚀 Funcionalidades Principais

* **Upload Dinâmico de Dados:** Interface amigável para carregamento de planilhas `.ods` (LibreOffice/OpenDocument) via barra lateral.
* **Métricas de Desempenho:** Cálculo instantâneo do total de alunos, média geral da turma e destaque para a maior nota.
* **Visualização Analítica:**
    * **Gráfico de Barras:** Comparativo individual entre a Nota 1 e Nota 2.
    * **Gráfico de Setores (Pizza):** Visão percentual do Status (Aprovados, Reprovados e Recuperação).
* **Exploração de Dados:** Tabela interativa para auditoria detalhada dos registros carregados.

---

## 🛡️ Protocolo de Privacidade e Segurança

A proteção de dados sensíveis é o pilar deste projeto. O sistema foi configurado para garantir que **nenhum dado de upload seja armazenado permanentemente**.

### Por que o sistema é seguro?
1.  **Memória Volátil:** Os dados residem apenas na memória RAM da sessão ativa. Ao fechar o navegador, os dados são destruídos.
2.  **Arquitetura Sem Persistência:** O servidor do Streamlit Cloud não possui disco rígido para armazenamento de longo prazo de arquivos de usuários.
3.  **Sistema "Read-Only":** O ambiente de execução é bloqueado para gravações (`Errno 30`), impedindo a criação de cópias não autorizadas no servidor.
4.  **Isolamento Total:** Não existem conexões com storages externos (como Google Cloud ou AWS), garantindo que os dados não saiam do fluxo temporário de exibição.

---

## 🛠️ Tecnologias Utilizadas

* **Python:** Engine de processamento.
* **Streamlit:** Framework para interface web e deploy.
* **Pandas:** Manipulação, filtragem e agregação de dados.
* **Matplotlib:** Geração de gráficos estatísticos.
* **ODFPy:** Motor de leitura para arquivos de planilhas abertas (.ods).

---

## ⚙️ Como Executar o Projeto

Para rodar este dashboard localmente, siga os passos abaixo:

1. **Site:**
   ```bash
   clique no link [https://github.com/ryancursoluz-ops/dashboard-escolar](https://dashboard-escolar-twvcqvnajaavwxvkayv4qh.streamlit.app/)
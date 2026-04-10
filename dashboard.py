import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt

# Configuração da página
st.set_page_config(page_title="Dashboard Escolar", layout="wide")

st.title("📊 Painel de Notas dos Alunos")

# 1. Carregar os dados (ajuste o nome do arquivo se necessário)
# No dashboard, podemos permitir que o usuário faça o upload!
uploaded_file = st.sidebar.file_uploader("Escolha sua planilha (.ods)", type="ods")

if uploaded_file:
    df = pd.read_excel(uploaded_file, engine='odf')
    
    # --- MÉTRICAS NO TOPO ---
    col1, col2, col3 = st.columns(3)
    col1.metric("Total de Alunos", len(df))
    col2.metric("Média Geral da Turma", round(df['Média Final'].mean(), 2))
    col3.metric("Maior Nota", df['Média Final'].max())

    # --- GRÁFICOS ---
    col_graph1, col_graph2 = st.columns(2)

    with col_graph1:
        st.subheader("Comparativo de Notas")
        fig1, ax1 = plt.subplots()
        df.plot(kind='bar', x='Nome do Aluno', y=['Nota 1', 'Nota 2'], ax=ax1)
        st.pyplot(fig1)

    with col_graph2:
        st.subheader("Status dos Alunos")
        # Gráfico de pizza para ver aprovados/reprovados
        status_counts = df['Status'].value_counts()
        fig2, ax2 = plt.subplots()
        status_counts.plot(kind='pie', autopct='%1.1f%%', ax=ax2, startangle=90)
        ax2.set_ylabel('') # Remove o label lateral
        st.pyplot(fig2)

    # --- TABELA DE DADOS ---
    st.write("### Dados Detalhados")
    st.dataframe(df)

else:
    st.info("Aguardando upload da planilha para gerar o dashboard...")
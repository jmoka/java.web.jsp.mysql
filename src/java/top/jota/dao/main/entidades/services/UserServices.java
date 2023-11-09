package top.jota.dao.main.entidades.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import top.jota.dao.DB.DB;
import top.jota.dao.DB.Exception.DbException;
import top.jota.dao.DB.sql.UserSql;
import top.jota.dao.main.entidades.Usuario;
import top.jota.dao.main.entidades.interfacs.UserInterfaces;

public class UserServices implements UserInterfaces {
     Connection conm = null;
     PreparedStatement st = null;
     ResultSet rs = null;

    @Override
    public Usuario inserir() {       

        try {
            conm = DB.getConnection();
            st = conm.prepareStatement(UserSql.sqlInsert(), PreparedStatement.RETURN_GENERATED_KEYS);

            // Passe as informações para cada parâmetro do SQL
            st.setString(1, "Cupu");
            st.setString(2, "123");

            // Execute o SQL
            int linhasAfetadas = st.executeUpdate(); // retorna um int

            if (linhasAfetadas > 0) {
                // Obtem as chaves geradas (IDs) após a inserção
                ResultSet idGerado = st.getGeneratedKeys();
                if (idGerado.next()) {
                    int generatedId = idGerado.getInt(1); // 1 é o índice da coluna para o ID gerado
                    System.out.println("Usuario Inserido com Sucesso. ID: " + generatedId);
                }
            } else {
                System.err.println("Inserção falhou. Nenhum registro foi afetado.");
            }
        } catch (SQLException e) {
            System.err.println(new DbException("Verifique o SQL, dados não inseridos ==> " + e.getMessage()));
        } finally {
            // Feche os recursos no bloco finally
            DB.fecharConexao();
            DB.fecharStatiment();
            DB.fecharResultSet();
           
        }
        return null;
    }

    @Override
    public  String autenticarUsuario(String name, String senha) {
    conm = DB.getConnection();

    try {
        st = conm.prepareStatement(UserSql.autenticarUsuário());
        st.setString(1, name);
        st.setString(2, senha);

        rs = st.executeQuery(); // Execute uma consulta SELECT
       
        if (rs.next()) {
            // Usuário autenticado
            String nomeUsuario = rs.getString("nome");
            String senhaUsuario = rs.getString("senha");
            System.out.println("Usuario autenticado: " + nomeUsuario);
            return nomeUsuario;
        } else {
            System.err.println("Usuario nao encontrado");
        }
    } catch (SQLException ex) {
        System.err.println("Erro ao realizar consulta");
        System.err.println(new DbException(ex.getMessage()));
    } finally {
        // Feche os recursos no bloco finally
        DB.fecharConexao();
        DB.fecharStatiment();
        DB.fecharResultSet();
    }

    return null;
}

        
     
     }

    
    

    


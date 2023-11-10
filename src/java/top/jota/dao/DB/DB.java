package top.jota.dao.DB;


import com.mysql.cj.protocol.Resultset;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import top.jota.dao.DB.Exception.DbException;

public class DB {           

      private static Connection conm;
      private static PreparedStatement st;
      private static Resultset rs;
    
    public static Connection getConnection() {
        String url = "jdbc:mysql://localhost:3306/loja";
        String usuario = "root";
        String senha = "123456";
        
        Connection conm;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Estabelecimento conexao com o banco
            conm = DriverManager.getConnection(url, usuario, senha);

            // Testando a Conexao
            if (conm != null) {
                System.out.println("Conexao Estabelecida com Sucesso!!");
            } else {
                System.err.println("Não foi possível estabelecer a conexao com o banco de dados");
            }   

            return conm;
        } catch (Exception e) {
            System.err.println("Verifique se seu Banco de Dados veja se esta Rodando, Caso Contrario Reinicie O Banco de Dados ===>>  " + new DbException(e.getMessage()));
            return null;
        }
    }

    public static void fecharConexao() {
           
        Connection conm = null;
          try {
                if (conm != null) {
                    conm.close();
                }
                  System.err.println("Conexao Fechada");
        } catch (SQLException e) {
            System.err.println("Erro ao fechar a conexão: " + e.getMessage());
        }
    }
   
    
    public static void fecharStatiment(){    
         try {
                if (st != null) {
                    st.close();
                   
                }
                 System.err.println("Conexao Statiment Fechada");
           } catch (SQLException e) {
                System.err.println(new DbException("Erro ao Fechar a Conexao Statiment ==> " + e.getMessage()));
            }
    }
    
     public static void fecharResultSet(){    
         try {
                if (rs != null) {
                    st.close();
                   
                }
                 System.err.println("Conexao ResultSet Fechada");
           } catch (SQLException e) {
                System.err.println(new DbException("Erro ao Fechar a Conexao ResultSet==> " + e.getMessage()));
            }
    }
}


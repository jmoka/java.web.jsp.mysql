package top.jota.dao.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import top.jota.dao.DB.Exception.DbException;

public class TesteDB {           

    public static Connection getConnection() {
        String url = "jdbc:mysql://localhost:3306/loja";
        String usuario = "root";
        String senha = "123456";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Estabelecimento conexao com o banco
            Connection conm = DriverManager.getConnection(url, usuario, senha);

            // Testando a Conexao
            if (conm != null) {
                System.out.println("Conexao Estabelecida com Sucesso!!");
            } else {
                System.err.println("Não foi possível estabelecer a conexão com o banco de dados");
            }   

            return conm;
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Verifique se seu Banco de Dados veja se esta Rodando, Caso Contrario Reinicie O Banco de Dados ===>>  " + new DbException(e.getMessage()));
            return null;
        }
    }
}

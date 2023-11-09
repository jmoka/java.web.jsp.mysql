package top.jota.dao.DB.sql;

public class UserSql {
    
    public static String sqlInsert(){        
        return "INSERT INTO usuarios "
               + "(nome, senha) "
               + "VALUES " // 
               + "(?, ?)";
    }
    
    public static String autenticarUsuário () {
		return "SELECT nome, senha "
                       + "FROM usuarios "
                       + "WHERE " 
                       + "nome = ? " 
                       + "AND senha = ?; ";
	};
}

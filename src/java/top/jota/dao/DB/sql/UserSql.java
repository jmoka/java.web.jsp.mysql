package top.jota.dao.DB.sql;

public class UserSql {
    
    public static String sqlInsert(){        
        return "INSERT INTO usuarios "
               + "(login, senha) "
               + "VALUES " // Changed "VALUE" to "VALUES"
               + "(?, ?)";
    }
}

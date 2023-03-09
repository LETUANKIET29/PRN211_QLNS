using System.Data.SqlClient;

public static class ConnectionHelper
{
    private static readonly string connectionString;

    static ConnectionHelper()
    {
        string server = QLNS.Config.Server;
        string database = QLNS.Config.Database;
        string userId = QLNS.Config.UserID;
        string password = QLNS.Config.Password;

        SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
        builder.DataSource = server;
        builder.InitialCatalog = database;
        builder.UserID = userId;
        builder.Password = password;

        connectionString = builder.ToString();
    }

    public static SqlConnection GetConnection()
    {
        SqlConnection conn = new SqlConnection(connectionString);
        return conn;
    }
}

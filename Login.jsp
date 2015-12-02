package org.inventory.dao.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnectionUtil
{
	static
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		Connection connection = null;
		try
		{
			connection = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/inventory", "root", "");
		} catch (Exception sqle)
		{
			sqle.printStackTrace();
		}
		return connection;
	}

}

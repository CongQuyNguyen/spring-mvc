package com.laptrinhweb.dao.impl;

import com.laptrinhweb.dao.GenericDAO;
import com.laptrinhweb.mapper.RowsMapper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AbstractDAO<T> implements GenericDAO<T> {

    // Load driver
    // ResourceBundle resourceBundle = ResourceBundle.getBundle("db");
    public Connection getConnection() {
        try {

            Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/spring_mvc";
			String username = "root";
			String password = "Congquy2004@";

//            Class.forName(resourceBundle.getString("driverName"));
//            String url = resourceBundle.getString("url");
//            String username = resourceBundle.getString("user");
//            String password = resourceBundle.getString("password");
            return DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }


    @Override
    public List<T> query(String sql, RowsMapper<T> rowMapper, Object... parameters) {
        List<T> results = new ArrayList<T>();
        // Open connection
        Connection connection = null;
        // Get prepare statement
        PreparedStatement statement = null;
        // An object sql return
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            // Set parameters for sql query
            setParameter(statement, parameters);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                results.add(rowMapper.mapRow(resultSet));
            }
            connection.close();
            statement.close();
            resultSet.close();
            return results;

        } catch (SQLException e) {
            return null;
        }

    }

    @Override
    public void update(String sql, Object... parameters) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = getConnection();
            connection.setAutoCommit(false);

            statement = connection.prepareStatement(sql);
            setParameter(statement, parameters);

            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) {
                connection.commit();
            } else {
                connection.rollback();
            }

        } catch (SQLException ex) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException e) {
                    System.out.println(e.toString());
                }
            }
            System.out.println(ex.toString());
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.out.println(e.toString());
            }
        }
    }

    @Override
    public Long insert(String sql, Object... parameters) {
        Long id = -1L;

        ResultSet resultSet = null;
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = getConnection();
            connection.setAutoCommit(false);

            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            setParameter(statement, parameters);
            statement.executeUpdate();

            // Lấy ra cái id của news đó để trả v�?
            resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {
                connection.commit();
                id = resultSet.getLong(1);
            }

        } catch (SQLException ex) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            ex.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return id;
    }

    @Override
    public int count(String sql, Object... parameters) {
        // Open connection
        Connection connection = null;

        // Get prepare statement
        PreparedStatement statement = null;

        // An object sql return
        ResultSet resultSet = null;

        try {
            int count = 0;

            connection = getConnection();
            statement = connection.prepareStatement(sql);

            // Set parameters for sql query
            setParameter(statement, parameters);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                count = resultSet.getInt(1);
            }

            connection.close();
            statement.close();
            resultSet.close();

            return count;

        } catch (SQLException e) {
            return 0;
        }
    }

    private void setParameter(PreparedStatement statement, Object... parameters) {
        int length = parameters.length;

        try {
            for (int i = 0; i < length; ++i) {
                Object parameter = parameters[i];

                // Vị trí chèn tham số trong câu truy vấn bắt đầu từ 1
                int index = i + 1;

                if (parameter instanceof Long) {
                    statement.setLong(index, (Long) parameter);
                } else if (parameter instanceof String) {
                    statement.setString(index, (String) parameter);
                } else if(parameter instanceof Integer) {
                    statement.setInt(index, (Integer) parameter);
                } else if(parameter instanceof Timestamp) {
                    statement.setTimestamp(index, (Timestamp) parameter);
                } else if(parameter instanceof Double) {
                    statement.setDouble(index, (Double) parameter);
                } else if(parameter == null) {
                    statement.setNull(index, Types.NULL);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}

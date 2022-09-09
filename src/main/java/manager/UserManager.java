package manager;

import db.DBConnectionProvider;
import model.Author;
import model.User;

import java.sql.*;
import java.text.ParseException;

public class UserManager {
    private final Connection connection = DBConnectionProvider.getInstance().getConnection();

    public void add(User user) {
        String sql = "Insert into user (user_name,user_surname,user_email,user_password) Values (?,?,?,?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getUsersurname());
            ps.setString(3, user.getUseremail());
            ps.setString(4, user.getUserpassword());

            ps.executeUpdate();

            ResultSet resultSet = ps.getGeneratedKeys();
            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                user.setId(id);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private User getUserFromResultSet(ResultSet resultSet) throws SQLException, ParseException {
        User user = User.builder()
//                .id(resultSet.getInt("id"))
                .username(resultSet.getString("user_name"))
                .usersurname(resultSet.getString("user_surname"))
                .useremail((resultSet.getString("user_email")))
                .userpassword((resultSet.getString("user_password")))

                .build();


        return user;
    }

    public User getUserByEmailAndPassword(String useremail, String userpassword) {


        String sql = "SELECT * From user where user_email = ? and user_password = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, useremail);
            preparedStatement.setString(2, userpassword);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return getUserFromResultSet(resultSet);
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
        return null;


    }

    public User getUserByEmail(String useremail) {


        String sql = "SELECT * From user where user_email = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, useremail);


            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return getUserFromResultSet(resultSet);
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
        return null;


    }
}
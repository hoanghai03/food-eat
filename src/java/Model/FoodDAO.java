/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class FoodDAO {

    PreparedStatement pst;
    Connection conn = null;

    /*--------------- CONNECT TO DB ---------------*/
    public FoodDAO() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodorderapp", "root", "10041998Cc");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Lỗi connect DB");
            throw new Error(e);
        }
    }

    /*--------------- ADD TO CART ---------------*/
    public void sendData(int user_id, int food_id) {
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT EXISTS (select * from user_food where food_id =" + food_id + ")");
            if (rs.next()) {
                String query = "";
                if (rs.getInt(1) == 0) {
                    query = "insert into user_food values(" + (user_id + ",") + (food_id + ",") + "1)";
                } else {

                    rs = st.executeQuery("select quantity from user_food where food_id =" + food_id + ";");
                    if (rs.next()) {
                        int quantity = rs.getInt(1) + 1;
                        query = "update user_food set quantity=" + quantity + " where food_id=" + food_id + ";";
                    }
                }

                pst = conn.prepareStatement(query);
                pst.execute();
            }
        } catch (Exception e) {
            System.out.println("Loi sendData");
            throw new Error(e);
        }
    }

    /*--------------- LOAD FOOD LIST ---------------*/
    public String[] readData() {
        String[] tmpData = new String[100];
        int index = 1;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * from food");
            while (rs.next()) {
                StringBuffer tmp = new StringBuffer(rs.getInt("food_id") + "-" + rs.getString("food_name")
                        + "-" + rs.getDouble("food_price") + "-" + rs.getString("img")
                        + "-" + rs.getString("info"));
                tmpData[index++] = tmp.toString();
            }
        } catch (Exception e) {
            System.out.println("Loi readData");
            throw new Error(e);
        }
        String[] data = new String[index];
        for (int i = 1; i < index; i++) {
            data[i] = tmpData[i];
        }
        return data;
    }

    /*--------------- LOAD CART ---------------*/
    public String[] Cart() {
        String[] tmpData = new String[100];
        int index = 1;
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT food.*, user_food.quantity FROM food, user_food where food.food_id = user_food.food_id");
            while (rs.next()) {
                StringBuffer tmp = new StringBuffer(rs.getInt("food_id") + "-" + rs.getString("food_name")
                        + "-" + rs.getDouble("food_price") + "-" + rs.getString("img")
                        + "-" + rs.getString("info") + "-" + rs.getInt("user_food.quantity"));
                tmpData[index++] = tmp.toString();
            }

        } catch (Exception e) {
            System.out.println("Lỗi Cart()");
            throw new Error(e);
        }
        String[] data = new String[index];
        for (int i = 1; i < index; i++) {
            data[i] = tmpData[i];
        }
        return data;
    }

    /*--------------- DELETE FOOD ---------------*/
    public void delete(int food_id) {
        try {
            String query = "DELETE FROM user_food where food_id = " + food_id + ";";
            Statement st = conn.createStatement();
            int rs = st.executeUpdate(query);
            System.out.println("Đã xóa item food_id = " + food_id);
        } catch (SQLException ex) {
            System.out.println("Loi delete item");
            throw new Error(ex);
        }
    }
    /*--------------- PAYMENT ---------------*/
    public void pay() {
        try {
            String query = "DELETE FROM user_food;";
            Statement st = conn.createStatement();
            int rs = st.executeUpdate(query);
            System.out.println("Đã thanh toán thành công");
        } catch (SQLException ex) {
            System.out.println("Loi pay");
            throw new Error(ex);
        }
    }
}

package com.example.eco_mobility.DAO;

import com.example.eco_mobility.DTO.SpeseCarburanteDTO;
import com.example.eco_mobility.DTO.UtentiDTO;
import com.example.eco_mobility.Model.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class SpeseCarburanteDAO {
    static Connection con = DatabaseConnection.getConnection();
    private static final String TABLE_NAME = "Spesecarburante";

    public synchronized void doSaveSpeseCarburante(SpeseCarburanteDTO spesa) throws SQLException{
        PreparedStatement ps = null;

        String query="INSERT INTO "+ SpeseCarburanteDAO.TABLE_NAME+" (data, euroSpesi, idUtenti) VALUES (?,?,?)";
        ps=con.prepareStatement(query);

        ps.setString(1,spesa.getData());
        ps.setInt(2, spesa.getEuroSpesi());
        ps.setInt(3,spesa.getIdUtenti());

        ps.executeUpdate();

    }

    public synchronized ArrayList<SpeseCarburanteDTO> doRetriveByUser(int idUtente)throws SQLException{
        PreparedStatement ps = null;

        String query="SELECT * FROM "+ SpeseCarburanteDAO.TABLE_NAME+" where idUtenti=? order by data desc";
        ps=con.prepareStatement(query);

        ps.setInt(1,idUtente);

        ResultSet rs=ps.executeQuery();

        ArrayList <SpeseCarburanteDTO> spese= new ArrayList<>();

        while (rs.next()){
            SpeseCarburanteDTO spesa= new SpeseCarburanteDTO();

            spesa.setEuroSpesi(rs.getInt("euroSpesi"));
            spesa.setData(rs.getString("data"));

            spese.add(spesa);
        }

        return spese;

    }

    public synchronized List<SpeseCarburanteDTO> doRetriveEuroSpesi(int utente) throws SQLException {
        PreparedStatement ps = null;

        List<SpeseCarburanteDTO> spese = new ArrayList<SpeseCarburanteDTO>();

        String query="SELECT DISTINCT data, sum(euroSpesi) FROM ecomobility.spesecarburante " +
                "WHERE data between (curdate() - INTERVAL DAYOFWEEK(curdate())+6 DAY) AND (curdate()) AND idUtenti= ? GROUP BY data order by data desc";

        ps=con.prepareStatement(query);

        ps.setInt(1,utente);

        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            SpeseCarburanteDTO sp = new SpeseCarburanteDTO();
            sp.setData(rs.getString("data"));
            sp.setEuroSpesi(rs.getInt("sum(euroSpesi)"));
            spese.add(sp);
        }

        return spese;
    }

    public synchronized int doRetriveSpeseByData(String data, int idUtente) throws SQLException {
        PreparedStatement ps = null;

        String query="SELECT sum(euroSpesi) FROM ecomobility.SpeseCarburante WHERE data = ? AND idUtenti = ?";

        ps=con.prepareStatement(query);

        ps.setString(1,data);
        ps.setInt(2,idUtente);

        ResultSet rs = ps.executeQuery();

        int spese = 0;

        while (rs.next()){
            spese=rs.getInt("sum(euroSpesi)");
        }

        return spese;
    }

    public synchronized ArrayList<SpeseCarburanteDTO> speseByData(String data, int idUtente) throws SQLException {
        PreparedStatement ps = null;


        String query="SELECT * FROM ecomobility.SpeseCarburante WHERE data = ? AND idUtenti = ?";

        ps=con.prepareStatement(query);

        ps.setString(1,data);
        ps.setInt(2,idUtente);

        System.out.println(ps);
        ResultSet rs = ps.executeQuery();

        ArrayList<SpeseCarburanteDTO> spese = new ArrayList<>();

        while (rs.next()){
            SpeseCarburanteDTO spesa= new SpeseCarburanteDTO();

            spesa.setEuroSpesi(rs.getInt("euroSpesi"));
            spesa.setData(rs.getString("data"));

            spese.add(spesa);
        }

        return spese;
    }

    public synchronized int SpeseProgressByData(int utente, String dateDa, String dateA) throws SQLException {
        PreparedStatement ps=null;

        String query="SELECT sum(euroSpesi) FROM ecomobility.SpeseCarburante where idUtente=? and data between ? and ? ";

        ps=con.prepareStatement(query);


        ps.setInt(1,utente);
        ps.setString(2,dateDa);
        ps.setString(3,dateA);

        ResultSet rs = ps.executeQuery();

        int euro=0;

        while(rs.next()){
            euro=rs.getInt("sum(euroSpesi)");
        }

        return euro;
    }

}

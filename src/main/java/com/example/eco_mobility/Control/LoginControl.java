package com.example.eco_mobility.Control;

import com.example.eco_mobility.DAO.ObiettivoDAO;
import com.example.eco_mobility.DAO.UtentiDAO;
import com.example.eco_mobility.DTO.UtentiDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;



public class LoginControl extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginControl() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        request.getSession().setAttribute("page","home");


        try {
            if(checkLogin(email,password,request).equals("registrato")){



                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/SpostamentiControl");

                dispatcher.forward(request,response);
            }
        } catch (Exception throwables) {

            throwables.printStackTrace();
            //Se l'utente non è risulta nel database o la password è errata
            request.setAttribute("invalidAccess","true");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
            dispatcher.forward(request, response);
        }


    }

    private String checkLogin(String email, String password, HttpServletRequest request) throws Exception {
        UtentiDAO utDAO = new UtentiDAO();
        UtentiDTO ut = utDAO.doRetrivebyEmail(email);

        ObiettivoDAO obbDao = new ObiettivoDAO();

        if (ut.getEmail().equals(email) && ut.getPassword().equals(password)) {

            request.getSession().setAttribute("utente",ut);

            request.getSession().setAttribute("obiettiviInCorso",obbDao.doRetriveObiettiviInCorso(ut.getIdUtenti()));

            //avanzamento km per obiettivi in corso
            request.getSession().setAttribute("progressKm",obbDao.doRetriveProgressKm(ut.getIdUtenti()));

            //avanzamento utilizzo mezzo eco
            request.getSession().setAttribute("progressMezzo",obbDao.doRetriveProgressMezzoEco(ut.getIdUtenti()));

            //avanzamento spese carburante
            request.getSession().setAttribute("progressEuro",obbDao.doRetriveProgressCarburante(ut.getIdUtenti()));

            return "registrato";
        } else
            throw new Exception("Invalid login and password");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

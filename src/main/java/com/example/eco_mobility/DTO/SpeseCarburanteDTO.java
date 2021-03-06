package com.example.eco_mobility.DTO;

import java.sql.Date;

public class SpeseCarburanteDTO {

    int idSpeseCarburante;
    String data;
    int euroSpesi;
    int idUtenti;

    public SpeseCarburanteDTO(){
    }

    public SpeseCarburanteDTO(int idSpeseCarburante, String data, int euroSpesi, int idUtenti){
        this.idSpeseCarburante=idSpeseCarburante;
        this.data=data;
        this.euroSpesi=euroSpesi;
        this.idUtenti=idUtenti;
    }

    public int getIdSpeseCarburante() {
        return idSpeseCarburante;
    }

    public void setIdSpeseCarburante(int idSpeseCarburante) {
        this.idSpeseCarburante = idSpeseCarburante;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public int getEuroSpesi() {
        return euroSpesi;
    }

    public void setEuroSpesi(int euroSpesi) {
        this.euroSpesi = euroSpesi;
    }

    public int getIdUtenti() {
        return idUtenti;
    }

    public void setIdUtenti(int idUtenti) {
        this.idUtenti = idUtenti;
    }
}

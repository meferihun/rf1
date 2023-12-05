package application.model;

import java.io.Serializable;

public class Hir implements Serializable {

  private static final long serialVersionUID = 1L;

  int hirid;
  String cim;
  String kozetevesdatuma;
  int megtekintesekszama;
  boolean fontose;
  String forras;
  String honnan;
  String kategoria;

  public Hir() {}

  public Hir(int hirid, String cim, String kozetevesdatuma, int megtekintesekszama, boolean fontose, String forras, String honnan, String kategoria) {
    this.hirid = hirid;
    this.cim = cim;
    this.kozetevesdatuma = kozetevesdatuma;
    this.megtekintesekszama = megtekintesekszama;
    this.fontose = fontose;
    this.forras = forras;
    this.honnan = honnan;
    this.kategoria = kategoria;
  }

  public String getKategoria() {
    return kategoria;
  }

  public void setKategoria(String kategoria) {
    this.kategoria = kategoria;
  }

  public String getHonnan() {
    return honnan;
  }

  public void setHonnan(String honnan) {
    this.honnan = honnan;
  }

  public int getHirid() {
    return hirid;
  }

  public void setHirid(int hirid) {
    this.hirid = hirid;
  }

  public String getCim() {
    return cim;
  }

  public void setCim(String cim) {
    this.cim = cim;
  }

  public String getKozetevesdatuma() {
    return kozetevesdatuma;
  }

  public void setKozetevesdatuma(String kozetevesdatuma) {
    this.kozetevesdatuma = kozetevesdatuma;
  }

  public int getMegtekintesekszama() {
    return megtekintesekszama;
  }

  public void setMegtekintesekszama(int megtekintesekszama) {
    this.megtekintesekszama = megtekintesekszama;
  }

  public boolean isFontose() {
    return fontose;
  }

  public void setFontose(boolean fontose) {
    this.fontose = fontose;
  }

  public String getForras() {
    return forras;
  }

  public void setForras(String forras) {
    this.forras = forras;
  }

  @Override
  public String toString() {
    return "Hir [id=" + hirid + ", cim=" + cim + ", kozetevesdatuma=" + kozetevesdatuma + ", megtekintesekszama=" + megtekintesekszama + ", fontose=" + fontose +", forras=" + forras + "]";
  }

}
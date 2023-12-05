package application.model;

import java.time.LocalDate;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

public class User implements UserDetails {

  private static final long serialVersionUID = 1L;
  String felhasznalonev;
  String email;
  String jelszo;
  String jelszoUjra;
  Date szulDatum;
  boolean tiltAllapot;
  String jogosultsag;

  public User() {}

  public User(String felhasznalonev, String email, String jelszo, String jelszoUjra, Date szulDatum, String jogosultsag) {
    this.felhasznalonev = felhasznalonev;
    this.email = email;
    this.jelszo = jelszo;
    this.jelszoUjra = jelszoUjra;
    this.szulDatum = szulDatum;
    this.tiltAllapot = false;
    this.jogosultsag = jogosultsag;
  }

  public String getFelhasznalonev() {
    return felhasznalonev;
  }

  public void setFelhasznalonev(String felhasznalonev) {
    this.felhasznalonev = felhasznalonev;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getJelszo() {
    return jelszo;
  }

  public void setJelszo(String jelszo) {
    this.jelszo = jelszo;
  }

  public String getJelszoUjra() {
    return jelszoUjra;
  }

  public void setJelszoUjra(String jelszoUjra) {
    this.jelszoUjra = jelszoUjra;
  }

  public Date getSzulDatum() {
    return szulDatum;
  }

  public void setSzulDatum(Date szulDatum) {
    this.szulDatum = szulDatum;
  }

  public boolean isTiltallapot() {
    return tiltAllapot;
  }

  public void setTiltallapot(boolean tiltallapot) {
    this.tiltAllapot = tiltallapot;
  }

  public String getJogosultsag() {
    return jogosultsag;
  }

  public void setJogosultsag(String jogosultsag) {
    this.jogosultsag = jogosultsag;
  }

  @Override
  public boolean isAccountNonExpired() {
    return true;
  }

  @Override
  public boolean isAccountNonLocked() {
    return true;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  @Override
  public boolean isEnabled() {
    return true;
  }

  @Override
  public Collection < ? extends GrantedAuthority > getAuthorities() {
    Set < GrantedAuthority > authorities = new HashSet < GrantedAuthority > ();
    authorities.add(new SimpleGrantedAuthority(this.jogosultsag));
    return authorities;
  }

  @Override
  public String getPassword() {
    return this.jelszo;
  }

  @Override
  public String getUsername() {
    return this.email;
  }

}
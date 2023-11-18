package application.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import application.model.User;

@Repository
public class UserDAO extends JdbcDaoSupport {

  @Autowired
  BCryptPasswordEncoder passwordEncoder;

  @Autowired
  DataSource dataSource;

  @PostConstruct
  private void initialize() {
    setDataSource(dataSource);
  }

  public void insertUser(User user) {
    String sql = "INSERT INTO felhasznalok(nev, email, jelszo, szuldatum, tiltallapot, jogosultsag) VALUES (?, ?, ?, ?, ?, ?)";
    if (user.getJelszo().equals(user.getJelszoUjra())) {
      getJdbcTemplate().update(sql, new Object[] {
              user.getFelhasznalonev(), user.getEmail(), passwordEncoder.encode(user.getPassword()), user.getSzulDatum(), user.isTiltallapot(), user.getJogosultsag()
      });
    }
  }

  public String deleteUser(String username) {
    String sql = "DELETE FROM felhasznalok WHERE nev='" + username + "'";
    getJdbcTemplate().update(sql);
    return "redirect:/logout.html";
  }

  public User getUserByUsername(String felhasznalonev) {
    String sql = "SELECT * FROM felhasznalok WHERE nev=?";
    List < Map < String, Object >> rows = getJdbcTemplate().queryForList(sql, felhasznalonev);

    List < User > result = new ArrayList < User > ();
    for (Map < String, Object > row: rows) {
      User user = new User();
      user.setFelhasznalonev((String) row.get("nev"));
      user.setEmail((String) row.get("email"));
      user.setJelszo((String) row.get("jelszo"));
      user.setSzulDatum((Date) row.get("szuldatum"));
      user.setTiltallapot((Boolean) row.get("tiltallapot"));
      user.setJogosultsag((String) row.get("jogosultsag"));
      result.add(user);
    }

    return result.get(0);
  }

  public User getUserByEmail(String email) {
    String sql = "SELECT * FROM felhasznalok WHERE email=?";
    List < Map < String, Object >> rows = getJdbcTemplate().queryForList(sql, email);

    List < User > result = new ArrayList < User > ();
    for (Map < String, Object > row: rows) {
      User user = new User();
      user.setFelhasznalonev((String) row.get("nev"));
      user.setEmail((String) row.get("email"));
      user.setJelszo((String) row.get("jelszo"));
      user.setSzulDatum((Date) row.get("szuldatum"));
      user.setTiltallapot((Boolean) row.get("tiltallapot"));
      user.setJogosultsag((String) row.get("jogosultsag"));
      result.add(user);
    }

    return result.get(0);
  }


  public void updateUser(String email, String name, Boolean tiltallapot, Date parse) {
    String sql = "UPDATE felhasznalok SET nev='" + name + "', tiltallapot = '" + tiltallapot + "', szuldatum='" + parse + "' WHERE email='" + email + "'";
    getJdbcTemplate().update(sql);
  }
}
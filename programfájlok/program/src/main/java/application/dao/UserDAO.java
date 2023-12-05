package application.dao;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

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

    public boolean insertUser(User user) {
        String sql = "INSERT INTO felhasznalok(nev, email, jelszo, szuldatum, tiltallapot, jogosultsag) VALUES (?, ?, ?, ?, ?, ?)";
        if (user.getJelszo().equals(user.getJelszoUjra())) {
            int res = getJdbcTemplate().update(sql, new Object[]{
                    user.getFelhasznalonev(), user.getEmail(), passwordEncoder.encode(user.getPassword()), user.getSzulDatum(), user.isTiltallapot(), user.getJogosultsag()
            });
            if (res == 1) {
                return true;
            } else {
                return false;
            }
        }
        return false;
    }

    public String deleteUser(String username) {
        String sql = "DELETE FROM felhasznalok WHERE nev='" + username + "'";
        getJdbcTemplate().update(sql);
        return "redirect:/logout.html";
    }

    public User getUserByUsername(String felhasznalonev) {
        String sql = "SELECT * FROM felhasznalok WHERE nev=?";
        List<Map<String, Object>> rows = getJdbcTemplate().queryForList(sql, felhasznalonev);

        List<User> result = new ArrayList<User>();
        for (Map<String, Object> row : rows) {
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
        List<Map<String, Object>> rows = getJdbcTemplate().queryForList(sql, email);

        List<User> result = new ArrayList<User>();
        for (Map<String, Object> row : rows) {
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

    public boolean emberLetezik(String felhasznalonev) {
        Integer cnt = getJdbcTemplate().queryForObject(
                "SELECT COUNT(*) FROM felhasznalok WHERE nev=?", Integer.class, felhasznalonev);
        return cnt != null && cnt > 0;
    }

    public void updateUser(String email, String name, Boolean tiltallapot, Date parse, ArrayList<String> kategoriak) {
        boolean letezik = emberLetezik(name);
        if (!letezik) {
            String sql = "UPDATE felhasznalok SET nev='" + name  + "' WHERE email='" + email + "'";
            getJdbcTemplate().update(sql);
        }

        String sql = "UPDATE felhasznalok SET  tiltallapot = '" + tiltallapot + "', szuldatum='" + parse + "' WHERE email='" + email + "'";
        getJdbcTemplate().update(sql);

        for (int i = 0; i < kategoriak.size(); i++) {
            if (!kategoriak.get(i).contains("false")) {
                sql = "INSERT INTO kedvenckategoriak (email, kategoria) VALUES (?,?) ON CONFLICT (email,kategoria) DO UPDATE SET email='" + email + "', kategoria ='" + kategoriak.get(i) + "'";
                getJdbcTemplate().update(sql, new Object[]{
                        email, kategoriak.get(i)
                });
            } else {
                String[] tmp = kategoriak.get(i).split(" ");
                sql = "DELETE FROM kedvenckategoriak WHERE email='" + email + "' AND kategoria='" + tmp[1] + "'";
                getJdbcTemplate().update(sql);
            }
        }
    }

    public boolean kategoriaLetezik(String email, String kategoria) {
        Integer cnt = getJdbcTemplate().queryForObject(
                "SELECT count(*) FROM kedvenckategoriak WHERE email=? AND kategoria=?", Integer.class, email, kategoria);
        return cnt != null && cnt > 0;
    }
    public List<User> listUsers () {
        String sql = "SELECT * FROM felhasznalok";
        List<Map<String, Object>> rows = getJdbcTemplate().queryForList(sql);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        List<User> result = new ArrayList<User>();
        for (Map<String, Object> row : rows) {
            User user = new User();
            user.setFelhasznalonev((String) row.get("nev"));
            user.setEmail((String) row.get("email"));
            user.setSzulDatum((Date) row.get("szuldatum"));
            user.setTiltallapot((Boolean) row.get("tiltallapot"));
            user.setJogosultsag((String) row.get("jogosultsag"));

            result.add(user);
        }

        return result;
    }

    public void modifyPassword(String email, String jelszo) {
        String jelszoHashelt = passwordEncoder.encode(jelszo);
        String sql = "UPDATE felhasznalok SET jelszo='" + jelszoHashelt + "' WHERE email='" + email + "'";
        getJdbcTemplate().update(sql);
    }
}

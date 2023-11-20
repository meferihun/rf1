package application.dao;

import java.sql.Types;
import java.util.ArrayList;
import java.util.Map;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.SqlParameterValue;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import application.model.Hir;
import java.text.SimpleDateFormat;

@Repository
public class HirDAO extends JdbcDaoSupport {

  @Autowired
  DataSource dataSource;

  @Autowired
  UserDAO userDAO;

  @PostConstruct
  private void initialize() {
    setDataSource(dataSource);
  }

  public void insertHir(Hir hir) {
    String sql = "INSERT INTO hirek(cim, kozetevesdatuma, megtekintesekszama, fontose, forras) VALUES (?, ?, ?, ?, ?)";

    getJdbcTemplate().update(sql, new Object[] {
      hir.getCim(), new SqlParameterValue(Types.DATE, hir.getKozetevesdatuma()), hir.getMegtekintesekszama(), hir.isFontose(), hir.getForras()
    });
  }

  public List <Hir> listHirek() {
    String sql = "SELECT * FROM hirek";
    List < Map < String, Object >> rows = getJdbcTemplate().queryForList(sql);
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    List <Hir> result = new ArrayList <Hir> ();
    for (Map < String, Object > row: rows) {
      Hir hir = new Hir();
      hir.setHirid((Integer) row.get("hirid"));
      hir.setCim((String) row.get("cim"));
      Object kozetevesdatumaValue = row.get("kozetevesdatuma");
      if (kozetevesdatumaValue != null) {
        String kozetevesdatumaStr = formatter.format((java.sql.Date) kozetevesdatumaValue);
        hir.setKozetevesdatuma(kozetevesdatumaStr);
      } else {
        hir.setKozetevesdatuma("");
      }
      hir.setMegtekintesekszama((Integer) row.get("megtekintesekszama"));
      hir.setFontose((Boolean) row.get("fontose"));
      hir.setForras((String) row.get("forras"));

      result.add(hir);
    }

    return result;
  }

  public Hir getHirById(int hirid) {
    String sql = "SELECT * FROM hirek WHERE hirid=" + hirid;
    List < Map < String, Object >> rows = getJdbcTemplate().queryForList(sql);
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    List <Hir> result = new ArrayList <Hir> ();
    for (Map < String, Object > row: rows) {
      Hir hir = new Hir();
      hir.setHirid((Integer) row.get("hirid"));
      hir.setCim((String) row.get("cim"));
      Object kozetevesdatumaValue = row.get("kozetevesdatuma");
      if (kozetevesdatumaValue != null) {
        String kozetevesdatumaStr = formatter.format((java.sql.Date) kozetevesdatumaValue);
        hir.setKozetevesdatuma(kozetevesdatumaStr);
      } else {
        hir.setKozetevesdatuma("");
      }
      hir.setMegtekintesekszama((Integer) row.get("megtekintesekszama"));
      hir.setFontose((Boolean) row.get("fontose"));
      hir.setForras((String) row.get("forras"));

      result.add(hir);
    }

    return result.get(0);
  }

  public void deleteHir(int hirid) {
    String sql = "DELETE FROM hirek WHERE hirid=" + hirid;
    getJdbcTemplate().update(sql);
  }

  public void updateHir(int hirid, String cim, String kozetevesdatuma, int megtekintesekszama, boolean fontose, String forras) {
    String sql = "UPDATE hirek SET cim='" + cim + "', kozetevesdatuma='" + kozetevesdatuma + "', megtekintesekszama='" + megtekintesekszama + "', fontose='" + fontose + "', forras='" + forras +"' WHERE hirid=" + hirid;
    getJdbcTemplate().update(sql);
  }

  public void incrementViewCount(int hirid) {
    String sql = "UPDATE hirek SET megtekintesekszama = megtekintesekszama + 1 WHERE hirid = ?";
    getJdbcTemplate().update(sql, hirid);
  }

}
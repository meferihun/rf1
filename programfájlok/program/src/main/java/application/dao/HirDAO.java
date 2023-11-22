package application.dao;

import java.sql.Types;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
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
    String sql = "INSERT INTO hirek(cim, kozetevesdatuma, megtekintesekszama, fontose, forras, honnan) VALUES (?, ?, ?, ?, ?, ?)";

    getJdbcTemplate().update(sql, new Object[]{
            hir.getCim(), new SqlParameterValue(Types.DATE, hir.getKozetevesdatuma()), hir.getMegtekintesekszama(), hir.isFontose(), hir.getForras(), hir.getHonnan()
    });

    Hir hir2 = getHirByCimesDatum(hir.getCim(), hir.getKozetevesdatuma());

    String sql2 = "INSERT INTO hirkategoriak(hirid, kategoria) VALUES (?, ?)";

    getJdbcTemplate().update(sql2, new Object[]{
            hir2.getHirid(), hir.getKategoria()
    });

  }

  public List<Hir> listHirek() {
    String sql = "SELECT * FROM hirek";
    List<Map<String, Object>> rows = getJdbcTemplate().queryForList(sql);
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    List<Hir> result = new ArrayList<Hir>();
    for (Map<String, Object> row : rows) {
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
      hir.setHonnan((String) row.get("honnan"));

      hir.setKategoria(getCategoryById(hir.getHirid()));

      result.add(hir);
    }

    return result;
  }

  public String getCategoryById(int hirid) {
    if (hirid != 0) {
      String sql = "SELECT * FROM hirkategoriak WHERE hirid=" + hirid;
      List<Map<String, Object>> rows = getJdbcTemplate().queryForList(sql);
      List<Hir> result = new ArrayList<Hir>();
      for (Map<String, Object> row : rows) {
        Hir hir = new Hir();
        hir.setHirid((Integer) row.get("hirid"));
        hir.setKategoria((String) row.get("kategoria"));

        result.add(hir);
      }

      return result.get(0).getKategoria();
    }
    return "Nincs";
  }

  public Hir getHirById(int hirid) {
    String sql = "SELECT * FROM hirek WHERE hirid=" + hirid;
    List<Map<String, Object>> rows = getJdbcTemplate().queryForList(sql);
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    List<Hir> result = new ArrayList<Hir>();
    for (Map<String, Object> row : rows) {
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
      hir.setHonnan((String) row.get("honnan"));

      result.add(hir);
    }

    return result.get(0);
  }

  public Hir getHirByCimesDatum(String cim, String datum) {
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    LocalDate datum2 = LocalDate.parse(datum);
    String sql = "SELECT * FROM hirek WHERE cim='" + cim + "' AND kozetevesdatuma = '" + datum2 + "'";
    List<Map<String, Object>> rows = getJdbcTemplate().queryForList(sql);
    List<Hir> result = new ArrayList<Hir>();
    for (Map<String, Object> row : rows) {
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
      hir.setHonnan((String) row.get("honnan"));

      result.add(hir);
    }

    return result.get(0);
  }


  public void deleteHir(int hirid) {
    String sql = "DELETE FROM hirek WHERE hirid=" + hirid;
    getJdbcTemplate().update(sql);
  }

  public void updateHir(int hirid, String cim, String kozetevesdatuma, int megtekintesekszama, boolean fontose, String forras, String honnan, String kategoria) {
    String sql = "UPDATE hirek SET cim='" + cim + "', kozetevesdatuma='" + kozetevesdatuma + "', megtekintesekszama='" + megtekintesekszama + "', fontose='" + fontose + "', forras='" + forras + "', honnan = '" + honnan + "' WHERE hirid=" + hirid;
    getJdbcTemplate().update(sql);

    String sql2 = "UPDATE hirkategoriak SET kategoria ='" + kategoria + "' WHERE hirid=" + hirid;
    getJdbcTemplate().update(sql2);
  }

  public void incrementViewCount(int hirid) {
    String sql = "UPDATE hirek SET megtekintesekszama = megtekintesekszama + 1 WHERE hirid = ?";
    getJdbcTemplate().update(sql, hirid);
  }

  public List<Hir> listHirekRovat(String cim) {
    String rovatcime = "";
    switch (cim) {
      case "auto":
        rovatcime = "Autó";
        break;
      case "belfold":
        rovatcime = "Belföld";
        break;
      case "bulvar":
        rovatcime = "Bulvár";
        break;
      case "eletmod":
        rovatcime = "Életmód";
        break;
      case "gazdaság":
        rovatcime = "Gazdaság";
        break;
      case "kulfold":
        rovatcime = "Külföld";
        break;
      case "sport":
        rovatcime = "Sport";
        break;
      case "tech":
        rovatcime = "Tech";
        break;
    }
    String sql = "SELECT * FROM hirkategoriak WHERE kategoria='" + rovatcime + "'";
    List<Map<String, Object>> rows = getJdbcTemplate().queryForList(sql);

    List<Integer> result = new ArrayList<Integer>();
    for (Map<String, Object> row : rows) {
      result.add((Integer) row.get("hirid"));
    }

    List<Hir> result2 = new ArrayList<Hir>();

    for (int i = 0; i < result.size(); i++) {

      String sql2 = "SELECT * FROM hirek WHERE hirid = " + result.get(i);
      List<Map<String, Object>> rows2 = getJdbcTemplate().queryForList(sql2);
      SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
      for (Map<String, Object> row : rows2) {
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
        hir.setHonnan((String) row.get("honnan"));

        hir.setKategoria(getCategoryById(hir.getHirid()));

        result2.add(hir);

      }
    }
    return result2;

  }
}
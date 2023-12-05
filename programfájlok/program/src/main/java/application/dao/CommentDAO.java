package application.dao;

import java.sql.Types;
import java.util.ArrayList;
import java.util.Map;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import application.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.SqlParameterValue;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import application.model.Hir;
import java.text.SimpleDateFormat;

@Repository
public class CommentDAO extends JdbcDaoSupport {

    @Autowired
    DataSource dataSource;

    @Autowired
    UserDAO userDAO;

    @Autowired
    HirDAO hirDAO;

    @PostConstruct
    private void initialize() {
        setDataSource(dataSource);
    }

    public void create(Comment comment){
        String sql = "INSERT INTO kommentek(kozetevesdatuma, tartalom, kozzetevo, hirid) VALUES (?, ?, ?, ?)";

        getJdbcTemplate().update(sql, new Object[] {
                new SqlParameterValue(Types.DATE, comment.getDate()), comment.getContent(), comment.getAuthorName(), comment.getHir().getHirid()
        });
    }

    public List <Comment> read() {
        String sql = "SELECT * FROM kommentek";
        List < Map < String, Object >> rows = getJdbcTemplate().queryForList(sql);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        List <Comment> result = new ArrayList <Comment> ();
        for (Map < String, Object > row: rows) {
            Comment comment = new Comment();
            comment.setId((Integer) row.get("kommentid"));
            Object kozetevesdatumaValue = row.get("kozetevesdatuma");
            if (kozetevesdatumaValue != null) {
                String kozetevesdatumaStr = formatter.format((java.sql.Date) kozetevesdatumaValue);
                comment.setDate(kozetevesdatumaStr);
            } else {
                comment.setDate("");
            }
            comment.setContent((String) row.get("tartalom"));
            comment.setAuthorName((String) row.get("kozzetevo"));
            comment.setHir(hirDAO.getHirById((Integer) row.get("hirid")));

            result.add(comment);
        }

        return result;
    }

    public void update(int id, String date, String content, String authorName, Hir hir) {
        String sql = "UPDATE kommentek SET kozetevesdatuma='" + date + "', tartalom='" + content + "', kozzetevo='" + authorName + "', hirid='" + hir.getHirid() +"' WHERE kommentid=" + id;
        getJdbcTemplate().update(sql);
    }

    public void delete(int id) {
        String sql = "DELETE FROM kommentek WHERE kommentid=" + id;
        getJdbcTemplate().update(sql);
    }

    public Comment getOne(int id){
        String sql = "SELECT * FROM kommentek WHERE kommentid=" + id;
        List < Map < String, Object >> rows = getJdbcTemplate().queryForList(sql);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        List <Comment> result = new ArrayList <Comment> ();
        for (Map < String, Object > row: rows) {
            Comment comment = new Comment();
            comment.setId((Integer) row.get("kommentid"));
            comment.setContent((String) row.get("tartalom"));
            Object kozetevesdatumaValue = row.get("kozetevesdatuma");
            if (kozetevesdatumaValue != null) {
                String kozetevesdatumaStr = formatter.format((java.sql.Date) kozetevesdatumaValue);
                comment.setDate(kozetevesdatumaStr);
            } else {
                comment.setDate("");
            }
            comment.setAuthorName((String) row.get("kozzetevo"));
            comment.setHir(hirDAO.getHirById((Integer) row.get("hirid")));

            result.add(comment);
        }

        return result.get(0);
    }

    public List<Comment> getAll(){
        String sql = "SELECT * FROM kommentek";
        List < Map < String, Object >> rows = getJdbcTemplate().queryForList(sql);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        List <Comment> result = new ArrayList<Comment>();
        for (Map < String, Object > row: rows) {
            Comment comment = new Comment();
            comment.setId((Integer) row.get("kommentid"));
            comment.setContent((String) row.get("tartalom"));
            Object kozetevesdatumaValue = row.get("kozetevesdatuma");
            if (kozetevesdatumaValue != null) {
                String kozetevesdatumaStr = formatter.format((java.sql.Date) kozetevesdatumaValue);
                comment.setDate(kozetevesdatumaStr);
            } else {
                comment.setDate("");
            }
            comment.setAuthorName((String) row.get("kozzetevo"));
            comment.setHir(hirDAO.getHirById((Integer) row.get("hirid")));

            result.add(comment);
        }
        return result;
    }

    public List<Comment> getByNews(int hirid){
        String sql = "SELECT * FROM kommentek WHERE hirid=" + hirid;
        List < Map < String, Object >> rows = getJdbcTemplate().queryForList(sql);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        List <Comment> result = new ArrayList<Comment>();
        for (Map < String, Object > row: rows) {
            Comment comment = new Comment();
            comment.setId((Integer) row.get("kommentid"));
            comment.setContent((String) row.get("tartalom"));
            Object kozetevesdatumaValue = row.get("kozetevesdatuma");
            if (kozetevesdatumaValue != null) {
                String kozetevesdatumaStr = formatter.format((java.sql.Date) kozetevesdatumaValue);
                comment.setDate(kozetevesdatumaStr);
            } else {
                comment.setDate("");
            }
            comment.setAuthorName((String) row.get("kozzetevo"));
            comment.setHir(hirDAO.getHirById((Integer) row.get("hirid")));

            result.add(comment);
        }
        return result;
    }
}
